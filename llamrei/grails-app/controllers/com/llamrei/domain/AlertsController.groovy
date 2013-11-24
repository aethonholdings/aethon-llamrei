package com.llamrei.domain

class AlertsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [alertsInstanceList: Alerts.findAllByAsset(params.id), alertsInstanceTotal: Alerts.count()]
    }

    def create = {
        def alertsInstance = new Alerts()
        alertsInstance.properties = params
        return [alertsInstance: alertsInstance]
    }

    def save = {
        def alertsInstance = new Alerts(params)
        if (alertsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'alerts.label', default: 'Alerts'), alertsInstance.id])}"
            redirect(action: "show", id: alertsInstance.id)
        }
        else {
            render(view: "create", model: [alertsInstance: alertsInstance])
        }
    }

    def show = {
        def alertsInstance = Alerts.get(params.id)
        if (!alertsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'alerts.label', default: 'Alerts'), params.id])}"
            redirect(action: "list")
        }
        else {
            [alertsInstance: alertsInstance]
        }
    }

    def edit = {
        def alertsInstance = Alerts.get(params.id)
        if (!alertsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'alerts.label', default: 'Alerts'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [alertsInstance: alertsInstance]
        }
    }

    def update = {
        def alertsInstance = Alerts.get(params.id)
        if (alertsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (alertsInstance.version > version) {
                    
                    alertsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'alerts.label', default: 'Alerts')] as Object[], "Another user has updated this Alerts while you were editing")
                    render(view: "edit", model: [alertsInstance: alertsInstance])
                    return
                }
            }
            alertsInstance.properties = params
            if (!alertsInstance.hasErrors() && alertsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'alerts.label', default: 'Alerts'), alertsInstance.id])}"
                redirect(action: "show", id: alertsInstance.id)
            }
            else {
                render(view: "edit", model: [alertsInstance: alertsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'alerts.label', default: 'Alerts'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def alertsInstance = Alerts.get(params.id)
        if (alertsInstance) {
            try {
                alertsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'alerts.label', default: 'Alerts'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'alerts.label', default: 'Alerts'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'alerts.label', default: 'Alerts'), params.id])}"
            redirect(action: "list")
        }
    }
}
