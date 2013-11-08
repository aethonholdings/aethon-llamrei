package llamreiAssets

import llamreiproject.User
import llamreiproject.SecUser

class SeriesDetails {

    /**
     * properties of Assets
     * instance Variables
     */
        String dataValue
        SeriesUnits seriesUnits
        SeriesName seriesName
        Date dataReceivedTS
        Date creationDate
        Date modificationDate
        SecUser createdBy
        SecUser modifiedBy

//        Asset deviceId
    static  belongsTo = [asset:Asset]

    /**
     * Putting constraints with properties
     */
    static constraints = {
      nameId(nullable: false, blank: false, unique: true)
      dataValue(nullable: false, blank: false)

      dataReceivedTS(nullable: false, blank: false)
      creationDate(nullable: false, blank: false)
       modificationDate (nullable: false, blank: false)
       createdBy(nullable: false, blank: false)
       modifiedBy (nullable: false, blank: false)
    }

     /**
     * Mapping to define column names for domain objects in the database with MYSQL
     */
    static  mapping = {
       seriesName column: "seriesName"
       dataValue column: "dataValue"
       seriesUnits column: "seriesUnits"
       dataReceivedTS column: "dataReceivedTS"
       creationDate column: "creationDate"
       modificationDate column: "modificationDate"
       createdBy column: "createdBy"
       modifiedBy column: "modifiedBy"

    }
}
