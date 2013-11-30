package com.llamrei.controllers

import grails.converters.JSON
import java.math.RoundingMode
import java.text.DateFormat
import java.text.SimpleDateFormat
import org.apache.commons.lang.time.DateUtils
import com.llamrei.domain.*

class DashboardController {

//    def dataContentsService

    def dashboardIndex = {

        def contentMap=[:]
        def dataInstanceList
        def assetInstance = Asset.list()
        def timeList=[]
        def headingList=[]
        def assetID
        def countAsset=0;
        def newList=[]
        def tName=[]
        def mapIntialize=false
//        def stateModelList

        assetInstance?.each{astObj ->
            tName<<astObj.timeSeries
            tName.each{
                if(it){
                    timeList.addAll(it)
                }


            }

            timeList.each{
                if(it.inDashboard)
                {

                    if(!headingList.contains(it)){
                        headingList.addAll(it)
                        headingList.sort{it.id}
                    }
                }

            }
        }
        assetInstance?.each{ asset->
            params.sort  ="id"
            params.order   ="desc"
            def timeSeriesList  =[]
            def tempList=[]
            def timeSeriesName=[]
            def finalList=[]
            def stateName=[]
            def tList=[]
            newList=[]
            def noValue=false
            def noTimeSeries=false,inDashBoard=false

            countAsset++
            timeSeriesName<<asset.timeSeries
//            println("========="+timeSeriesName.size())
//            println("sereis==="+timeSeriesName)
            timeSeriesName.each{

                if(it){
                    noTimeSeries=false
                    tList.addAll(it)
                }
                else{
                    noTimeSeries=true
                }
//                if(it.inDashboard)
//                {
//                    timeList.addAll(it)
////                    timeList.sort{it.id}
//                }
            }
//            println("flag========="+tList)
            tList.each{
//                println(it)
                if(it.inDashboard)
                {

                    if(!newList.contains(it)) {

                        newList.addAll(it)
                        newList.sort{it.id}
                        noTimeSeries=false
                        inDashBoard=true
                    }
//                    if(!headingList.contains(it)){
//                        headingList.addAll(it)
//                        headingList.sort{it.id}
//                    }
                }

                else if(inDashBoard==false){

                    noTimeSeries=true
                }
            }


            if(noTimeSeries==false)   {
                dataInstanceList = DataPoint.findAllByAssetAndTimeSeriesInList(asset,newList,params)
            }
//            println("ins==="+dataInstanceList)


//            stateModelList=  StateModel.findAllByAsset(asset)
            def stateModelId=StateModel.executeQuery("select id from StateModel where asset=:asset ",[asset:asset])

            if(stateModelId) {
                stateName<< State.executeQuery("select name from State where stateModel.id=:stateModel order by id desc ",[stateModel:stateModelId[0],max:1])
            }
            else{
                stateName<<"--"
            }

//             println("falg===="+noTimeSeries)
            if(dataInstanceList && noTimeSeries==false){
                  mapIntialize=true
//                countAsset++
                dataInstanceList?.eachWithIndex { data, i ->
//                    println("==meeeeeeeeeeeeeeeeeeeeee"+data.timeSeries.id)
                    if(i==0 && data.timeSeries.inDashboard) {
//                        println("1st if")
                        tempList << data
                        assetID=asset.id

//                        contentMap."${asset.id}" =  [uID:asset.id,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,name:asset.assetName,timeSereisID:data.timeSeries.id,id:data.id,value :[data.value]]
                        contentMap."${countAsset}" =  [uID:asset.id,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,name:asset.assetName,id:data.id]

                        timeSeriesList<<data.timeSeries.id

                    }


                    else if(!(timeSeriesList.contains(data.timeSeries.id)) && data.timeSeries.inDashboard)  {
//                           println("2nd ifff")
                        if(timeSeriesList.size()==0){
                            tempList << data
                            contentMap."${countAsset}" =  [uID:asset.id,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,name:asset.assetName,id:data.id ]
                            timeSeriesList<<data.timeSeries.id
                        }
                        else{
                            tempList<<data
//                          finalList=tempList.sort{it.timeSeries.id}

                            timeSeriesID:[data.timeSeries.id]
                            timeSeriesList<<data.timeSeries.id
                        }


                    }
                    else{
                        noValue=true
                        contentMap."${countAsset}" =  [uID:asset.id,name:asset.assetName,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,id:data.id]
//                        tempList << data
                    }
                }
                finalList=tempList.sort{it.timeSeries.id}



                contentMap."${countAsset}"."value"=[]
                def match=false
                for(int k=0;k<finalList.size();k++){


                    for(int j=0;j<headingList.size();j++){
//                         println("finalist"+finalList.get(k).timeSeries.id)
//                        println("list"+headingList.get(j).id)
//                        println("======"+match)

                        if((finalList.get(k).timeSeries.id==headingList.get(j).id) ){

                            contentMap."${countAsset}"."value"<<finalList.get(k).value
                            match=true
                            if(k<finalList.size()-1){
                           k++;
                            }
//                            j++;
                        }
                        else{
//                            println("noooo")
                            contentMap."${countAsset}"."value"<<"NA"
                        }

                    }


                }

            }
            else{

                if(newList){
                    contentMap."${countAsset}" =  [uID:asset.id,name:asset.assetName,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID]
                    contentMap."${countAsset}"."value"=[]


                    for(int j=0;j<headingList.size();j++){

                        contentMap."${countAsset}"."value"<<"NA"


                    }
                }


            }
            if(newList){
            for(int i=0;i<newList.size();i++){

                if(contentMap.size()>0){
                    if(i==0){
                        contentMap."${countAsset}"."timeSeriesID"=[]
                        contentMap."${countAsset}"."timeSeriesID"<<newList.get(i).id
                    }
                    else{
                        contentMap."${countAsset}"."timeSeriesID"<<newList.get(i).id
                    }
                }

            }
            }

        }



        if(params.updateDashBoard=="true"){
//            println("============@@@@@@@@@@@@"+contentMap)
            render contentMap as JSON
        }
        else{

//            println("@@@@@@@@@@@@"+contentMap)
            render (view: "dashboardIndex", model: [contentmap:contentMap,timeSeriesName:headingList] )
        }

    }


