dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = ""
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://localhost:3306/llamrei?autoreconnect=true"
            username = "llamrei"
            password = "llamrei"
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://llamrei.cokd1jwuhqlu.ap-southeast-1.rds.amazonaws.com:3306/llamrei?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8&autoReconnect=true"
            username = "llamrei"
            password = "k7ALp3vQ"
        }
    }
    production {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://llamrei.cokd1jwuhqlu.ap-southeast-1.rds.amazonaws.com:3306/llamrei?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8&autoReconnect=true"
            username = "llamrei"
            password = "k7ALp3vQ"
        }
    }
}
