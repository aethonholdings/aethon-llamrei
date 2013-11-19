
package com.llamrei.controllers

import com.llamrei.domain.DataPoint
import grails.converters.JSON
import com.llamrei.domain.Asset
import com.llamrei.domain.DataPoint
import com.llamrei.domain.TimeSeries


class DashboardController {

    def dataContentsService
    def dashboardIndex = {

    }

    def showContents1={
//
        def contentMap=[:]
        def dataInstanceList
        def assetInstance = Asset.list()
        assetInstance?.each{ asset->
            params.sort  ="id"
            params.order   ="desc"
            dataInstanceList = DataPoint.findAllByAsset(asset,params)

            println("???????????"+dataInstanceList)
            def timeSeriesList     =[]
            dataInstanceList?.eachWithIndex { data, i ->
                if(i==0) {
                    contentMap."${asset.id}" =  [assetId:asset.assetUniqueID,name:asset.assetName,id:data.id,value:data.value ]
                    timeSeriesList<<data.timeSeries.id
                }else if(!(timeSeriesList.contains(data.timeSeries.id)))  {
                    contentMap."${asset.id}"."value${timeSeriesList.size()}"=data.value
                    timeSeriesList<<data.timeSeries.id
                }
            }

        }

        println("================="+contentMap)
        render contentMap as JSON
    }

    def chartContents={
       println("??????"+params.singlePointVal)
        def dataMap=[:]
        params.sort  ="id"
        params.order   ="desc"
        params.max=8
        def assetIns=Asset.findByAssetUniqueID(params.assetId)
        def timeIns=TimeSeries.findById(params.timeSeriesId)
        if(params.singlePointVal==true){
            params.max=1
        }
        else{
            params.max=8
        }
        def dataList=DataPoint.findAllByAssetAndTimeSeries(assetIns,timeIns,params)

        println("?????????????????????"+dataList.value)


        render dataList.value


    }
}
