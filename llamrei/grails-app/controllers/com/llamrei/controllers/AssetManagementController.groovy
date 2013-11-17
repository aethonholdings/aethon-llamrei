package com.llamrei.controllers

import grails.plugins.springsecurity.Secured
import com.llamrei.services.UtilityService
import com.llamrei.domain.Asset
import com.llamrei.domain.TimeSeries
import grails.converters.JSON
import com.llamrei.domain.StateModel
import com.llamrei.utils.Constants

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
                //Save statemodel for this asset
                //find this saved instance
                Asset asset = Asset.findByAssetUniqueID(assetUniqueId);
                println "The saved asset is : "+asset

                //Pass this saved asset instance to be referenced in stateModel
                saveSateModel(asset)

                flash.message = "${message(code: 'default.asset.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])}"
                redirect(action: "listAssets", id: assetInstance.id)
            } else {
                render(view: "createAssets", model: [assetInstance: assetInstance])
            }
        }else{
            flash.message = "${message(code: 'default.assetunique.id.error', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])}"
            render(view: "createAssets", model: [assetInstance: assetInstance])
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
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])}"
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
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
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

    def editStateModel ={
        def stateModelInstance = new StateModel(params)
       stateModelInstance= Asset.get(params.id)

       if (!stateModelInstance) {
           flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
           redirect(controller: StateModel, action: "edit")
       }
       else {
           render(controllerName: StateModel, view: "edit", model: [stateModelInstance: stateModelInstance])

       }


   }

   void saveSateModel(assetInstance){
       def stateModelInstance =new StateModel()
       stateModelInstance.setAsset(assetInstance)
       stateModelInstance.setName(Constants.STATE_MODEL_DEFAULT_NAME)
       stateModelInstance.setDescription(Constants.STATE_MODEL_DEFAULT_DESCRIPTION)
       stateModelInstance.setStateModelId(Constants.STATE_MODEL_DEFAULT_STATE_MODEL_ID)

       println "Going to save statemodel : "+stateModelInstance
       println "validate :"+stateModelInstance.validate()
       if (stateModelInstance.save(flush: true)){
           println "Saved stateModel"
       } else{
           println "Statemodel not saved"
       }
    }
}
