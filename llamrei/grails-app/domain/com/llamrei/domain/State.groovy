package com.llamrei.domain

class State {

    String stateId
    String name
    String description

     static hasMany = [staterules: com.llamrei.domain.StateRule]
    static belongsTo = [statemodel : StateModel]

    static constraints = {

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
