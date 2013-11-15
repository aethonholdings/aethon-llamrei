
package com.damyant.llamrei
import grails.converters.JSON
import llamreiAssets.Asset
import llamreiAssets.DataSeries
import llamreiAssets.TimeSeries


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
            dataInstanceList = DataSeries.findAllByAsset(asset,params)
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

    }
}
