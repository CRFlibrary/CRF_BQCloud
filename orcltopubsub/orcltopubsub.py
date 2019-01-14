#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sun Jan 13 13:27:44 2019

@author: abhishekray
"""

import time
import cx_Oracle
import argparser
import json
import sys
import os
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
    res=cursor.fetchall()
    return res

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
        datalist = getfeeddata(connectstr,queryfields.append("ROWNUM"),queryvals.append(startcnt),queryrel.append(">"),fields,tname)
        startcnt = currcnt
        datalist = str(datalist).encode('utf-8')
        # When you publish a message, the client returns a Future.
        message_future = publisher.publish(topic_path, data=datalist)
        message_future.add_done_callback(callback)
        


if __name__=='__main__':
    with open('orcltopubsub.json') as f:
        data = json.load(f)
    config = data[int(sys.argv[1])]
    main(config)
    
    
    
    
    



