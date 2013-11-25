package com.llamrei.domain

class AlertsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    def list = {
        println("HELLO KULDEEP"+params)
        def assetIns=Asset.findById(params.id)
        def alerts=assetIns.alerts
        [alertsInstanceList: alerts,assetId:assetIns.id]
    }

}