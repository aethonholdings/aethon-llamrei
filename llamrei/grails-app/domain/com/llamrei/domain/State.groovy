package com.llamrei.domain

class State {

    static belongsTo = [stateModel: StateModel]
    static hasMany = [stateRules: StateRule]
    

        String stateId
        String name
        String description

     static constraints = {
         stateId(nullable: true)
         stateModel(nullable: true)
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
                ", statemodel id=" + stateModel.id +
                ", staterules=" + stateRules +
                '}';
    }
}

