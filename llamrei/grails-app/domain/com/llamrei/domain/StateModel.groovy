package com.llamrei.domain

class StateModel {
    Asset asset
    static hasMany = [states: State]
    
    static constraints = {
    }
}
