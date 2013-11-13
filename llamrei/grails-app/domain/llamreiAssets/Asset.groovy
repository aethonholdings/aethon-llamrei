package llamreiAssets
<<<<<<< HEAD
=======

import llamreiproject.User
import llamreiproject.SecUser

>>>>>>> 2e9157aec1e6130cd28778d767c0700163f19842
class Asset {

    /**
     * properties of Assets
     * instance Variables
     */
<<<<<<< HEAD
    String assetUniqueID
    String name
    String Description
    String Location
    String customer
    String Photo
    /**
     * Relationship mapping
     */
//
=======

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
>>>>>>> 2e9157aec1e6130cd28778d767c0700163f19842

    /**
     * Putting constraints with properties
     */
    static constraints = {
<<<<<<< HEAD
        assetUniqueID(nullable: false,unique: true)
        name(nullable: false)

    }
=======
        deviceId(nullable: false, blank: false,unique: true)
        creationDate(nullable: false, blank: false)
        modificationDate(nullable: false, blank: false)
        createdBy(nullable: false, blank: false)
        modifiedBy(nullable: false, blank: false)

    }

>>>>>>> 2e9157aec1e6130cd28778d767c0700163f19842
    /**
     * Mapping to define column names for domain objects in the database
     */
    static mapping = {
<<<<<<< HEAD
      assetUniqueID column:"assetUniqueID"

    }
}
=======
        deviceId column: "deviceId"
        description column: "description"
        creationDate column: "creationDate"
        modificationDate column: "modificationDate"
        createdBy column: "createdBy"
        modifiedBy column: "modifiedBy"

    }
}
>>>>>>> 2e9157aec1e6130cd28778d767c0700163f19842
