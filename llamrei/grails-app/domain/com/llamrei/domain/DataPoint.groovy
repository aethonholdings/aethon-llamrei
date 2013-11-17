package com.llamrei.domain

class DataPoint {

    Date nodeTimestamp
    Date timestamp    //server
    String value
    
    static belongsTo = [dataSeries: DataSeries]

    static constraints = {
        nodeTimestampe(nullable:false)
        timestamp(nullable:false)
        value(nullable:false)
        dataSeries(nullable:false)
    }
}
