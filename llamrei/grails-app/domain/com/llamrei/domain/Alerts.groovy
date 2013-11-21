package com.llamrei.domain

class Alerts {


    Date created
    String details
    String eventType
    static belongsTo = [asset:Asset]
    static constraints = {
        details(nullable: false)
        asset(nullable:false)
        eventType(inList: ['STATE TRANSITION'],nullable: false)
        details(nullable: false)
    }
}
