package llamreiAssets

import llamreiproject.User
import llamreiproject.SecUser
class Asset {

    /**
     * properties of Assets
     * instance Variables
     */
    String assetUniqueID
      String assetName
      String clientName
      String description
      String location
      String stateModelId
      String imageurl
      String imagethumburl
      Date creationDate
      Date modificationDate

    String assetUniqueID
    String name
    String Description
    String Location
    String customer
    String Photo


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
        assetUniqueID(nullable: true,unique: true)
        assetName(nullable: false)
        description(nullable: true)
        location(nullable: false)
        stateModelId (nullable: false)
        imageurl(nullable: false)
        imagethumburl (nullable: false)
        creationDate (nullable: true)
        modificationDate(nullable: true)
        assetUniqueID(nullable: false,unique: true)
        name(nullable: false)
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
   assetUniqueID column:"assetUniqueID"
        assetName column:"assetName"
        stateModelId column:"stateModelId"
        imageurl column : "imageurl"
        imagethumburl column:"imagethumburl"
        creationDate column: "creationDate"
        modificationDate column:"modificationDate"
        deviceId column: "deviceId"
        description column: "description"
        creationDate column: "creationDate"
        modificationDate column: "modificationDate"
        createdBy column: "createdBy"
        modifiedBy column: "modifiedBy"
    }
}