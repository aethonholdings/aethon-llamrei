package com.llamrei.domain

class StateModel {
    String name
    String description
    String stateModelId

    boolean deleted
    Asset asset
    static hasMany = [states:State]
    
    static constraints = {
    }

    static transients = [ 'deleted' ]

    static mapping = {
        stateModelId column: "stateModelId"
        name column: "name"
        description column: "description"
        states cascade:"all-delete-orphan"
    }


    @Override
    public String toString() {
        return "StateModel{" +
                "id=" + id +
                ", asset=" + asset +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", stateModelId='" + stateModelId + '\'' +
                ", version=" + version +
                ", states=" + states +
                '}';
    }
}
