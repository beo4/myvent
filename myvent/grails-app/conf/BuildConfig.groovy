grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins
        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenCentral()

        // uncomment these to enable remote dependency resolution from public Maven repositories
        //mavenCentral()
        mavenLocal()
		mavenRepo "http://repo.grails.org/grails/libs-releases/"
        //mavenRepo "http://foursquare-api-java.googlecode.com/svn/repository"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
		//mavenRepo "http://maven.springframework.org/release"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        runtime 'mysql:mysql-connector-java:5.1.16'
		compile("joda-time:joda-time-hibernate:1.3") {
			excludes "joda-time", "hibernate"
		}
		//compile 'fi.foyt:foursquare-api:1.0.2'
		//compile 'org.springframework.social:spring-social-foursquare:1.0.9.RELEASE'
    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.8.0"
        runtime ":resources:1.1.6"
		runtime ":twitter-bootstrap:2.1.1"
		runtime ":fields:1.3"
		runtime ":geolocation:0.4.1"
		runtime ":rest-client-builder:1.0.2"
		runtime ':spring-security-acl:1.1.1'
		runtime ':spring-security-core:1.2.7.3'
		runtime ':spring-security-ui:0.2'
		runtime ':spring-social-core:0.1.31'
		runtime ':spring-social-twitter:0.1.31'
		runtime ':joda-time:1.4'
		
        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0"
        //runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.4"

        build ":tomcat:$grailsVersion"
    }
}
//grails.plugin.location.'grails-spring-social-foursquare' = "../../grails-spring-social-foursquare-git/grails-spring-social-foursquare"
grails.plugin.location.'grails-spring-social-foursquare' = "C:/Develop/workspace/sts-3.0.0/grails-spring-social-foursquare/grails-spring-social-foursquare"
//grails.plugin.location.'grails-spring-social-foursquare' = "C:\Users\behounek\git\grails-spring-social-foursquare-git\grails-spring-social-foursquare"