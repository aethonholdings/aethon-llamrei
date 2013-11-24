package com.llamrei.domain

class Alerts {

    Date created
    Asset asset
    String details
    String eventType

    static constraints = {
        details(nullable: false)
        eventType(inList: ['STATE TRANSITION'],nullable: false)
        details(nullable: false)
    }
}
