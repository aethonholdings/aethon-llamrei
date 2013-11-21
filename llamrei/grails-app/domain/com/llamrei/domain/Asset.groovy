package com.llamrei.domain

class Asset {

    String assetUniqueID
    String assetName
    String clientName
    String description
    String location
    String imageurl
    Date creationDate
    Date modificationDate
    String connectivityStatus
    /**
     * Relationship mapping
     */

    static hasMany= [timeSeries: TimeSeries, dataSeries: DataPoint]
    
    /**
     * Putting constraints with properties
     */
    static constraints = {
        assetUniqueID(nullable: true, unique: true)
        assetName(nullable: false)
        connectivityStatus(nullable: false)
        description(nullable: true)
        location(nullable: false)
        imageurl(nullable:true)
        clientName  (nullable: false)
        creationDate(nullable: true)
        modificationDate(nullable: true)

    }
    
    /**
     * Mapping to define column names for domain objects in the database
     */
    static mapping = {
        assetUniqueID column:"assetUniqueID"
        assetName column:"assetName"

//        imageurl column : "imageurl"

        creationDate column: "creationDate"
        modificationDate column:"modificationDate"
    }

    @Override
    public String toString() {
        return "Asset{" +
                "id=" + id +
                ", assetUniqueID='" + assetUniqueID + '\'' +
                ", assetName='" + assetName + '\'' +
                ", clientName='" + clientName + '\'' +
                ", description='" + description + '\'' +
                ", location='" + location + '\'' +
//                ", imageurl='" + imageurl + '\'' +
                ", creationDate=" + creationDate +
                ", modificationDate=" + modificationDate +
                ", version=" + version +
                '}';
    }
}
