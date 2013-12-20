package com.llamrei.services

import com.llamrei.domain.Alerts
import com.llamrei.domain.SecRole
import com.llamrei.domain.SecUser
import com.llamrei.domain.SecUserSecRole

import java.text.SimpleDateFormat
import java.text.ParseException
import com.llamrei.domain.DataPoint
import com.llamrei.domain.Asset
import com.llamrei.domain.TimeSeries
import com.llamrei.domain.State
import com.llamrei.domain.StateModel
import org.apache.tomcat.util.digester.Rule
import com.llamrei.domain.StateRule
import java.sql.Time

class DataSeriesService {

    static transactional = true
    boolean isSaved=false
    def mailService
    def boolean saveDataToDB(String id, String time, ArrayList seriesList,List<TimeSeries> tsIns) {
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        Date date
        try
        {
            try {
                date = ft.parse(time);

            } catch (ParseException e) {
                log.info("Unparseable using " + time);
            }

            for(int i=0;i<seriesList.size();i++){
                try{
                    def dataObject = new DataPoint()
                    dataObject.value=seriesList.get(i)
                    dataObject.nodeTimestamp=date
                    dataObject.timestamp= new Date()

                    dataObject.asset=Asset.findByAssetUniqueID(id)
                    if(tsIns.get(i)){
                        dataObject.timeSeries=TimeSeries.findByTimeSeriesUniqueID(tsIns.get(i).timeSeriesUniqueID)
                        if(!dataObject.hasErrors() && dataObject.save(flush:true))
                            isSaved=true
                        else
                            isSaved=false
                    }

                }catch(Exception e){
                    log.info("Exception on saving data point "+e);
                }
            }
        }catch (ParseException ex) {
            log.info("Exception "+ex);
        }
        return  isSaved
    }

