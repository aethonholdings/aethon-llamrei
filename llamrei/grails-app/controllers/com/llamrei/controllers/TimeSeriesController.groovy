package com.llamrei.controllers

import com.llamrei.domain.TimeSeries

class TimeSeriesController {

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
        if (timeSeriesInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), timeSeriesInstance.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [timeSeriesInstance: timeSeriesInstance])
        }
    }

//    def show = {
//        def timeSeriesInstance = TimeSeries.get(params.timeSeriesUniqueID)
//        if (!timeSeriesInstance) {
//            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), params.id])}"
//            redirect(action: "list")
//        }
//        else {
//            [timeSeriesInstance: timeSeriesInstance]
//        }
//    }

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
            if (!timeSeriesInstance.hasErrors() && timeSeriesInstance.save(flush: true)) {
                println("hello kuldeep")
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
        println('hello kuldeep'+ params.id)
        def timeSeriesInstance = TimeSeries.get(params.id)
        if (timeSeriesInstance) {
            try {
                timeSeriesInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'timeSeries.label', default: 'TimeSeries'), params.id])}"
            redirect(action: "list")
        }
    }
}
