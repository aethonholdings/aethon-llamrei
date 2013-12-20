package com.llamrei.services

class ClockService {

    static transactional = true

    Date timeStamp() {
        Date now = new Date()
        return now
    }
}
