
package com.llamrei.controllers

import com.llamrei.domain.DataPoint
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

    def dataContentsService

    def dashboardIndex = {

        def contentMap=[:]
        def dataInstanceList
        def assetInstance = Asset.list()
        def timeSeriesName=[], timeList=new HashSet()
        def newList=[]
        def assetID

        def stateModelList
        assetInstance?.each{ asset->
            params.sort  ="id"
            params.order   ="desc"
            dataInstanceList = DataPoint.findAllByAsset(asset,params)
            def timeSeriesList  =[]
            def tempList=[]
            def finalList=[]
            def stateName
            stateModelList=  StateModel.findAllByAsset(asset)
            stateModelList.each{ st->
                stateName= st.states.name[0]
                        }

            timeSeriesName<<asset.timeSeries


            timeSeriesName.each{

//                println("kkkkk"+it.inDashboard)
                if(it.inDashboard)   {

                    timeList.addAll(it)


                }
            }

            timeList.each{

                if(it.inDashboard) {

                    if(!newList.contains(it)) {
                    newList.addAll(it)
                        newList.sort{it.id}
                    }
                }
            }


            if(dataInstanceList){

                dataInstanceList?.eachWithIndex { data, i ->

                    if(i==0 && data.timeSeries.inDashboard) {
                         tempList << data
                        assetID=asset.id
                        def valueMap=[:]
//                        contentMap."${asset.id}" =  [uID:asset.id,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,name:asset.assetName,timeSereisID:data.timeSeries.id,id:data.id,value :[data.value]]
                        contentMap."${asset.id}" =  [uID:asset.id,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,name:asset.assetName,id:data.id]

                        timeSeriesList<<data.timeSeries.id

                    }

                    else if(!(timeSeriesList.contains(data.timeSeries.id)) && data.timeSeries.inDashboard)  {

                        if(timeSeriesList.size()==0){
                             tempList << data

                            contentMap."${asset.id}" =  [uID:asset.id,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,name:asset.assetName,id:data.id,value :[data.value] ]
                            timeSeriesList<<data.timeSeries.id
                        }
                        else{

                            tempList<<data
                          finalList=tempList.sort{it.timeSeries.id}


//                        contentMap."${asset.id}"."timeSereisID${timeSeriesList.size()}"=data.timeSeries.id
                            timeSeriesID:[data.timeSeries.id]
//                            contentMap."${asset.id}"."timeSeriesID"<<data.timeSeries.id
                        timeSeriesList<<data.timeSeries.id
                        }


                    }
                }

                for(int i=0;i<finalList.size();i++){

                        if(i==0){
                        contentMap."${asset.id}"."value"=[]
                        contentMap."${asset.id}"."value"<<finalList.get(i).value
//                       contentMap."${asset.id}"."timeSeriesID"<<data.timeSeries.id
                        }
                    else{
                    contentMap."${asset.id}"."value"<<finalList.get(i).value
                        }

                }
            }
            else{
//                contentMap."${asset.id}" =  [assetId:"",name:asset.assetName,connection:asset.connectivityStatus,stateName:stateName,assetId:asset.assetUniqueID,id:"",value:"" ,value1:""]
//                timeSeriesList<<"a"


            }
        }

        for(int i=0;i<newList.size();i++){

            if(i==0){
                contentMap."${assetID}"."timeSeriesID"=[]

                       contentMap."${assetID}"."timeSeriesID"<<newList.get(i).id
            }
            else{
                contentMap."${assetID}"."timeSeriesID"<<newList.get(i).id
            }

        }


        if(params.updateDashBoard=="true"){

            render contentMap as JSON
        }
        else{

//            println("============@@@@@@@@@@@@"+contentMap)
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
