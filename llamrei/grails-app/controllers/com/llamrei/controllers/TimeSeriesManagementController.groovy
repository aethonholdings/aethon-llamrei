package com.llamrei.controllers

import com.llamrei.domain.DataPoint
import com.llamrei.domain.StateRule
import grails.plugins.springsecurity.Secured
import com.llamrei.domain.TimeSeries

@Secured(['ROLE_ADMIN'])
class TimeSeriesManagementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [timeSeriesInstanceList: TimeSeries.list(params), timeSeriesInstanceTotal: TimeSeries.count()]
    }

    def create = {
        def timeSeriesInstance = new TimeSeries()
        timeSeriesInstance.properties = params
        return [timeSeriesInstance: timeSeriesInstance]
    }

    def save = {
        def timeSeriesInstance = new TimeSeries(params)
        def Boolean inDashboardValue
        if(params.myGroup=='true')
            inDashboardValue=true
        else
            inDashboardValue=false
        timeSeriesInstance.inDashboard= inDashboardValue
        if (timeSeriesInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), timeSeriesInstance.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [timeSeriesInstance: timeSeriesInstance])
        }
    }

    def edit = {
        def timeSeriesInstance = TimeSeries.get(params.id)
        if (!timeSeriesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [timeSeriesInstance: timeSeriesInstance]
        }
    }

    def update = {
        def timeSeriesInstance = TimeSeries.get(params.id)
        if (timeSeriesInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (timeSeriesInstance.version > version) {

                    timeSeriesInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'timeSeries.label', default: 'TimeSeries')] as Object[], "Another user has updated this TimeSeries while you were editing")
                    render(view: "edit", model: [timeSeriesInstance: timeSeriesInstance])
                    return
                }
            }
            timeSeriesInstance.properties = params
            def Boolean inDashboardValue
            if(params.myGroup=='true')
                inDashboardValue=true
            else
                inDashboardValue=false
            timeSeriesInstance.inDashboard=inDashboardValue
            if (!timeSeriesInstance.hasErrors() && timeSeriesInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), timeSeriesInstance.id])}"
                redirect(action: "list")
            }
            else {
                render(view: "edit", model: [timeSeriesInstance: timeSeriesInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def timeSeriesInstance = TimeSeries.get(params.id)
         def assetTimeSeriesInstance=timeSeriesInstance.asset.findAll{it.id}
         if(assetTimeSeriesInstance){
            assetTimeSeriesInstance.each{timeSeriesInstance.removeFromAsset(it)}
        }
        def timeSeriesInStateRule= StateRule.findAllByTimeSeries(timeSeriesInstance)
        if(timeSeriesInStateRule){
            timeSeriesInStateRule.each{it.delete()}
        }
        def dataPointTimeSeriesInstance=DataPoint.findAllByTimeSeries(timeSeriesInstance)
        if(dataPointTimeSeriesInstance){
            dataPointTimeSeriesInstance.each{it.delete()}
        }
        if (timeSeriesInstance) {
            try {
                timeSeriesInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), params.id])}"
            redirect(action: "list")
        }
    }
}