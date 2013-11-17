package com.llamrei.controllers

import grails.plugins.springsecurity.Secured
import com.llamrei.services.UtilityService
import com.llamrei.domain.Asset
import com.llamrei.domain.TimeSeries
import com.llamrei.domain.AssociateTimeSeries
import grails.converters.JSON

@Secured(['ROLE_ADMIN'])
class AssetManagementController {
    
    def index = { redirect(action: 'listAssets') }
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    UtilityService utilityService
    
    def listAssets = {
        // params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assetInstanceList: Asset.list(params), assetInstanceTotal: Asset.count()]
    }

    def createAsset = {
        def assetInstance = new Asset()
        assetInstance.properties = params
        return [assetInstance: assetInstance]
    }

    def saveAsset = {
        
        def assetInstance = new Asset(params)
        def assetUniqueId = utilityService.uniqueIdFormat()
        if(!Asset.findByAssetUniqueID(assetUniqueId)){
            assetInstance.assetUniqueID = assetUniqueId
            assetInstance.creationDate = new Date()
            assetInstance.modificationDate = new Date()
            if (assetInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.asset.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])}"
            redirect(action: "listAssets", id: assetInstance.id)
        }
        else {
            render(view: "createAsset", model: [assetInstance: assetInstance])
        }
       }else{

        }
    }

    def showAsset = {
        def assetInstance = Asset.get(params.id)
        if (!assetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
            redirect(action: "listAssets")
        }
        else {
            [assetInstance: assetInstance]
        }
    }

    def editAsset = {
        def assetInstance = Asset.get(params.id)

        if (!assetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
            redirect(action: "listAssets")
        }
        else {
            return [assetInstance: assetInstance]
        }
    }

    def updateAsset = {
        def assetInstance = Asset.get(params.id)
        if (assetInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (assetInstance.version > version) {
                    
                    assetInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'asset.label', default: 'Asset')] as Object[], "Another user has updated this Asset while you were editing")
                    render(view: "editAssets", model: [assetInstance: assetInstance])
                    return
                }
            }
            assetInstance.properties = params
            if (!assetInstance.hasErrors() && assetInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.asset.updated.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])}"
                redirect(action: "listAssets", id: assetInstance.id)
            }
            else {
                render(view: "editAssets", model: [assetInstance: assetInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
            redirect(action: "listAssets")
        }
    }

    def deleteAsset = {
        def assetInstance = Asset.get(params.id)
        if (assetInstance) {
            try {
                assetInstance.delete(flush: true)
                flash.message = "${message(code: 'default.asset.deleted.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
                redirect(action: "listAssets")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
                redirect(action: "listAssets", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
            redirect(action: "listAssets")
        }
    }

    def editStateModel = {

    }

    /**
     * action to associate asset with TimeSeries
     */
    def goToAssociateTimeSeries ={
        def assetInstance = Asset.get(params.id)
      /*  println("&&&&&&&&&&&&&&&&&&&&&&&"+params.id)*/
        def timeSeries = TimeSeries.findAll()
        def associatedTimeSeries = AssociateTimeSeries.findByAsset(assetInstance)


      /*  println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+timeSeries)*/
        if (!assetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
            redirect(action: "listAssets")
        }
        else {
            return [assetInstance: assetInstance,timeSeries:timeSeries,associatedTimeSeries:associatedTimeSeries ]
        }

    }

    def associateTimeSeries = {

            def id = params.id
            def associateTimeSeries
            def arrayOfId
        try{
             arrayOfId=JSON.parse(params.hiddenField)
        }catch(Exception ex){
            log.info(""+ex)
          redirect(action: "listAssets")
        }
         arrayOfId.each{
            if(it){
            associateTimeSeries = new AssociateTimeSeries()
            associateTimeSeries.asset = Asset.findById(id)
            associateTimeSeries.timeSeries = TimeSeries.findById(it)
            associateTimeSeries.save(flush: true)
           }
         }

        if (!associateTimeSeries) {
            flash.message = "${message(code: 'default.asset.message', args: [message(code: 'asset.label', default: 'Asset'), associateTimeSeries.id])}"
            redirect(action: "listAssets")
           }
        else {
            redirect(action: "listAssets")
        }
    }
}