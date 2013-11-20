package com.llamrei.domain

import org.apache.commons.collections.FactoryUtils
import org.apache.commons.collections.list.LazyList

class StateModel {
    String name
    String description
    String stateModelId

    boolean deleted
    Asset asset
    static hasMany = [states:State]
    
    static constraints = {
//        stateModelId(unique: true)

    }

    static transients = [ 'deleted' ]

    static mapping = {
        stateModelId column: "stateModelId"
        name column: "name"
        description column: "description"
        states cascade:"all-delete-orphan"
    }
//    def getStatesList() {
//        return LazyList.decorate(
//                states,
//                FactoryUtils.instantiateFactory(State.class))
//    }

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
