package com.llamrei.controllers

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

import java.math.RoundingMode
import java.text.DateFormat
import java.text.SimpleDateFormat
import org.apache.commons.lang.time.DateUtils
import com.llamrei.domain.*


// this needs to be secured
 @Secured(["ROLE_OPERATOR"])
class DashboardController {

    def clockService
    
    def view = {
        render (view: 'dashboard', model: [timeStamp: clockService.timeStamp(), timeSeriesList: TimeSeries.findAllByInDashboard(true), assetList: Asset.getAll(), NodeTimeStampeList:DataPoint ])
    }
    
    def update = {
        
        Date timeStamp = clockService.timeStamp()

        def updateFrame = [timeStamp: timeStamp]
        
        for(asset in Asset.getAll()){
            for(timeSeries in TimeSeries.findAllByInDashboard(true)) {
                def dataPoint = DataPoint.findByTimeSeriesAndAsset(timeSeries, asset , [max:1, sort:"nodeTimestamp", order:"desc"])
                if(dataPoint) {
                    String key = (dataPoint.asset.assetUniqueID + "." + dataPoint.timeSeries.timeSeriesUniqueID)
                    String nodeTimestamp=(dataPoint.asset.assetUniqueID)
                    String nodeTimestampValue = dataPoint.nodeTimestamp
                    updateFrame += [(key): dataPoint.value ]
                    updateFrame += [(nodeTimestamp):nodeTimestampValue]
                }
            }
        }
        render updateFrame as JSON
    }

     def chartContents={

         params.sort  ="id"
         params.order   ="desc"
//         params.offset=0
         params.max=28
         def conMap=[:]
         def assetIns=Asset.findById(params.assetId)
         def timeIns=TimeSeries.findById(params.timeSeriesId)
         List<DataPoint> dataList=DataPoint.findAllByAssetAndTimeSeries(assetIns,timeIns,params)
         dataList.sort{it.id}
         def  count=0;
         dataList.each{
             conMap."${count}"=[value:it.value,time:it.nodeTimestamp.getTimeString(),name:timeIns.name]
             count++;
         }
//         println("*************"+conMap)
         render conMap as JSON
     }
     def nextContent={
         params.sort  ="id"
         params.order ="desc"
         params.max=2
         def conMap=[:]
         def assetIns=Asset.findById(params.assetId)
         def timeIns=TimeSeries.findById(params.timeSeriesId)
         List<DataPoint> dataList=DataPoint.findAllByAssetAndTimeSeries(assetIns,timeIns,params)
         def  count=0;
         dataList.each{
             conMap."${count}"=[value:it.value,time:it.nodeTimestamp.getTimeString()]
             count++;
         }
         render conMap as JSON

     }
}