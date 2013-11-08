package llamreiAssets

import llamreiproject.User
import llamreiproject.SecUser

class Asset {

    /**
     * properties of Assets
     * instance Variables
     */

    String deviceId
    String description
    Date creationDate
    Date modificationDate
    SecUser createdBy
    SecUser modifiedBy

    /**
     * Relationship mapping
     */
//    static hasMany = [seriesdetails:SeriesDetails]

    /**
     * Putting constraints with properties
     */
    static constraints = {
        deviceId(nullable: false, blank: false,unique: true)
        creationDate(nullable: false, blank: false)
        modificationDate(nullable: false, blank: false)
        createdBy(nullable: false, blank: false)
        modifiedBy(nullable: false, blank: false)

    }

    /**
     * Mapping to define column names for domain objects in the database
     */
    static mapping = {
        deviceId column: "deviceId"
        description column: "description"
        creationDate column: "creationDate"
        modificationDate column: "modificationDate"
        createdBy column: "createdBy"
        modifiedBy column: "modifiedBy"

    }
}
