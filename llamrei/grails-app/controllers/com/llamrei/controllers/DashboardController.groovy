
package com.llamrei.controllers

import com.llamrei.domain.DataPoint
import grails.converters.JSON
import com.llamrei.domain.Asset
import com.llamrei.domain.DataPoint
import com.llamrei.domain.TimeSeries


class DashboardController {

    def dataContentsService

    def dashboardIndex = {

        def contentMap=[:]
        def dataInstanceList
        def assetInstance = Asset.list()
        def timeSeriesName
        assetInstance?.each{ asset->
            params.sort  ="id"
            params.order   ="desc"
            dataInstanceList = DataPoint.findAllByAsset(asset,params)
            def timeSeriesList  =[]



            if(dataInstanceList){
//                timeSeriesName=asset.timeSeries.name

        timeSeriesName = asset.timeSeries.find{it.inDashboard}

                dataInstanceList?.eachWithIndex { data, i ->

                    if(i==0) {
                        contentMap."${asset.id}" =  [uID:asset.id,assetId:asset.assetUniqueID,name:asset.assetName,timeSereisID:data.timeSeries.id,id:data.id,value:data.value ]
                        timeSeriesList<<data.timeSeries.id
                        }
                    else if(!(timeSeriesList.contains(data.timeSeries.id)))  {
                        contentMap."${asset.id}"."value${timeSeriesList.size()}"=data.value
                        timeSeriesList<<data.timeSeries.id

                    }
                }
            }
            else{
                contentMap."${asset.id}" =  [assetId:"",name:asset.assetName,id:"",value:"" ,value1:""]
                timeSeriesList<<"a"


            }
        }


        if(params.updateDashBoard=="true"){


            render contentMap as JSON
        }
        else{


        render (view: "dashboardIndex", model: [contentmap:contentMap,timeSeriesName:timeSeriesName] )
        }

    }


    def chartContents={

        params.sort  ="id"
        params.order   ="desc"
        params.max=30
        def assetIns=Asset.findById(params.assetId)
        def timeIns=TimeSeries.findById(params.timeSeriesId)
        def dataList=DataPoint.findAllByAssetAndTimeSeries(assetIns,timeIns,params)
        println("======="+dataList)
        render dataList.value


    }


    def nextContent={

        params.sort  ="id"
        params.order   ="desc"
        params.max=2
        def assetIns=Asset.findById(params.assetId)
        def timeIns=TimeSeries.findById(params.timeSeriesId)

        def dataList=DataPoint.findAllByAssetAndTimeSeries(assetIns,timeIns,params)
       println("next value==="+dataList.id)
        render dataList as JSON

    }
}
