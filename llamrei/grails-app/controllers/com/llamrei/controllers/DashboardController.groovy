
package com.llamrei.controllers

import com.llamrei.domain.DataPoint
import com.llamrei.domain.State
import com.llamrei.domain.StateModel
import grails.converters.JSON
import com.llamrei.domain.Asset
import com.llamrei.domain.DataPoint
import com.llamrei.domain.TimeSeries
import org.apache.commons.lang.time.DateUtils

import java.math.RoundingMode
import java.text.DateFormat
import java.text.DecimalFormat
import java.text.SimpleDateFormat


class DashboardController {

//    def dataContentsService

    def dashboardIndex = {

        def contentMap=[:]
        def dataInstanceList
        def assetInstance = Asset.list()
        def timeSeriesName=[], timeList=new HashSet()
        def newList=[]
        def assetID
        def countAsset=1;
//        def stateModelList
        assetInstance?.each{ asset->
            params.sort  ="id"
            params.order   ="desc"
//            params.max=3
//            println("asettt==="+asset)
            dataInstanceList = DataPoint.findAllByAsset(asset,params)
            def timeSeriesList  =[]
            def tempList=[]
            def finalList=[]
            def stateName=[]
//            stateModelList=  StateModel.findAllByAsset(asset)
            def stateModelId=StateModel.executeQuery("select id from StateModel where asset=:asset ",[asset:asset])

            if(stateModelId) {
                stateName<< State.executeQuery("select name from State where stateModel.id=:stateModel order by id desc ",[stateModel:stateModelId[0],max:1])
            }
            else{
                stateName<<"--"
            }

            timeSeriesName<<asset.timeSeries
            timeSeriesName.each{

//                println("kkkkk"+it.inDashboard)
                if(it.inDashboard)   {
                    timeList.addAll(it)
                }
            }

            timeList.each{
                if(it.inDashboard)
                {
                    if(!newList.contains(it)) {
                        newList.addAll(it)
                        newList.sort{it.id}
                    }
                }
            }

//            println("<<<<<<<<<<<<<<"+newList)
            if(dataInstanceList){

                dataInstanceList?.eachWithIndex { data, i ->

                    if(i==0 && data.timeSeries.inDashboard) {
//                        println("1st if")
                        tempList << data
                        assetID=asset.id

//                        contentMap."${asset.id}" =  [uID:asset.id,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,name:asset.assetName,timeSereisID:data.timeSeries.id,id:data.id,value :[data.value]]
                        contentMap."${countAsset}" =  [uID:asset.id,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,name:asset.assetName,id:data.id]

                        timeSeriesList<<data.timeSeries.id
//                        println("list=="+timeSeriesList)
//                        println("data==="+data.timeSeries.id)
//                        println("npard=="+(timeSeriesList.contains(data.timeSeries.id)))
                    }


                    else if(!(timeSeriesList.contains(data.timeSeries.id)) && data.timeSeries.inDashboard)  {
//                        println("2nd if")
                        if(timeSeriesList.size()==0){
                            tempList << data
                            contentMap."${countAsset}" =  [uID:asset.id,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,name:asset.assetName,id:data.id ]
                            timeSeriesList<<data.timeSeries.id
                        }
                        else{
//                            println("3rd if")
                            tempList<<data
//                          finalList=tempList.sort{it.timeSeries.id}

                            timeSeriesID:[data.timeSeries.id]
                            timeSeriesList<<data.timeSeries.id
                        }


                    }
                    else{
//                        tempList << data
                    }
                }
                finalList=tempList.sort{it.timeSeries.id}
//                println("finalListsize====="+finalList)
//                println("finalListsize====="+finalList.size())
                for(int i=0;i<finalList.size();i++){

                    if(i==0){
                        contentMap."${countAsset}"."value"=[]
                        contentMap."${countAsset}"."value"<<finalList.get(i).value
//                       contentMap."${asset.id}"."timeSeriesID"<<data.timeSeries.id
                    }
                    else{
                        contentMap."${countAsset}"."value"<<finalList.get(i).value
                    }

                }
                for(int i=0;i<newList.size();i++){
//                    println("LLLLLLLLL"+i)
//                    println("<<<<<"+newList.get(i).id)
                    if(i==0){
                        contentMap."${countAsset}"."timeSeriesID"=[]
                        contentMap."${countAsset}"."timeSeriesID"<<newList.get(i).id
                    }
                    else{
                        contentMap."${countAsset}"."timeSeriesID"<<newList.get(i).id
                    }

                }
            }
            else{
//                println("meeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
//                contentMap."${asset.id}" =  [assetId:"",name:asset.assetName,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,id:"",value:"" ,value1:""]
//                timeSeriesList<<"a"

            }
//            for(int i=0;i<newList.size();i++){
//                   println("LLLLLLLLL"+i)
//                println("<<<<<"+newList.get(i).id)
//                if(i==0){
//                    contentMap."${countAsset}"."timeSeriesID"=[]
//                    contentMap."${countAsset}"."timeSeriesID"<<newList.get(i).id
//                }
//                else{
//                    contentMap."${countAsset}"."timeSeriesID"<<newList.get(i).id
//                }
//
//            }
            countAsset++
        }



        if(params.updateDashBoard=="true"){
//            println("============@@@@@@@@@@@@"+contentMap)
            render contentMap as JSON
        }
        else{

//            println("@@@@@@@@@@@@"+contentMap)
            render (view: "dashboardIndex", model: [contentmap:contentMap,timeSeriesName:newList] )
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
        def newDataList=[]
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

        println("size==="+dataList.size()+"data=="+dataList.value)
        double ratio= dataList.size()/max

        println("ratio===="+ratio)
        def roundOF=(int)Math.ceil(ratio)

        double currentVal = Math.floor(ratio * 100) / 100;
        BigDecimal bd = new BigDecimal( currentVal - Math.floor( currentVal ));
        bd = bd.setScale(1,RoundingMode.HALF_DOWN);
        String[] splitter = bd.toString().split("\\.");
        def secondVal=Integer.parseInt(splitter[1])
//        println("###########"+secondVal)
        def loopVar=10-secondVal
        if(loopVar==10){
            loopVar==0
        }
        println("count==="+loopVar)

        def count=loopVar
        def test=0
        for( int i=0;i<dataList.size;i++){

            if(i!=loopVar) {
                newDataList<<dataList.get(i)
            }
            else{
                loopVar++;;
            }

        }

        println("lsss==="+newDataList.value)
        println("lsss==="+newDataList.size())

        render dataList.value
    }
}
