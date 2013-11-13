package untitled3

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class HomeController {
    def scaffold = true

    def index = {
        //Only admin users can create, edit, list the downloads
        //Regular users can randomise the downloads.
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")){
            redirect(controller: "admin", action: "index")
        }
        else if((SpringSecurityUtils.ifAllGranted("ROLE_OPERATOR"))){
            redirect(controller: "show2", action: "index")
        } else {
            redirect(controller: "dashboard", action: "dashboardIndex")
        }
    }
}


