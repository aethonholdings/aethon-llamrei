package com.llamrei.services

import java.text.SimpleDateFormat
import java.text.ParseException
import com.llamrei.domain.DataPoint
import com.llamrei.domain.Asset
import com.llamrei.domain.TimeSeries

class DataSeriesService {

    static transactional = true

    def boolean saveDataToDB(String id, String time, ArrayList seriesList ) {
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
                       dataObject.timeSeries=TimeSeries.findByTimeSeriesUniqueID("000"+(i+1))
                       dataObject.save(flush:true)

              }catch(Exception e){
           e.printStackTrace()
           }
         }
             }catch (ParseException ex) {
           System.out.println("Exception "+ex);
       }
        return  true
    }

    def boolean saveDataToDB(String id, String time, Queue dataQueue ) {
           SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss")
             try
              {
                Date date = simpleDateFormat.parse(time);
               /* System.out.println("date : "+simpleDateFormat.format(date));
               println("==========##############====="+seriesList.size())
               println("????date=="+date+"<<<<<<<<<<<<"+date.getClass())*/


                  Iterator it=dataQueue.iterator();
                   int i=0
                  while(it.hasNext()){

                    try{
                       def dataObject = new DataPoint()
                       dataObject.value=it.next()
                       dataObject.nodeTimestamp=date
                       dataObject.timestamp= new Date()
                       dataObject.asset=Asset.findByAssetUniqueID(id)
                       dataObject.timeSeries=TimeSeries.findByTimeSeriesUniqueID("000"+(i+1))
                       // println("************************************")
                       dataObject.save(flush:true)

              }catch(Exception e){
           e.printStackTrace()
           }
          }

             }catch (ParseException ex) {
           System.out.println("Exception "+ex);
       }
        return  true
    }
}
