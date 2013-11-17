package com.llamrei.domain

class DataSeries {
    
    /**
     * Relationship mapping
     */    
    Asset asset
    TimeSeries timeSeries
    static hasMany = [dataPoints: DataPoint]
    
    /**
     * Putting constraints with properties
     */
    static constraints = {
        asset(nullable:false)
        timeSeries(nullable:false)
    }

     /**
     * Mapping to define column names for domain objects in the database with MYSQL
     */
    static mapping = {
    

    }
}
