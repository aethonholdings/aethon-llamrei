package llamreiAssets

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

    /**
     * Relationship mapping
     */
//

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

    }
}