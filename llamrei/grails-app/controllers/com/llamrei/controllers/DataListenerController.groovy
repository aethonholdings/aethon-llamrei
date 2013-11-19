package com.llamrei.controllers

import com.llamrei.services.DataSeriesService
import com.llamrei.domain.Asset

class DataListenerController {

  DataSeriesService dataSeriesService
             String msg=null
    def listener = {

        /**
         * Retreiving the data coming from node
         */
       // println("==========="+params)
        String id = params.getProperty("id")
        if(!(id==null || id=="")){
       // println("Already Exists  "+id)
        if(Asset.findByAssetUniqueID(id)){
        //log.info("Already Exists")
        String time = params.getProperty("T")
        time=time.replace("|"," ")

        /**
         * creating list for dataSeries
         */

        /*Queue<String> dataQueue=new LinkedList<String>();
        dataQueue.add(params.getProperty("0001"))
        dataQueue.add(params.getProperty("0002"))*/

        ArrayList seriesList = new ArrayList()
        seriesList.add(params.getProperty("0001"))
        seriesList.add(params.getProperty("0002"))

        /**
         * Invoking the service to save the data into database
         */
         //dataSeriesService.saveDataToDB(id,time,dataQueue)
         dataSeriesService.saveDataToDB(id,time,seriesList)
          msg="ACK"
        }else{
               msg="Asset does not exists, So can not be saved the dataseries for this Asset"
              log.info("Asset does not exists, So can not be saved the dataseries for this Asset")
             }
            }else{
            msg = "No device Found"
            println("id is blank")
        }
        render msg
    }
}