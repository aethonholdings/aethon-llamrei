package com.llamrei.controllers

import grails.plugins.springsecurity.Secured
import com.llamrei.domain.*

@Secured(['ROLE_ADMIN'])
class UserManagementController extends grails.plugins.springsecurity.ui.UserController {

    /**
     * Dependency injection for the springSecurityService.
     */

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = { redirect(action: 'list') }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [SecUserInstanceList: SecUser.list(params), UserInstanceTotal: SecUser.count()]
    }

    def create = {
        def UserInstance = new SecUser()
        UserInstance.properties = params
        def roleList=SecRole.getAll()
            [userInstance: UserInstance,roles:roleList]
    }

    def save = {

        def userInstance = new SecUser(params)
        def checked = params.list('myCheckbox')
        def roleList=SecRole.getAll()
        if (userInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
            for(int i=0;i<checked.size();i++){
                def role=SecRole.findById(checked[i])
                SecUserSecRole.create userInstance, role

            }
            redirect(action: "list", id: userInstance.id)
        }
        else {

           render(view: "create", model: [userInstance: userInstance,roles:roleList])

        }
   }



    def editUser = {
        def userInstance = SecUser.get(params.id)
        def userRoles = SecUserSecRole.findAllBySecUser(userInstance)*.secRole
           if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message( default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {

           def roles=SecRole.getAll()
                  println(roles.id)
                  println(userRoles)
                      return [userInstance: userInstance,roles:roles, userRoles:userRoles]
        }
    }

    def updateUser = {

        def UserInstance = SecUser.get(params.id)
        if (UserInstance) {
            if (params.version) {

                def version = params.version.toLong()
                if (UserInstance.version > version) {

                    UserInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message( default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "editUser", model: [UserInstance: UserInstance])
                    return
                }
            }

            UserInstance.properties=params

            def secUserSecRoleInstance = SecUserSecRole.findAllBySecUser(UserInstance)
            secUserSecRoleInstance.each{
                it.delete()
            }
            def checked = params.list('myCheckbox')
            if (UserInstance.save(flush: true)) {

                flash.message = "${message(code: 'default.updated.message', args: [message( default: 'User'),   UserInstance.id])}"
                 for(int i=0;i<checked.size();i++){
                    def role=SecRole.findById(checked[i])
                    SecUserSecRole.create    UserInstance, role

                }

                redirect(action: "list", id:    UserInstance.id)
            }
            else {

               log.debug "-----------" +    UserInstance.errors
                render(view: "editUser", model: [userInstance:UserInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message( default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def remove = {
        println "entering"+ params.id
        def userInstance = SecUser.get(params.id)
        def userRoles = SecUserSecRole.findAllBySecUser(userInstance)
        println(userInstance)


        if (userInstance) {
            try {
                userRoles.each{
                    it.delete(flush: true)
                }
               userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message( default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message( default: 'User'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message( default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    /**
     * Show the Change password page.
     */
    def changePwd = {
        def UserInstance = SecUser.findById(params.id)
        [userInstance: UserInstance]
    }
    /* *
    * Redirect to profile show page after successfully changed password.
    * If error then redirect to changePwd page with message.
    * */
    def changPwdAction = {
        def userInstance=SecUser.findById(params.id)
        userInstance.password=params.newPwd
        userInstance.save(flush: true)

        flash.message = "${message(code:'password.reset.msg',args:[userInstance.username,userInstance.email])}"
        redirect(action: "list")

   }




}
