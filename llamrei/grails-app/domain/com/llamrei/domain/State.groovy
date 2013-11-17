package com.llamrei.domain

class State {

    static belongsTo = [stateModel: StateModel]
    static hasMany = [stateRules: StateRule]
    
    static constraints = {
    }
}
