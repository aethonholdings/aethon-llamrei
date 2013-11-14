package com.damyant.llamrei

import grails.plugins.springsecurity.Secured
 import llamreiproject.*
@Secured(['ROLE_ADMIN'])
class UserProfileController  extends grails.plugins.springsecurity.ui.UserController {

    /**
     * Dependency injection for the springSecurityService.
     */

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
//
//    def index = {
//
//        if (!UserInstance) {
//            UserInstance = new SecUser()
//            UserInstance.profileName = userInstance.username
//            UserInstance.lastUpdated = new Date()
//            UserInstance
//            UserInstance.save()
//            userInstance.User = UserInstance
//            userInstance.save()
//            println(UserInstance.errors)
//            println(userInstance.errors)
//        }
//        redirect(action: 'show', params: [id: UserInstance.id])
//    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [SecUserInstanceList: SecUser.list(params), UserInstanceTotal: SecUser.count()]
    }

    def create = {
        def UserInstance = new SecUser()
        UserInstance.properties = params
        def roleList=SecRole.getAll()
        println(roleList)
        [userInstance: UserInstance,roles:roleList]
    }

    def save = {

        def userInstance = new SecUser(params)
        def roleList=SecRole.getAll()
        def role=SecRole.findByAuthority(params?.userRole)
        println(role);
        if (userInstance.save(flush: true)) {

            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
            SecUserSecRole.create userInstance, role
            redirect(action: "list", id: userInstance.id)
        }
        else {

           render(view: "create", model: [userInstance: userInstance,roles:roleList])

        }
    }

//    def show = {
//        println("?????????????????????????????????????")
//        //def userInstance=User.findById(params.userId)
//        def UserInstance = SecUser.findById(params.id)
//        def userInstance = SecUser.findByUser(UserInstance)
//
//        [UserInstance: UserInstance, userInstance: userInstance]
//
//    }

    def editUser = {
        def UserInstance = SecUser.get(params.id)
              if (!UserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message( default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {

           def role=SecUserSecRole.findBySecUser(UserInstance)
                      return [userInstance: UserInstance,role:role.secRole]
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
            UserInstance.properties = params
            if (!UserInstance.hasErrors() && UserInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message( default: 'User'), UserInstance.id])}"
                redirect(action: "list", id: UserInstance.id)
            }
            else {
                log.debug "-----------" + UserInstance.errors
                render(view: "editUser", model: [UserInstance: UserInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message( default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def remove = {
        println "entering"
        def UserInstance = SecUser.get(params.id)
        def UserInstance1 = SecUserSecRole.findBySecUser(UserInstance)
        if (UserInstance) {
            try {
                UserInstance1.delete(flush: true)
               UserInstance.delete(flush: true)
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
//        log.debug("------change pwd params:" + params)
//        def UserInstance = SecUser.findById(params.id)
//        def userInstance = SecUser.findByUser(UserInstance)
//        if (params.newPwd == params.reNewPwd) {
//            def password = springSecurityService.encodePassword(params.oldPwd)
//            if (userInstance.password != password) {
//                flash.message = "Old password is Not validated."
//                redirect(action: 'changePwd', params: [id: UserInstance.id])
//            } else {
//                userInstance.password = params.newPwd
//                if (userInstance.save(Flushable: true)) {
//                    flash.message = "Password Changed Successfully."
//                    redirect(action: 'show', params: [id: UserInstance.id])
//                }
//            }
//
//        } else {
//            flash.message = "New password and re entered password Not matched"
//            return
//        }
//
//
        def userInstance=SecUser.findById(params.id)
        userInstance.password=params.newPwd
        userInstance.save(flush: true)
//        println newPassword
//        userInstance.password=newPassword
//         if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
//             mailerService.sendForgetPassword(newPassword,userInstance)

        flash.message = "${message(code:'password.reset.msg',args:[userInstance.username,userInstance.email])}"
        redirect(action: "list")
//         }
   }

    def data={
        render "hello"
    }


}
