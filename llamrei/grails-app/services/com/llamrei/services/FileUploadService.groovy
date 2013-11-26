package com.llamrei.services
    import org.springframework.web.multipart.MultipartFile
    import com.llamrei.domain.Asset
    import org.codehaus.groovy.grails.commons.ConfigurationHolder
    import org.codehaus.groovy.grails.web.context.ServletContextHolder
    import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
    class FileUploadService
    {

        boolean transactional = true
        def config = ConfigurationHolder.config
        def springSecurityService

        def String uploadFile(Asset assetInstance, uploadedFile) {
            log.debug "----------uploadNewImage:"+uploadedFile

            if (!uploadedFile.empty) {
                def ext=(uploadedFile.originalFilename).substring((uploadedFile.originalFilename).lastIndexOf('.'))

                def webRootDir = ServletContextHolder.servletContext.getRealPath("/") + '/images/assetImages'
                def webRootUrl = config.grails.serverURL + '/images/assetImages'
                def llamreiDir = new File(webRootDir, '/' + assetInstance.id)
                println(llamreiDir)
                def llamreiUrl = webRootUrl + '/' + assetInstance.id
                def fileName = UUID.randomUUID().toString()+ext
                llamreiDir.mkdirs()
                uploadedFile.transferTo(new File(llamreiDir, fileName))
                assetInstance.imageurl = llamreiUrl + '/' + fileName

            }


            return assetInstance
        }
    }

