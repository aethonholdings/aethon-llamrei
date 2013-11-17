package com.llamrei.services

class DataContentsService {

    static transactional = true

//    def serviceMethod() {
//
//    }

    public showData(dataInstance,it){
        def assetList=[:]
        def assetObject=[:]
        def  dataSeriesInstance=[]


        try{
            println("me in service")

            println("????????????"+dataInstance)
            println("======????????????"+it)
//            def assetInstance=  Asset.findAll()
//            assetInstance.each{ ins ->
//                println("dataseries===="+ins)
//                dataSeriesInstance.add(DataSeries.findAllByAsset(ins))
//                println("===???????===="+dataSeriesInstance.size())

            }

//            println("======="+dataSeriesInstance.last())
//            assetObject = assetInstance.collect {
//                [
//                        id: it.id,
//                        assetName: it.name
//
//                ]
//            }


//        }
        catch(Exception e){
            println("Exception getting dashboard contents"+e)
        }

        return assetObject
    }
}