    def boolean saveDataToDB(String id, String time, Queue dataQueue, List<TimeSeries> tsIns ) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss")
        try
        {
            Date date = simpleDateFormat.parse(time);
            Iterator it=dataQueue.iterator();
            int i=0
            while(it.hasNext()){

                try{
                    def dataObject = new DataPoint()
                    dataObject.value=it.next()
                    dataObject.nodeTimestamp=date
                    dataObject.timestamp= new Date()
                    dataObject.asset=Asset.findByAssetUniqueID(id)
                    dataObject.timeSeries=TimeSeries.findByTimeSeriesUniqueID(tsIns.get(i).timeSeriesUniqueID)
                    dataObject.save(flush:true)

                    if(dataObject)
                        isSaved=true
                    else
                        isSaved=false
                }catch(Exception e){
                    log.info(e.printStackTrace())
                }
            }
        }catch (ParseException ex) {
            log.info("Exception "+ex);
        }
        return  true
    }


    def boolean stateService(assetInstance,Map keyValue,List<TimeSeries> seriesList){
        def activeState=null;
        boolean isTrue= true;
        boolean sendMail=false;
//        def assetInstance= Asset.findById(id)
        def previousState = assetInstance.currentState
//        println("asset previous state is "+ previousState)
        def stateModel= StateModel.findByAsset(assetInstance)
//        println("this is the stateModel "+stateModel)
        def states= State.findAllByStateModel(stateModel)
        for( state in states){
            for (timeSeries in seriesList){
                def value= Integer.valueOf(String.valueOf(keyValue.get(timeSeries.timeSeriesUniqueID)))
                def stateRules = StateRule.findAllByState(state)
                for (stateRule in stateRules){
                    def String ruleType=stateRule.ruleType
                    if(stateRule.timeSeriesId==timeSeries.id)  {

//                     println("insideeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee 2 checking for this rule type"+ ruleType)
                        if(ruleType=="GT") {
                            if(value > stateRule.ruleValue1){
                                println("1")
                                isTrue=true
                            }
                            else{
                                println("in else"+ruleType)
                                isTrue=false
                                break;
                            }
                        }
                        if(ruleType=="LT") {
                            if(value < stateRule.ruleValue1){
                                println("1")
                                isTrue=true
                            }
                            else{
                                println("in else"+ruleType)
                                isTrue=false
                                break;
                            }
                        }
                        if(ruleType=="EQ") {
                            println("value of rule from database "+stateRule.ruleValue1.getClass())
                            if(value == Integer.parseInt(stateRule.ruleValue1)){
                                println("in if block")
                                isTrue=true
                            }
                            else{
                                println("in else "+ruleType)
                                isTrue=false
                                break;
                            }
                        }
                        if(ruleType=="NQ") {
                            if(value != stateRule.ruleValue1){
                                println("1")
                                isTrue=true
                            }
                            else{
                                println("in else"+ruleType)
                                isTrue=false
                                break;
                            }
                        }
                        if(ruleType=="LE") {
                            if(value <= stateRule.ruleValue1){
                                println("1")
                                isTrue=true
                            }
                            else{
                                println("in else"+ruleType)
                                isTrue=false
                                break;
                            }
                        }
                        if(ruleType=="GE") {
                            if(value >= stateRule.ruleValue1){
                                println("1")
                                isTrue=true
                            }
                            else{
                                println("in else"+ruleType)
                                isTrue=false
                                break;
                            }
                        }

                    }
                }
            }
            if(isTrue==true){
                println("this state is validated "+ state.name)
                activeState= state.name
                break;
            }
            else{
                println("this state is failed "+state.name)
                continue;
            }
        }
        if(activeState==previousState){
            println("Asset state is not changed")
        }
        else{
            println("ready for sending mail")
            assetInstance.currentState=activeState
            sendMail=true;
            def message = sendAlert(assetInstance, previousState,activeState)
            def alert= new Alerts()
            alert.asset=assetInstance
            alert.created= new Date();
            message=message.replace("  ","")
            alert.details=message
            alert.eventType='STATE TRANSITION'
            if(alert.save(flush:true)){
                println("new Alert saved successfully");
            }
            else{
                println("alert is not saved error occurred")
            }

        }
        return sendMail
    }


    def timeDifferenceSeconds(Date assetT, Date serverT){

        long  diffSeconds
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
        Date serverTime =null
        Date nodeTime = null
        try {
            serverTime =new Date()

            //in milliseconds
            double diff = serverT.getTime() - assetT.getTime();
            diffSeconds = diff / 1000 % 60
        }catch(Exception e){
            e.printStackTrace()
        }
        return  diffSeconds
    }

    def timeDifferenceInMinute(Date curr , Date serverT){

        long  diffMinutes
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
        /* Date serverTime =null
         Date nodeTime = null*/
        try {
            double diff = curr.getTime() - serverT.getTime();
            diffMinutes = diff / (60 * 1000) % 60
        }catch(Exception e){
            e.printStackTrace()
        }
        return diffMinutes
    }


    def String sendAlert(Asset asset, String oldState,String newState) {


        String to1 = '', from = '', senderName = '', subject1 = '', message = '', renderMessage = '', emailId=''
        Boolean send = false
        def list = SecUserSecRole.findAllBySecRole(SecRole.get(1))
        def operatorList
        list.each{
            operatorList = SecUser.findAllById(it.secUserId)

            operatorList.each {
                def operator = it
//
                if(operator){
                    emailId=operator.email
                    send = true
                }
                else{
                    renderMessage= 'Sorry,we are not able to find the username.'
                }

                if (send) {

                    subject1 = "State Transition Alert of State"
                    message = """Dear Operater,\n
                   A state transition for asset  ${asset.assetName.trim()} has occured:\n
                    Asset Name    : ${asset.assetName.trim()}\n
                    Previous state: ${oldState}\n
                    New State     : ${newState}\n
                                                                  \n\nThanks and Regards,\n
 Administrative  Team"""
                    mailService.sendMail {
                        to(emailId)
                        subject(subject1)
                        body(message)
                    }
                }else {
                    println(renderMessage)
                }

            }

        }
        println("Mail Sent")
        return message
    }
}
