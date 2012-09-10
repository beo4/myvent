dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
//            dbCreate = "update"
//			pooled = true
//			driverClassName = "com.mysql.jdbc.Driver"
//			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
//            url = "jdbc:mysql://mediaHub/eventguide?useUnicode=yes&characterEncoding=UTF-8"
//            username = "eventG"
//            password = "eventG"
			dbCreate = "create-drop"
			url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
        hibernate {
            show_sql = true
        }
    }
    test {
        dataSource {
            dbCreate = "update"
			pooled = true
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"  
			url = "jdbc:mysql://localhost/myvent"  
			driverClassName = "com.mysql.jdbc.Driver"  
			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
			username = "myventuser"
			password = "myvent1234P3t3r" 
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
