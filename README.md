# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* This is the source code for the pledge application
* Version

### How do I get set up? ###

The application uses gradle as its build framework. The gradle wrapper has been provided so there is no need to install gradle seperately.
The application can be run in two modes, development mode using an embedded hsql database or production mode using a mysql database. The checked
in version is configured to run against the local hsql configuration. Refer to the Database Configuration section of this document to run the
application locally using an embedded database (no database setup required) or in production against the configured mysql instance.

To start the application locally
After performing any required actions in Database Configuration, open a command prompt and navigate to the root directory of the application.
Type the following depending on your platform:
windows: .\gradlew jettyRunWar
unix: ./gradlew jettyRunWar

To import the application into eclipse, open a command prompt and navigate to the root directory of the application.
Type the following depending on your platform:
windows: .\gradlew eclipse
unix: ./gradlew eclipse

Open eclipse and select File -> Import -> Existing projects into workspace

* Configuration
* Dependencies
* Database configuration
The two supported modes are detailed in spring-datasource.xml. These are:
production - a mysql database will be started using the configuration settings contained in /WEB-INF/resources/aws_mysql_config.properties
local - a hsql database will be started using the configuration settings contained in /WEB-INF/resources/local_hsql_config.properties
To change mode: Open web.xml. Look for the folowing

<context-param>
    <param-name>spring.profiles.active</param-name>
    <param-value>local</param-value>
</context-param>

Change the param-value to either local or production.

* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact