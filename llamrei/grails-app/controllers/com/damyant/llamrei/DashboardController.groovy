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
        println("content page")
        def contentMap=[:]
        def dataInstanceList
        def assetInstance = Asset.list()
        def timeSeriesList=TimeSeries.list()
        assetInstance?.each{ asset->
            params.sort  ="id"
            params.order   ="desc"
            dataInstanceList = DataSeries.findAllByAsset(asset,params)
          dataInstanceList?.eachWithIndex { data, i ->
                     if(i==0)
                      contentMap."${asset.id}" =  [name:asset.assetName,id:data.id,value:[data.value] ]
                      else  {

                     }



            }
            /*content= dataContentsService.showData(dataInstance,it)
            println("@@@@@@@@@=="+content)*/
        }
        println contentMap
        def a=contentMap as JSON
        println("????"+a)

        render contentMap as JSON
    }
}