    def chartContents={

        params.sort  ="id"
        params.order   ="desc"
        params.offset=0
        params.max=20
        def conMap=[:]
        def assetIns=Asset.findById(params.assetId)
        def timeIns=TimeSeries.findById(params.timeSeriesId)
        List<DataPoint> dataList=DataPoint.findAllByAssetAndTimeSeries(assetIns,timeIns,params)

        dataList.sort{it.id}

        def  count=0;
           dataList.each{
               conMap."${count}"=[value:it.value,time:it.nodeTimestamp.getTimeString()]
               count++;
           }


        render conMap as JSON


    }


    def nextContent={

        params.sort  ="id"
        params.order ="desc"
        params.max=2
        def conMap=[:]
        def assetIns=Asset.findById(params.assetId)
        def timeIns=TimeSeries.findById(params.timeSeriesId)
        List<DataPoint> dataList=DataPoint.findAllByAssetAndTimeSeries(assetIns,timeIns,params)
//        dataList.sort{it.id}

        def  count=0;

        dataList.each{
             conMap."${count}"=[value:it.value,time:it.nodeTimestamp.getTimeString()]
            count++;
        }
//        println("nxtttttttttttt===============<<<<<<<<<<<"+conMap)
        render conMap as JSON

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

//        println("size==="+dataList.size()+"data=="+dataList.value)
        double ratio= dataList.size()/max

//        println("ratio===="+ratio)
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
//        println("count==="+loopVar)

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

//        println("lsss==="+newDataList.value)
//        println("lsss==="+newDataList.size())

        render dataList.value
    }
}