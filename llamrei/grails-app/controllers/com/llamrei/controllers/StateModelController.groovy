package com.llamrei.controllers

import com.llamrei.domain.State
import com.llamrei.domain.StateRule
import com.llamrei.domain.TimeSeries
import grails.plugins.springsecurity.Secured
import com.llamrei.domain.StateModel
import com.llamrei.domain.Asset

@Secured(['ROLE_ADMIN'])
class StateModelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [stateModelInstanceList: StateModel.list(params), stateModelInstanceTotal: StateModel.count()]
    }

    def create = {
        def stateModelInstance = new StateModel()
        stateModelInstance.properties = params
        return [stateModelInstance: stateModelInstance]
    }

    def save = {
        println ">>params : " + params
        def stateModelInstance = new StateModel(params)
        println "stateModel to be saved : " + stateModelInstance
        if (stateModelInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'stateModel.label', default: 'StateModel'), stateModelInstance.id])}"
            redirect(action: "edit", id: stateModelInstance.id)
        } else {
            render(view: "create", model: [stateModelInstance: stateModelInstance])
        }
    }

    def show = {
        def stateModelInstance = StateModel.get(params.id)
        if (!stateModelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'stateModel.label', default: 'StateModel'), params.id])}"
            redirect(action: "list")
        }
        else {
            [stateModelInstance: stateModelInstance]
        }
    }

    def edit = {
        def stateModelInstance
        if (params.assetId) {
            println "finding state model by asset id " + params.assetId
            Integer assetId = Integer.parseInt(params.assetId)
            stateModelInstance = StateModel.findByAsset(Asset.findById(assetId.longValue()))
        } else if (params.id) {
            println "finding state model by id " + params.id
            stateModelInstance = StateModel.get(params.id)
        }

        if (params.delete) {
            stateModelInstance.name = ""
            stateModelInstance.description = ""
            stateModelInstance.stateModelId = ""

            stateModelInstance?.states?.each {state ->
                println "Deleting state "+state?.id
                state.delete()
            }

            stateModelInstance.states.clear()
        }
        println "State model : " + stateModelInstance


        println "cominggg"
        if (!stateModelInstance) {
            println "not model ins"
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'stateModel.label', default: 'StateModel'), params.id])}"
            redirect(action: "edit")
        }
        else {
            println "model instance"
            return [stateModelInstance: stateModelInstance]
            redirect(controller: StateModel, action: edit)
        }
    }

    def update = {
        println "params in update : "+params
        def stateModelInstance = StateModel.get(params.int('stateModelId'))
        println "found state model : " + stateModelInstance

        //bind manually
        stateModelInstance.name = params['name']
        stateModelInstance.description = params['description']
        stateModelInstance.states.each {state ->
            state.name = params['states.'+state.id+'.name']
            state.description = params['states.'+state.id+'.description']
            state.stateRules.each { stateRule ->
              stateRule.ruleType = params['states.'+state.id+'.stateRules.'+stateRule.id+'.ruleType']
              stateRule.ruleValue1 = params['states.'+state.id+'.stateRules.'+stateRule.id+'.ruleValue1']
              stateRule.timeSeries = TimeSeries.get(params.int(['states.'+state.id+'.stateRules.'+stateRule.id+'.timeSeries']))
            }
        }
        println "stateModel after binding : "+stateModelInstance

        if (!stateModelInstance.hasErrors() && stateModelInstance.save(flush: true)) {
            println "coming inside"
            flash.message = "${message(code: 'default.updated.message', args: [message(code: 'stateModel.label', default: 'StateModel'), stateModelInstance.id])}"
            redirect(action: "edit", id: stateModelInstance.id)
        }
        else {
            render(view: "edit", model: [stateModelInstance: stateModelInstance])
        }
    }

    def copy = {
        println ">>paramsin copy : " + params
        [stateModelId: params.stateModelId]
    }

    def copyStateModel = {
        println ">>paramsin copy state model : " + params

        StateModel stateModelToBeCopied = null
        if (params.assetId) {
            Integer assetId = Integer.parseInt(params.assetId)
            Asset asset = Asset.findById(assetId.longValue())
            stateModelToBeCopied = StateModel.findByAsset(asset)
            println "stateModelToBeCopied : " + stateModelToBeCopied
        }

        StateModel stateModel = null
        if (params.stateModelId) {
            stateModel = StateModel.get(params.stateModelId)
            println("statemodel to copy into : " + stateModel)
        }

        if (null != stateModelToBeCopied && null != stateModel) {
            stateModel.setName(stateModelToBeCopied.name)
            stateModel.setDescription(stateModelToBeCopied.description)
            println "validate :" + stateModel.validate()
            if (stateModel.save(flush: true)) {
                println "statemodel copied"
                redirect(action: 'edit', id: stateModel.id)
            } else {
                flash.message = "Could not copy statemodel"
                redirect(action: 'copy', stateModelId: params.stateModelId)
            }

        } else {
            flash.message = "Could not find asset"
            redirect(action: 'copy', stateModelId: params.stateModelId)
        }
    }

    def addState = {
        println "params in add state : " + params

        StateModel stateModel = StateModel.get(params.int('stateModelId'))
        println "found state model : " + stateModel

        //update existing states
        stateModel.states.each {state ->
            //update the existing states
            state.name = params['states.'+state.id+'.name']
            state.description = params['states.'+state.id+'.description']

            //update the existing state rules
            state.stateRules.each { stateRule ->
                stateRule.ruleType = params['states.'+state.id+'.stateRules.'+stateRule.id+'.ruleType']
                stateRule.ruleValue1 = params['states.'+state.id+'.stateRules.'+stateRule.id+'.ruleValue1']
                stateRule.timeSeries = TimeSeries.get(params.int(['states.'+state.id+'.stateRules.'+stateRule.id+'.timeSeries']))
            }
            println "state to be saved : "+state
            if (state.validate()) {
                state.save(flush: true)
                println "state saved"
            } else {
                println "state not saved"
            }
        }

        //add new state
        State state = new State()
        state.setName(params.state.name)
        state.setDescription(params.state.description)
        state.setStateModel(stateModel)

        println "going to save state : " + state
        StateRule stateRule
        Set<StateRule> stateRules = []
        if (state.validate()) {
            state.save(flush: true)
            println "state saved :)"

            //now save state rules
            println("************************"+params.stateRulesCount)
            if(params.stateRulesCount){
            Integer stateRulesCount = Integer.parseInt(params.stateRulesCount)
            println "stateRulesCount"  + stateRulesCount
            println "stateRules : "  + params["stateRule"]
            for (int i = 0; i < stateRulesCount; i++) {

                stateRule = new StateRule()
                stateRule.setRuleType(params["stateRule.${i}.ruleType"])

                stateRule.setRuleValue1(params["stateRule.${i}.ruleValue"])

                println("###################"+params["stateRule.${i}.timeSeries"])

                Integer timeSeriesId = Integer.parseInt(params["stateRule.${i}.timeSeries"])

                TimeSeries timeSeries = TimeSeries.get(timeSeriesId)
                stateRule.setTimeSeries(timeSeries)
                stateRule.setState(state)
            }
                println "StateRule to be saved : " + stateRule
                println "sr validate : " + stateRule.validate()
                if (stateRule.validate()) {
                    stateRule.save(flush: true)
                    println "state rule saved"

                    stateRules.add(stateRule)
                } else {
                    println "state rule not saved"
                }
            }
            else{
                println("no state rules found");
            }

        } else {
            println "Could not save the state :("
        }

        state.setStateRules(stateRules)
        Set states = stateModel.states
        states.add(state)
        render template: 'states', model: [states: states, stateModelId: stateModel.id]
    }


    def deleteState = {
        println "params in deleteState : " + params
        Integer stateId = Integer.parseInt(params.stateId)
        State state = State.get(stateId)
        state.delete()
        println "state deleted :)"
        render true
    }


    def deleteStateRule = {
        println "params in deleteStateRule : " + params
        Integer stateRuleId = Integer.parseInt(params.stateRuleId)
        StateRule stateRule = StateRule.get(stateRuleId)
        stateRule.delete()
        println "stateRule deleted :)"
        render true
    }

    /*def updateStateRule = {
        println "params in update state rule : "+params
        StateRule stateRule = StateRule.get(Integer.parseInt(params.stateRuleId))
        stateRule.setRuleType(params.ruleType)
        stateRule.setRuleValue1(params.ruleValue)

        TimeSeries timeSeries = TimeSeries.get(Integer.parseInt(params.timeSeriesId))
        stateRule.setTimeSeries(timeSeries)

        println "Going to stateRule : "+stateRule
        stateRule.save(flush: true)
        println "State rule updated :)"
    }


    def updateState = {
        println "params in update state  : "+params
        State state = State.get(Integer.parseInt(params.stateId))
        state.setName(params.name)
        state.setDescription(params.description)

        println "Going to state : "+state
        state.save(flush: true)
        println "State updated :)"
    }
*/

    def addStateRule = {
        println "params in addStateRule : "+params

        Integer stateIdToBeModified = params.int('stateIdToBeModified')
        def stateModelInstance = StateModel.get(params.int('stateModelId'))

        //bind manually
        TimeSeries timeSeries = stateModelInstance.asset.timeSeries.asList()[0]?:TimeSeries.list().get(0)
        stateModelInstance.states.each {state ->

            //update the existing states
            state.name = params['states.'+state.id+'.name']
            state.description = params['states.'+state.id+'.description']

            //update the existing state rules
            state.stateRules.each { stateRule ->
                stateRule.ruleType = params['states.'+state.id+'.stateRules.'+stateRule.id+'.ruleType']
                stateRule.ruleValue1 = params['states.'+state.id+'.stateRules.'+stateRule.id+'.ruleValue1']
                stateRule.timeSeries = TimeSeries.get(params.int(['states.'+state.id+'.stateRules.'+stateRule.id+'.timeSeries']))
            }
            println "state to be saved : "+state
            if (state.validate()) {
                state.save(flush: true)
                println "state saved"
            } else {
                println "state not saved"
            }

            if (state.id == stateIdToBeModified){
                //add a new state rule
                StateRule stateRule = new StateRule()
                stateRule.setRuleType("")
                stateRule.setRuleValue1("")

                stateRule.setTimeSeries(timeSeries)
                stateRule.setState(state)
                println "StateRule to be saved : " + stateRule
                if (stateRule.validate()) {
                    stateRule.save(flush: true)
                    println "state rule saved"

                    state.stateRules.add(stateRule)
                } else {
                    println "state rule not saved"
                }
            }
        }

        render template: 'states', model: [states: stateModelInstance?.states, stateModelId: stateModelInstance?.id]
    }
}


