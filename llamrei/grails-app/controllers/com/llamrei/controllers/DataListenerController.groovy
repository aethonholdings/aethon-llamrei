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

class DataListenerController {


     DataSeriesService dataSeriesService

        String msg=null
        def listener = {
        /**
         * Retreiving the data coming from node
         */
        println(params)
        String id = params.getProperty("id")
            println(id)
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
       List<TimeSeries> tsSeriesList = new ArrayList<TimeSeries>()
            tsList = TimeSeries.list()
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

            for(int i=0;i<tsli.size();i++){
               tsSeriesList.add(tsList.get(i))
            }


        /**
         * Invoking the service to save the data into database
         */
        // dataSeriesService.saveDataToDB(id,time,dataQueue,tsList)

                  dataSeriesService.saveDataToDB(id,time,seriesList,tsList)


                  def  stateName=dataSeriesService.stateService(id,map,tsSeriesList)
                     StateModel stateModel=StateModel.findByAsset(assetInstance)
                     Set<State> state = new HashSet<State>()
                      def stateIns =State.findByStateModel(stateModel)
                     if(stateName!=null){
                     stateIns.name=stateName
                     state .add(stateIns)
                     stateModel.setStates(state)
                     redirect(controller: "stateModel", action: "update", stateModelIns:stateModel)
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
                //second for good connection
                long minLog = 15
                //minuts
                long timeout = 2
                String status = "Connected"
                List<Asset> assetList = Asset.list()
                List<Asset> updatedAssetList = new ArrayList<Asset>()

                   for(Asset asset:assetList){
                    params.clear()
                    params.sort  ="id"
                    params.order   ="desc"
                    params.max=1
                    def assetIns=Asset.findById(asset.id)
                   def dataList=DataPoint.findByAsset(assetIns,params)
                   // dataList=null
                       if(!dataList==null){
                           Date assetTime = dataList.getNodeTimestamp()
                           Date serverT   = dataList.getTimestamp()
                       }else{
                           log.info("there is no data_point")
                       }

                    Date currentTime = new Date()
                    diffSeconds = dataSeriesService.timeDifferenceSeconds(assetTime,serverT)
                    if(diffSeconds<=minLog)
                    status ="Good"
                    else
                    status="Poor"
                   diffMinuts  = dataSeriesService.timeDifferenceInMinute(currentTime,serverT)
                        if(diffMinuts>2)
                        status= "Disconnected"
                       // println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+asset.assetName+" is "+status)

                        assetIns.connectivityStatus=status
                        updatedAssetList.add(assetIns)
                      }
                     redirect(controller: "assetManagement", action: "updateAsset", assetList:assetList)


         }

}