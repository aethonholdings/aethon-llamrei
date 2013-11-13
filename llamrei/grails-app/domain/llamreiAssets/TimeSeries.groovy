package llamreiAssets

class TimeSeries {

    /**
     * properties of Assets
     * instance Variables
     */
     String timeSeriesUniqueID
     String name
     String description
     String units
     String dataType

     /**
     * Putting constraints with properties
     */
    static constraints = {
        timeSeriesUniqueID(nullable: false,unique: true)
        name(nullable: false,unique: true)
        units(nullable: false, unique: true)

    }

     /**
     * Mapping to define column names for domain objects in the database
     */
    static mapping = {
    timeSeriesUniqueID column: "timeSeriesUniqueID"
    dataType column :"dataType"
    }
}
