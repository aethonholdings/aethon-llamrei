package com.llamrei.controllers

import com.llamrei.domain.*
import groovy.time.TimeCategory

class ListenerController {

    def index = {
        
        if(params.id!=null) {
            def thisAsset = Asset.findByAssetUniqueID(params.id)
            if(thisAsset!=null) {
                render("ACK")
                def thisNodeTimeStamp = new Date().parse("yyyy|mm|dd|hh|mm|ss", params?.getProperty("T"))
                def thisServerTimeStamp = new Date()
                if(thisNodeTimeStamp != null) {
                    for (param in params) {
                        if(param?.key.length()==4) {
                            def thisTimeSeries = TimeSeries.findByTimeSeriesUniqueID(param.key)
                            if(thisTimeSeries!=null) {
                                def thisDataPoint = new DataPoint(asset: thisAsset, timeSeries: thisTimeSeries, nodeTimestamp: thisNodeTimeStamp, timestamp: thisServerTimeStamp, value: param.value)
                                thisDataPoint.save(flush: true)
                            }
                        }
                    }
                }
            } else {
                render("FORBIDDEN")    
            }
        } else {
            render("FORBIDDEN")
        }
    }    
}