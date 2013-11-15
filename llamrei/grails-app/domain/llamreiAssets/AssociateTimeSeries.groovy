package llamreiAssets

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
