package com.llamrei.domain

class TimeSeries {

    /**
     * properties of Assets
     * instance Variables
     */
     String timeSeriesUniqueID
     String name
     String description
     String units
     String dataType

    /**
     * Relationship mapping
     */
    
       static hasMany = [asset:Asset]
       static belongsTo = Asset
     /**
     * Putting constraints with properties
     */
    static constraints = {
        timeSeriesUniqueID(nullable: false,unique: true, blank:false)
        name(nullable: false,unique: true, blank:false)
        units(nullable: false, unique: true, blank:false)
        // data type needs to be constrained to specific values (FLOAT, BOOLEAN, INT, LONG INT, UNSIGNED INT, UNSIGNED LONG INT, STRING)

    }

     /**
     * Mapping to define column names for domain objects in the database
     */
    static mapping = {
    timeSeriesUniqueID column: "timeSeriesUniqueID"
    dataType column :"dataType"
    }
}
