package com.llamrei.controllers

import com.llamrei.domain.Alerts
import com.llamrei.domain.State
import com.llamrei.services.DataSeriesService
import com.llamrei.domain.Asset
import com.llamrei.domain.TimeSeries
import java.text.SimpleDateFormat
import com.llamrei.domain.DataPoint
import javax.xml.crypto.Data
import com.llamrei.domain.StateModel
import java.lang.reflect.Array
import grails.converters.JSON
import javassist.runtime.Desc

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

         println(time)
        /**
         * creating list for dataSeries
         */
        /*Queue<String> dataQueue=new LinkedList<String>();
        dataQueue.add(params.getProperty("0001"))
        dataQueue.add(params.getProperty("0002"))*/

       List<TimeSeries> tsList = new ArrayList<TimeSeries>()
       List<TimeSeries> tsSeriesList = new ArrayList<TimeSeries>()
       List<TimeSeries> tsListClone
            def associatedTs= assetInstance.timeSeries
            associatedTs.each{
               tsList.add(it)
            }
           // tsList.add(assetInstance.timeSeries)
           // println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"+tsList)
          ArrayList seriesList = new ArrayList()
          ArrayList tsli = new ArrayList()
          Map<String,String> map = new HashMap<String, String>()
            for(TimeSeries series: tsList) {
              String tsId=series.timeSeriesUniqueID
              String value= params.getProperty(series.timeSeriesUniqueID)
              if(value!=null && value!=""){
               seriesList.add(value)
               map.put(tsId,value)
               tsli.add(tsId)
              }else{
                  log.info("Data point does not contains value")
              }
            }

            tsListClone = tsList.clone()
            for(int i=0;i<tsli.size();i++){
               tsSeriesList.add(tsListClone.get(i))
            }


        /**
         * Invoking the service to save the data into database
         */
        // dataSeriesService.saveDataToDB(id,time,dataQueue,tsList)

                 def isSaved= dataSeriesService.saveDataToDB(id,time,seriesList,tsList)
                      println(isSaved)
                     if(isSaved){
                     def  stateMap=dataSeriesService.stateService(id,map,tsSeriesList)
                     def stateName =  stateMap.get("newStatus")
                     def oldState= stateMap.get("status")

                     StateModel stateModel=StateModel.findByAsset(assetInstance)

                     if(stateModel!=null){
                        params.sort="id"
                        params.order="desc"
                        params.max=1
                      def stateIns =State.findByStateModel(stateModel,params)

                     if(stateName!=null && stateIns!=null){
                     stateIns.name=stateName
                     stateIns.save(flush:true)

                     dataSeriesService.sendAlert(assetInstance,oldState,stateName)
                    }
                     }  else{
                         msg="Please Edit Asset State Model"
                     }
                     }
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

    /**
     * action to check the nodeConnectivity Status
     * @returns connectivity status
     */
         def checkConnectivityStatus = {
                long diffSeconds
                long diffMinuts

                def testMap=[:]
                testMap.flag="checked"
                //second for good connection
                long minLog = 15
                //minuts
                long timeout = 2

                String connectivityStatus
                String newStatus = "Connected"

                def assetTime
                def serverT
                List<Asset> assetList = Asset.list()
                List<Asset> updatedAssetList = new ArrayList<Asset>()

                   for(Asset asset:assetList){

                    params.clear()
                    params.sort  ="id"
                    params.order ="desc"
                    params.max=1
                    def assetIns=Asset.findById(asset.id)
                     connectivityStatus=assetIns.connectivityStatus
                   def dataList=DataPoint.findByAsset(assetIns,params)
                   // dataList=null
                       if(dataList!=null){
                          assetTime = dataList.getNodeTimestamp()
                          serverT   = dataList.getTimestamp()

                    Date currentTime = new Date()
                    diffSeconds = dataSeriesService.timeDifferenceSeconds(assetTime,serverT)
                    if(diffSeconds<=minLog)
                    newStatus ="Good"
                    else
                    newStatus="Poor"
                    diffMinuts  = dataSeriesService.timeDifferenceInMinute(currentTime,serverT)
                        if(diffMinuts>2)
                        newStatus= "Disconnected"
                     } else{
                           log.info("there is no data_point")
                       }
                         if(connectivityStatus!=newStatus){
                         assetIns.connectivityStatus=newStatus
                         updatedAssetList.add(assetIns)
                   }
                   }
                     if(updatedAssetList.size()>0){
                         println("?????????????????")

                     redirect(controller: "assetManagement", action: "updateAsset", params:[fromAction:"connectivity" ,assetList:updatedAssetList])
                     }else{
                         // println("?????????????????")
                       log.info("there is no data_point")
                          render testMap as JSON
                       }
                   }
       }

