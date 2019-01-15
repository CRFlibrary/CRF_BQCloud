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
import argparse
import threading
import logging
from google.cloud import pubsub_v1

class oraclestreamtopubsub(threading.Thread):
    def __init__(self, config):
        threading.Thread.__init__(self)
        self.config = config
        self.connectstr = config["connectstr"]
        self.queryfields = config["queryfields"]
        self.queryvals = config["queryvals"]
        self.queryrel = config["queryrel"]
        self.fields = config["fields"]
        self.tname = config["tname"]
        self.topic_name = config["topic_name"]
        self.project_id = config["project_id"]
        self.gcred = config["gcred"]
        # Create the Logger
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)

        # Create the Handler for logging data to a file
        logger_handler = logging.FileHandler(config["topic_name"] + ".log")
        logger_handler.setLevel(logging.DEBUG)

        # Create a Formatter for formatting the log messages
        logger_formatter = logging.Formatter('%(name)s - %(levelname)s - %(message)s')

        # Add the Formatter to the Handler
        logger_handler.setFormatter(logger_formatter)

        # Add the Handler to the Logger
        self.logger.addHandler(logger_handler)
        self.logger.info('Completed configuring logger()!')

    def getdbcnt(self):
        db1 = cx_Oracle.connect(self.connectstr)
        if (len(self.queryfields)>0):
            querystr = " WHERE "
            for itr in range(0,len(self.queryfields)):
                if (itr == 0):
                    querystr = querystr + self.queryfields[itr] + " " + self.queryrel[itr] +" " + str(self.queryvals[itr])
                else:
                    querystr = querystr + " AND " + self.queryfields[itr] + " " + self.queryrel[itr] +" " + str(self.queryvals[itr])
        cursor = db1.cursor()
        cursor.execute("SELECT count(*) FROM "+self.tname + querystr)
        res=cursor.fetchall()
        return(res[0][0])

    def getfeeddata(self,flds,vals,rel):
        db1 = cx_Oracle.connect(self.connectstr)
        if (len(flds)>0):
            querystr = " WHERE "
            for itr in range(0,len(flds)):
                if (itr == 0):
                    querystr = querystr + flds[itr] + " " + rel[itr] +" " + str(vals[itr])
                else:
                    querystr = querystr + " AND " + flds[itr] + " " + rel[itr] +" " + str(vals[itr])
        cursor = db1.cursor()
        cursor.execute("SELECT " + self.fields + " FROM "+self.tname + querystr)
        colnames = [row[0] for row in cursor.description]
        res=cursor.fetchall()
        return res, colnames

    def callback(self,message_future):
        # When timeout is unspecified, the exception method waits indefinitely.
        if message_future.exception(timeout=30):
            print('Publishing message threw an Exception {}.'.format(message_future.exception()))
        else:
            print(message_future.result())

    def run(self):
        startcnt = self.getdbcnt()
        os.environ["GOOGLE_APPLICATION_CREDENTIALS"]=self.gcred
        publisher = pubsub_v1.PublisherClient()
        topic_path = publisher.topic_path( self.project_id,  self.topic_name)
        while True:
            currcnt = self.getdbcnt()
            flds = copy.copy(self.queryfields)
            vals = copy.copy(self.queryvals)
            rel = copy.copy(self.queryrel)
            flds.append("ROWNUM")
            vals.append(startcnt)
            rel.append(">")
            datalist , colnames = self.getfeeddata(flds,vals,rel)
            for item in datalist:
                msgdict=dict()
                itr=0
                for col in colnames:
                    msgdict[col] = item[itr]
                    itr=itr+1
                msg = str(msgdict).encode('utf-8')
                message_future = publisher.publish(topic_path, data=msg)
                message_future.add_done_callback(self.callback)
            startcnt = currcnt



def main(config):
    app = oraclestreamtopubsub(config)
    app.run()

if __name__=='__main__':
    with open('orcltopubsub.json') as f:
        data = json.load(f)
    parser = argparse.ArgumentParser()
    parser.add_argument('--whichconf', dest='whichconf',default=0, help='which config in json')
    args = parser.parse_args()
    config = data[args.whichconf]
    main(config)
    
    
    
    
    



