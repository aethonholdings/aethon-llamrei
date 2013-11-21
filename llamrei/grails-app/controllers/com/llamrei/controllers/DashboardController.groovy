
package com.llamrei.controllers

import com.llamrei.domain.DataPoint
import com.llamrei.domain.StateModel
import grails.converters.JSON
import com.llamrei.domain.Asset
import com.llamrei.domain.DataPoint
import com.llamrei.domain.TimeSeries
import org.apache.commons.lang.time.DateUtils

import java.text.DateFormat
import java.text.SimpleDateFormat


class DashboardController {

    def dataContentsService

    def dashboardIndex = {

        def contentMap=[:]
        def dataInstanceList
        def assetInstance = Asset.list()
        def timeSeriesName
        def stateModelList
        assetInstance?.each{ asset->
            params.sort  ="id"
            params.order   ="desc"
            dataInstanceList = DataPoint.findAllByAsset(asset,params)
            def timeSeriesList  =[]

            stateModelList=  StateModel.findAllByAsset(asset)

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
        render dataList.value


    }


    def nextContent={

        params.sort  ="id"
        params.order   ="desc"
        params.max=2
        def assetIns=Asset.findById(params.assetId)
        def timeIns=TimeSeries.findById(params.timeSeriesId)
        def dataList=DataPoint.findAllByAssetAndTimeSeries(assetIns,timeIns,params)
        render dataList as JSON

    }

    def prevChartContents={
        def max=1000
        Date fromDate = null, toDate = null
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = df.parse(params.selectedFromDate);

        fromDate = new SimpleDateFormat("yyyy-MM-dd").parse(params.selectedFromDate)
        toDate = new SimpleDateFormat("yyyy-MM-dd").parse(params.selectedToDate)

        def assetIns=Asset.findById(params.assetId)
        def timeIns=TimeSeries.findById(params.timeSeriesId)

        Date nextDate=DateUtils.addDays(toDate,  1);
        def  dataList= DataPoint.createCriteria().list {
            eq("asset",assetIns)
            eq("timeSeries",timeIns)
            between("timestamp" ,fromDate,nextDate)
        }


        def ratio= dataList.size()/max +0.1
        println("??????"+a)
        dataList.each{i ->
            if(ratio){

            }
        }

        render dataList.value
    }
}
