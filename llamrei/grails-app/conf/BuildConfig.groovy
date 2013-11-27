grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.server.port.http=9091
grails.project.war.file = "target/${appName}.war"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {
        grailsPlugins()
        grailsHome()
        grailsCentral()

        // uncomment the below to enable remote dependency resolution
        // from public Maven repositories
        //mavenLocal()
        mavenCentral()
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.
        runtime 'mysql:mysql-connector-java:5.1.13'
    }
    
    plugins {
        compile ':famfamfam:1.0.1'
        compile ':hibernate:1.3.7'
        compile ':jquery:1.7.1'
        compile ':jquery-ui:1.8.15'
        compile ':mail:1.0'
        compile ':tomcat:1.3.7'
        compile ':javascript-url-mappings:0.1.1'
        compile ':spring-security-core:1.2.7.3'
        compile ':spring-security-ui:0.2'
        compile ':webxml:1.4.1'
    }
}
