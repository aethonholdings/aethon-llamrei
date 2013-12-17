package com.llamrei.controllers

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

import java.math.RoundingMode
import java.text.DateFormat
import java.text.SimpleDateFormat
import org.apache.commons.lang.time.DateUtils
import com.llamrei.domain.*


// this needs to be secured
 @Secured(['ROLE_FINANCE','ROLE_ADMIN'])
class DashboardController {

    def clockService
    
    def view = {
        render (view: 'dashboard', model: [timeStamp: clockService.timeStamp(), timeSeriesList: TimeSeries.findAllByInDashboard(true), assetList: Asset.getAll(), NodeTimeStampeList:DataPoint ])
    }
    
    def update = {
        
        Date timeStamp = clockService.timeStamp()
        println(">>>>>>>>>>>>>>> "+timeStamp)
        def updateFrame = [timeStamp: timeStamp]
        
        for(asset in Asset.getAll()){
            for(timeSeries in TimeSeries.findAllByInDashboard(true)) {
                def dataPoint = DataPoint.findByTimeSeriesAndAsset(timeSeries, asset , [max:1, sort:"nodeTimestamp", order:"desc"])
               if(dataPoint) {
                    String key = (dataPoint.asset.assetUniqueID + "." + dataPoint.timeSeries.timeSeriesUniqueID)
                    String nodeTimestamp=(dataPoint.asset.assetUniqueID)
                   String nodeTimestampValue = dataPoint.nodeTimestamp
                    updateFrame += [ (key) : dataPoint.value ]
                    updateFrame += [(nodeTimestamp):nodeTimestampValue]
//                     println(">>>>>>>>>>>>>>> "+nodeTimestampValue)

                }
            }
        }
        render updateFrame as JSON
    }
}