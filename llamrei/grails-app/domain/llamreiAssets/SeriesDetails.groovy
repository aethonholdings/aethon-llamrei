package llamreiAssets

import llamreiproject.User

class SeriesDetails {

    /**
     * properties of Assets
     * instance Variables
     */
        String nameId
        String values
        String unitId
        Date dataReceivedTS
        Date creationDate
        Date modificationDate
        User createdBy
        User modifiedBy
         static  belongsTo = [asset:Asset]

    /**
     * Putting constraints with properties
     */
    static constraints = {
       nameId(nullable: false, blank: false, unique: true)
       values(nullable: false, blank: false)
       unitId (nullable: false, blank: false)
       dataReceivedTS(nullable: false, blank: false)
       creationDate(nullable: false, blank: false)
       modificationDate (nullable: false, blank: false)
       createdBy(nullable: false, blank: false)
       modifiedBy (nullable: false, blank: false)
    }

     /**
     * Mapping to define column names for domain objects in the database
     */
    static  mapping = {
       nameId column: 'nameId'
       unitId column: 'unitId'
       dataReceivedTS column: 'dataReceivedTS'
       creationDate column: 'creationDate'
       modificationDate column: 'modificationDate'
       createdBy column: 'createdBy'
       modifiedBy column: 'modifiedBy'
    }
}
