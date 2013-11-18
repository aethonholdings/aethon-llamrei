package com.llamrei.domain

class DataPoint {
    
    /**
     * Relationship mapping
     */    
    Asset asset
    TimeSeries timeSeries
    Date nodeTimestamp
    Date timestamp    //server
    String value
    
    /**
     * Putting constraints with properties
     */
    static constraints = {
        asset(nullable:false)
        timeSeries(nullable:false)
        nodeTimestamp(nullable:false)
        timestamp(nullable:false)
        value(nullable:false)
    }

     /**
     * Mapping to define column names for domain objects in the database with MYSQL
     */
    static mapping = {
    

    }
}
