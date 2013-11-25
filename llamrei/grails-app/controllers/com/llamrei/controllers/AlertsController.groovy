package com.llamrei.controllers

import com.llamrei.domain.Asset

class AlertsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    def list = {
        def assetIns=Asset.findById(params.id)
        def alerts=assetIns.alerts
        [alertsInstanceList: alerts,assetId:assetIns.id]
    }

}