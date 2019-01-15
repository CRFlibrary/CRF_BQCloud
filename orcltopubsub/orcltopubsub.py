#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sun Jan 13 13:27:44 2019

@author: abhishekray
"""

import cx_Oracle
import json
import os
import copy
import sys
from google.cloud import pubsub_v1


def getdbcnt(connectstr,queryfields,queryvals,queryrel,fields,tname):
    db1 = cx_Oracle.connect(connectstr)
    if (len(queryfields)>0):
        querystr = " WHERE "
        for itr in range(0,len(queryfields)):
            if (itr == 0):
                querystr = querystr + queryfields[itr] + " " + queryrel[itr] +" " + str(queryvals[itr])
            else:
                querystr = querystr + " AND " + queryfields[itr] + " " + queryrel[itr] +" " + str(queryvals[itr])
    cursor = db1.cursor()
    cursor.execute("SELECT count(*) FROM "+tname + querystr)
    res=cursor.fetchall()
    return(res[0][0])



def getfeeddata(connectstr,queryfields,queryvals,queryrel,fields,tname):
    db1 = cx_Oracle.connect(connectstr)
    if (len(queryfields)>0):
        querystr = " WHERE "
        for itr in range(0,len(queryfields)):
            if (itr == 0):
                querystr = querystr + queryfields[itr] + " " + queryrel[itr] +" " + str(queryvals[itr])
            else:
                querystr = querystr + " AND " + queryfields[itr] + " " + queryrel[itr] +" " + str(queryvals[itr])
    cursor = db1.cursor()
    cursor.execute("SELECT " + fields + " FROM "+tname + querystr)
    colnames = [row[0] for row in cursor.description]
    res=cursor.fetchall()
    return res, colnames

def callback(message_future):
    # When timeout is unspecified, the exception method waits indefinitely.
    if message_future.exception(timeout=30):
        print('Publishing message threw an Exception {}.'.format(message_future.exception()))
    else:
        print(message_future.result())

def main(config):
    connectstr=config["connectstr"]
    queryfields=config["queryfields"]
    queryvals=config["queryvals"]
    queryrel=config["queryrel"]
    fields=config["fields"]
    tname=config["tname"]
    topic_name=config["topic_name"]
    project_id=config["project_id"]
    startcnt = getdbcnt(connectstr,queryfields,queryvals,queryrel,fields,tname)
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"]=config["gcred"]
    publisher = pubsub_v1.PublisherClient()
    topic_path = publisher.topic_path(project_id, topic_name)

    while True:
        currcnt = getdbcnt(connectstr,queryfields,queryvals,queryrel,fields,tname)
        flds = copy.copy(queryfields)
        vals = copy.copy(queryvals)
        rel = copy.copy(queryrel)
        flds.append("ROWNUM")
        vals.append(startcnt)
        rel.append(">")
        datalist , colnames = getfeeddata(connectstr,flds,vals,rel,fields,tname)
        for item in datalist:
            msgdict=dict()
            itr=0
            for col in colnames:
                msgdict[col] = item[itr]
                itr=itr+1
            msg = str(msgdict).encode('utf-8')
            message_future = publisher.publish(topic_path, data=msg)
            message_future.add_done_callback(callback)
        startcnt = currcnt

if __name__=='__main__':
    with open('orcltopubsub.json') as f:
        data = json.load(f)
    config = data[sys.argv[0]]
    main(config)
    
    
    
    
    



