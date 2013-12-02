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
                        if(dataObject.save(flush:true))
                        isSaved=true
                        else
                        isSaved=false
                        }

              }catch(Exception e){
           e.printStackTrace()
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

   def stateService(String id,Map keyValue,List<TimeSeries> seriesList){

       float oldValue=0.0
       float newValue =0.0
       String newStatus="Power off"
       String reason
       String unit
       String powerId
       int powerValue=0
        def status
        def obj= Asset.findByAssetUniqueID(id)
        def stateModelIns = StateModel.findByAsset(obj)
        def state


        if(stateModelIns!=null){
        state = stateModelIns.states

     //println("#########################"+state)

       state.each{
           status= it.name

         }

       }
     // println(seriesList.size()+status)

           for(int i=0;i<seriesList.size();i++){

             if(seriesList.get(i).name.equalsIgnoreCase("Power")) {
             powerId= seriesList.get(i).timeSeriesUniqueID
             powerValue = Integer.parseInt(keyValue.get(powerId))
             if(powerValue>0) {
              newStatus="Power on"
            }else{
                 newStatus="Power off"
             }
             }
           }
            seriesList.remove(powerId)
        def seriesNameList = new ArrayList<String>()
        def seriesMapKeyValue=new HashMap<String,String>()
        for(int i=0;i<seriesList.size();i++){


           def list = StateRule.findAllByTimeSeries(seriesList.get(i))


         for(StateRule stateRule:list){
             newValue = Float.parseFloat(keyValue.get(seriesList.get(i).timeSeriesUniqueID))
             if(stateRule.ruleValue1=="" && stateRule.ruleValue1==null){
                oldValue  = Float.parseFloat(stateRule.ruleValue1)
            }
          if(stateRule.ruleType=="LT"){
              if(newValue<oldValue){
                  seriesNameList.add(seriesList.get(i).name)
                  seriesMapKeyValue.put(seriesList.get(i).name,newValue)
               }else{
                     seriesNameList.add(seriesList.get(i).name)
                  seriesMapKeyValue.put(seriesList.get(i).name,newValue)
              }
          }else if(stateRule.ruleType=="GT"){
                if(newValue>oldValue){
                    seriesNameList.add(seriesList.get(i).name)
                    seriesMapKeyValue.put(seriesList.get(i).name,newValue)
                }
                }else if(stateRule.ruleType=="EQ"){
                    if(newValue == oldValue){
                      seriesNameList.add(seriesList.get(i).name)
                      seriesMapKeyValue.put(seriesList.get(i).name,newValue)
                }
                }else if(stateRule.ruleType=="NE"){
                   if(newValue != oldValue){
                      seriesNameList.add(seriesList.get(i).name)
                      seriesMapKeyValue.put(seriesList.get(i).name,newValue)
                }
               } else if(stateRule.ruleType=="LE"){
                    if(newValue <= oldValue){
                        seriesNameList.add(seriesList.get(i).name)
                        seriesMapKeyValue.put(seriesList.get(i).name,newValue)
                }
                } else if(stateRule.ruleType=="GE"){
                    if(newValue >= oldValue){
                       seriesNameList.add(seriesList.get(i).name)
                       seriesMapKeyValue.put(seriesList.get(i).name,newValue)
                }
          }
          }
          }

            if(status!=newStatus) {

                  String message= null
                  message= sendAlert(obj,status,newStatus,seriesNameList,seriesMapKeyValue)
                  def alert = new Alerts()
                alert.eventType="STATE TRANSITION"
                alert.created = new Date()
                alert.asset=obj
                alert.details=message.substring(0,254)
                alert.save(flush: true)
                 /* sendAlert(obj,status[0],newStatus)
                 status=newStatus*/
           }


          return  newStatus
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


    def sendAlert(Asset asset, String oldState,String newState,ArrayList<String> seriesNameList,HashMap<String,String> map) {


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
              send =true
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
