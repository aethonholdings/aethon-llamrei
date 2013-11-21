package com.llamrei.controllers

import com.llamrei.services.DataSeriesService
import com.llamrei.domain.Asset
import com.llamrei.domain.TimeSeries

class DataListenerController {

     DataSeriesService dataSeriesService
     String msg=null
     def listener = {

        /**
         * Retreiving the data coming from node
         */
        String id = params.getProperty("id")
        if(!(id==null || id=="")){
        def assetInstance = Asset.findByAssetUniqueID(id)
        if(assetInstance){
        String time = params.getProperty("T")
        time=time.replace("|"," ")

        /**
         * creating list for dataSeries
         */
        /*Queue<String> dataQueue=new LinkedList<String>();
        dataQueue.add(params.getProperty("0001"))
        dataQueue.add(params.getProperty("0002"))*/

        List<TimeSeries> tsList = new ArrayList<TimeSeries>()
        tsList = TimeSeries.list()
        ArrayList seriesList = new ArrayList()
        for(TimeSeries series: tsList) {
          String value= params.getProperty(series.timeSeriesUniqueID)
          if(value!=null || value!="")
           seriesList.add(value)
          }
        /**
         * Invoking the service to save the data into database
         */
         //dataSeriesService.saveDataToDB(id,time,dataQueue,tsList)
         dataSeriesService.saveDataToDB(id,time,seriesList,tsList)
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