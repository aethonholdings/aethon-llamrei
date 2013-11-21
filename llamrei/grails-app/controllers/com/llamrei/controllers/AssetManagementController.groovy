package com.llamrei.controllers

import grails.plugins.springsecurity.Secured
import com.llamrei.services.UtilityService
import com.llamrei.services.FileUploadService
import com.llamrei.domain.Asset
import com.llamrei.domain.TimeSeries
import grails.converters.JSON
import com.llamrei.domain.StateModel
import com.llamrei.utils.Constants

@Secured(['ROLE_ADMIN'])
class AssetManagementController {
    FileUploadService fileUploadService
    def index = { redirect(action: 'listAssets') }
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST",saveAsset: "POST"]
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
        
       def assetInstance = new Asset()
       def assetUniqueId = utilityService.uniqueIdFormat()
            assetInstance.assetName=params.assetName
            assetInstance.clientName=params.clientName
            assetInstance.description=params.description
            assetInstance.location=params.location
            assetInstance.assetUniqueID=assetUniqueId
            assetInstance.creationDate = new Date()
            assetInstance.modificationDate = new Date()
            if ( assetInstance.validate()&& assetInstance.save()) {
                //Save statemodel for this asset
                //find this saved instance
                Asset asset = Asset.findByAssetUniqueID(assetUniqueId);
                println "The saved asset is : "+asset
                //Pass this saved asset instance to be referenced in stateModel
                saveSateModel(asset)
                def imageurl = params.uploadedFile
                if  (!imageurl?.empty && imageurl)  {
                    assetInstance = fileUploadService.uploadFile(assetInstance, imageurl)
                }
                flash.message = "${message(code: 'default.asset.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance])}"
                redirect(action: "listAssets", id: assetInstance)
            } else {
                flash.message = "${message(code: 'default.assetunique.id.error', args: [message(code: 'asset.label', default: 'Asset'), assetInstance])}"
                render(view: "createAsset", model: [assetInstance: assetInstance])
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
                def imageurl = params.uploadedFile
                if  (!imageurl?.empty && imageurl)  {
                    if(assetInstance.imageurl) {
                    assetInstance.imageurl.empty
                    }
                    assetInstance = fileUploadService.uploadFile(assetInstance, imageurl)
                }
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance])}"
                redirect(action: "listAssets", id: assetInstance)

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
        def assetStateModelInstance=  StateModel.findByAsset(assetInstance)


        if(assetStateModelInstance){
            assetStateModelInstance.delete(flush:true)
        }
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

//    def editStateModel = {
//
//    }

    /**
     * action to associate asset with TimeSeries
     */
    def goToAssociateTimeSeries ={
        def assetInstance = Asset.get(params.id)
        def timeSeries = TimeSeries.findAll()
        if (!assetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
            redirect(action: "listAssets")
        }
        else {
            return [assetInstance: assetInstance,timeSeries:timeSeries]
        }

    }

    def associateTimeSeries = {
        def assetId = params.id
        def associateTimeSeries
        def arrayOfId
        try{
            arrayOfId=JSON.parse(params.hiddenField)
        }catch(Exception e){
            log.info("JSON Object is empty"+e)
            redirect(action: "listAssets")
        }

        List<Integer> tsIdList;
        tsIdList= new ArrayList<Integer>()
        arrayOfId.each{
            if(it){
                tsIdList.add((long)Integer.parseInt(it))
            }
        }
        Asset assetInstance = Asset.get(assetId);
        Set<TimeSeries> timeSeriesList = TimeSeries.findAllByIdInList(tsIdList)
        assetInstance.timeSeries = timeSeriesList

        if (assetInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (assetInstance.version > version) {
                    assetInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'asset.label', default: 'Asset')] as Object[], "Another user has updated this Asset while you were editing")
                    render(view: "editAssets", model: [assetInstance: assetInstance])
                    return
                }
            }

            if (!assetInstance.hasErrors() && assetInstance.save(flush: true)) {
                println("Updating Asset")
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])}"
                redirect(action: "listAssets", id: assetInstance.id)
            } else {
                render(view: "editAssets", model: [assetInstance: assetInstance])
            }
        }else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])}"
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
