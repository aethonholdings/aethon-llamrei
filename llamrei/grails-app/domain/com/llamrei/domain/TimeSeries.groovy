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
    Boolean inDashboard

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
         asset(nullable: true)
//        units(unique: true)
        inDashboard(nullable:false)
        name(nullable: false,unique: true, blank:false)
        units(nullable: false, blank:false)
        dataType(inList: ['INTEGER', 'LONG INTEGER', 'UNSIBNED INTEGER','UNSIGNED LONG INTEGER', 'FLOAT','STRING','BOOLEAN', 'DATETIME' ])
        // data type needs to be constrained to specific values (FLOAT, BOOLEAN, INT, LONG INT, UNSIGNED INT, UNSIGNED LONG INT, STRING)

    }

    /**
     * Mapping to define column names for domain objects in the database
     */
    static mapping = {
        timeSeriesUniqueID column: "timeSeriesUniqueID"
        dataType column :"dataType"
        asset cascade:'none'
    }
}