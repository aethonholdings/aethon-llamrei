
package com.llamrei.controllers

import grails.plugins.springsecurity.Secured
import grails.converters.JSON
import com.llamrei.domain.Asset
import com.llamrei.domain.DataPoint
import com.llamrei.domain.TimeSeries

@Secured(['ROLE_OPERATOR'])
class DashboardController {

    def dataContentsService
    def dashboardIndex = {

    }

        def showContents1= {
        
        def contentMap=[:]
        def dataInstanceList
        def assetInstance = Asset.list()
        assetInstance?.each{ asset->
            params.sort  ="id"
            params.order   ="desc"
            dataInstanceList = DataPoint.findAllByAsset(asset,params)
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
