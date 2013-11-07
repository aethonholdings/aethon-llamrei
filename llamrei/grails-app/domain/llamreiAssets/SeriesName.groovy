package llamreiAssets

import llamreiproject.User

class SeriesName {

    /**
     * properties of Assets
     * instance Variables
     */
        String nameId
        String description
        String nameValue
        Date creationDate
        Date modificationDate
        User createdBy
        User modifiedBy

     /**
     * Putting constraints with properties
     */
    static constraints = {
        nameId(nullable: false,blank: false,unique: true)
        nameValue(nullable: false,blank: false)
        creationDate(nullable: false,blank: false)
        modificationDate(nullable: false,blank: false)
        createdBy (nullable: false,blank: false)
        modifiedBy (nullable: false,blank: false)
    }

     /**
     * Mapping to define column names for domain objects in the database
     */
    static mapping = {
       nameId column: "nameId"
       description column: "description"
       nameValue column: "nameValue"
       creationDate column: "creationDate"
       modificationDate column: "modificationDate"
       createdBy column: "createdBy"
       modifiedBy column: "modifiedBy"

    }
}
