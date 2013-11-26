package com.llamrei.domain

class StateRule {

    String stateRuleId
    String ruleType
    TimeSeries timeSeries
    State state
    String strRule
    String ruleValue1
    String ruleValue2
    static belongsTo = [state: State]
    
    static constraints = {
        stateRuleId(nullable: true)
        strRule(nullable: false)
        ruleValue2(nullable: true)
    }

    static mapping = {
        stateRuleId column: "stateRuleId"
        ruleType column: "ruleType"
        strRule column: "strRule"
        ruleValue1   column  : "ruleValue1"
        ruleValue2   column  : "ruleValue2"
    }

    @Override
    public String toString() {
        return "StateRule{" +
                "id=" + id +
                ", stateRuleId='" + stateRuleId + '\'' +
                ", ruleType='" + ruleType + '\'' +
                ", timeSeriesId='" + timeSeriesId + '\'' +
                ", ruleValue1='" + ruleValue1 + '\'' +
                ", ruleValue2='" + ruleValue2 + '\'' +
                ", version=" + version +
                ", state id=" + state.id +
                '}';
    }
}
