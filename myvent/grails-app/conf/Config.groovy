// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
import grails.plugins.springsecurity.SecurityConfigType


grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']


// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// enable query caching by default
grails.hibernate.cache.queries = true

// set per-environment serverURL stem for creating absolute links
environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    appenders {
        console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    }
	
		
	// Logging warnings and higher for all of the app
	warn 'grails.app'
	// Logging infos and higher for all controllers

		// Logging debug and higher for the BarService
	debug 'grails.app.service',
			'grails.app.controller'


    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
           'org.codehaus.groovy.grails.web.pages', //  GSP
           'org.codehaus.groovy.grails.web.sitemesh', //  layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping', // URL mapping
           'org.codehaus.groovy.grails.commons', // core / classloading
           'org.codehaus.groovy.grails.plugins', // plugins
           'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
		   
	info 'grails.plugins.springsocial', 'grails.plugins.controllers.grails.plugins.springsocial'
}

grails.plugins.springsecurity.securityConfigType = SecurityConfigType.Requestmap
// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'de.myvent.users.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'de.myvent.users.UserRole'
grails.plugins.springsecurity.authority.className = 'de.myvent.users.Role'
grails.plugins.springsecurity.requestMap.className = 'de.myvent.users.Requestmap'

//plugins.springsocial.foursquare.clientId='MRBDP1Q4SBHLWYJULJJNO5A22IMSKGBVKJULVPAP1HC0403D'
//plugins.springsocial.foursquare.clientSecret='JXT2GJFG3VYIT0OCLET2ROFFMQ2IDCCXBWA3KXGJ5UTP3CYO'
grails.plugins.springsocial.foursquare.clientId='ISRITND41X21YZNO0ICADIVKOHUZ4HKBCNAE1QFMZFY3K2EK'
grails.plugins.springsocial.foursquare.clientSecret='2PUF2FLNQK4P0ZXDAMURX1VPFBUWRHJDWYQV5QVOQEFOFB1K'

grails.plugins.springsocial.facebook.clientId='265254830258145'
grails.plugins.springsocial.facebook.clientSecret='2e682bb95251f950c6694f01bd066334'


//Configuration for twitter
grails.plugins.springsocial.twitter.consumerKey = "0trM4GpWXiE92psB9vQPVg"
grails.plugins.springsocial.twitter.consumerSecret = "mGBtxxsTmzxzItRhTM2WpiN8GwmWUfD2YZxjNQDDA0"


grails.plugins.mapbox.mapId="admiral49.map-ytobe2ij"


// Added by the Joda-Time plugin:
grails.gorm.default.mapping = {
	"user-type" type: org.joda.time.contrib.hibernate.PersistentDateTime, class: org.joda.time.DateTime
	"user-type" type: org.joda.time.contrib.hibernate.PersistentDuration, class: org.joda.time.Duration
	"user-type" type: org.joda.time.contrib.hibernate.PersistentInstant, class: org.joda.time.Instant
	"user-type" type: org.joda.time.contrib.hibernate.PersistentInterval, class: org.joda.time.Interval
	"user-type" type: org.joda.time.contrib.hibernate.PersistentLocalDate, class: org.joda.time.LocalDate
	"user-type" type: org.joda.time.contrib.hibernate.PersistentLocalTimeAsString, class: org.joda.time.LocalTime
	"user-type" type: org.joda.time.contrib.hibernate.PersistentLocalDateTime, class: org.joda.time.LocalDateTime
	"user-type" type: org.joda.time.contrib.hibernate.PersistentPeriod, class: org.joda.time.Period
}
jodatime.format.html5 = true
