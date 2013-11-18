package llamreiAssets
class DataPoint {

    /**
     * properties of Assets
     * instance Variables
     */
      String value
      Asset asset
      TimeSeries timeSeries
    // TimeSeries timeSeries
      Date  nodeTimestamp
      Date timestamp    //server


   /**
     * Putting constraints with properties
     */
    static constraints = {

    }

     /**
     * Mapping to define column names for domain objects in the database with MYSQL
     */
    static  mapping = {


    }
}
