package com.llamrei.domain

class AssociateTimeSeries {


      Asset asset
      TimeSeries timeSeries
    static constraints = {
    }

    static mapping = {
      asset column: 'asset'
      timeSeries column : 'timeSeries'

    }
}
