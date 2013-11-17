package com.llamrei.controllers

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class StatemodelController {

    def index = { }
}
