package com.llamrei.domain

class State {

    static belongsTo = [stateModel: StateModel]
    static hasMany = [stateRules: StateRule]
    
    static constraints = {
        String stateId
        String name
        String description
    }

    static mapping = {
        stateId column: "stateId"
        name column: "name"
        description column: "description"
    }

    @Override
    public String toString() {
        return "State{" +
                "id=" + id +
                ", stateId='" + stateId + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", version=" + version +
                ", staterules=" + staterules +
                ", statemodel=" + statemodel +
                '}';
    }
}

