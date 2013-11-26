package com.llamrei.controllers

import com.llamrei.domain.Asset
import com.llamrei.domain.Alerts
import com.llamrei.domain.DataPoint
import com.llamrei.domain.TimeSeries
import grails.converters.JSON

class AssetMonitorController {

    def assetMonitorList = {

        [assetInstanceList: Asset.list(params), assetInstanceTotal: Asset.count()]
    }

    def assetMonitorDetail={

        def contentMap=[:]
        params.sort  ="id"
        params.order   ="desc"
        params.max=1
        def assetIns=Asset.findById(params.assetId)
        def timeSeriesList=assetIns.timeSeries
        def alerts= Alerts.findAllByAsset(assetIns,[max:10])
        def count=0;
        timeSeriesList?.eachWithIndex{  time, i ->

        def dataList=DataPoint.findAllByAssetAndTimeSeries(assetIns,time,params)

        contentMap."${count}" = [assetId:assetIns.id,  name:assetIns.assetName,clientName:assetIns.clientName,location:assetIns.location,timeSeriesName:time.name,unit:time.units,value:dataList.value[0],imageUrl:assetIns.imageurl,alerts:alerts ]
        count++
        }
      if(params.nextVal=="true"){

          render contentMap as JSON
      }  else{
          [contentMap:contentMap,assetId:assetIns.id,name:assetIns.assetName,clientName:assetIns.clientName,location:assetIns.location, imageUrl:assetIns.imageurl,alerts:alerts]
      }


//        render contentMap as JSON

    }
}
