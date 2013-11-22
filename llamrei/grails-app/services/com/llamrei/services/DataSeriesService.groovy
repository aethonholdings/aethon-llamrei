package com.llamrei.services

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
    def boolean saveDataToDB(String id, String time, ArrayList seriesList,List<TimeSeries> tsIns) {
           SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss")
             try
              {
                Date date = simpleDateFormat.parse(time);
                  for(int i=0;i<seriesList.size();i++){
                      try{
                       def dataObject = new DataPoint()
                       dataObject.value=seriesList.get(i)
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
           e.printStackTrace()
           }
          }
              }catch (ParseException ex) {
           log.info("Exception "+ex);
       }
        return  true
    }

   def stateService(String id,Map keyValue,List<TimeSeries> seriesList){


        def obj= Asset.findByAssetUniqueID(id)
        def stateModelIns = StateModel.findByAsset(obj)

        def state = stateModelIns.states
    //   println("#########################"+obj1)
         def status= state.name
        for(int i=0;i<seriesList.size();i++){
        def list = StateRule.findAllByTimeSeries(seriesList.get(i))

         for(StateRule stateRule:list){
            def newValue  = Float.parseFloat(keyValue.get(seriesList.get(i).timeSeriesUniqueID))
            def oldValue  = Float.parseFloat(stateRule.ruleValue1)
          if(stateRule.ruleType=="<"){
              if(newValue<oldValue)
                state.name="Stoped"
          }else if(stateRule.ruleType==">"){
                if(newValue>oldValue)
                state.name="Stoped"
          }
          }
          }
         stateModelIns.states.name = state.name

          return  stateModelIns
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

            println("Time Difference 7777777777777777777++++++++++"+diffSeconds)
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
                println("Time Difference 7777777777777777777++++++++++"+diffMinutes)
            }catch(Exception e){
                 e.printStackTrace()
            }
        return diffMinutes
        }



   }


