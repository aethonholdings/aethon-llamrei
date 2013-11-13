package llamreiAssets

import llamreiproject.User

class SeriesUnits {

    /**
     * properties of Assets
     * instance Variables
     */
        String unitId
        String unitDescription
        String unitValue
        Date creationDate
        Date modificationDate
        User createdBy
        User modifiedBy

    /**
     * Putting constraints with properties
     */
    static constraints = {
        unitId(nullable: false, blank: false, unique: true)
        unitValue(nullable: false,blank: false)
        creationDate(nullable: false,blank: false)
        modificationDate(nullable: false,blank: false)
        createdBy(nullable: false,blank: false)
        modifiedBy(nullable: false,blank: false)
    }

     /**
     * Mapping to define column names for domain objects in the database
     */
    static mapping = {
        unitId column: "unitId"
        unitDescription column: "unitDescription"
        unitValue column: "unitValue"
        creationDate column: "creationDate"
        modificationDate column: "modificationDate"
        createdBy column: "createdBy"
        modifiedBy column: "modifiedBy"

            }
}
