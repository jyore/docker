flyway docker
-------------

This container provides a minimally invasive, flexible, and reusable solution to running flyway schema migrations across your RDBMS. 



# Getting Started

First, pull down the image from Docker Hub using the `pull` command

    $ sudo docker pull jyore/flyway


And then let's run the default:

    $ sudo docker run --rm -t jyore/flyway


You will get the following error, which is correct for the current configuration

    ERROR: Unable to connect to the database. Configure the url, user and password!


The error is due to the fact that we have not actually provided any configuration information to flyway, thus it does not know how to connect to the database. 



## What's Happening??

By default, the docker container will run the `flyway migrate` command, which should connect to your database and run your SQL/Java migrations. Well, that's great, but we didn't provide our connection information nor did we specify our files. So, the `ERROR` that we got, is 100% expected.

Something more useful would be to override the default command to something more helpful for us at the moment...say the `--help` command.

    $ sudo docker run --rm -t jyore/flyway --help


You should now see the flyway help menu print out to the screen, excellent!



# Configuring the Container to Perform Migrations

Time to make the container useful! There are 3 mount points available for adding configuration, adding SQL migration files, and adding Java jar migrations files. These mount points are defined below:

* /flyway/conf - Your flyway.conf file should get mounted here
* /flyway/sql - Your `.sql` files should get mounted here
* /flyway/jars - Your Java jars should be mounted here


Let's assume we have a project directory layout is as follows (pretty standard java/maven layout):

    $PROJECT_HOME
    ├── conf
    |   └── flyway.conf
    ├── src
    |   ├── main
    |   |   ├── java
    |   |   ├── resources
    |   |   |   └── db
    |   |   |       └── migration
    |   |   |           ├── V1__initial.sql
    |   |   |           ├── V2__addUserTable.sql
    |   |   |           └── V3__updateUserTable.sql
    |   |   └── webapp
    |   └── test
    └── pom.xml



Now we would run the docker container like so:

    $ sudo docker run --rm \
    -v $PROJECT_HOME/conf:/flyway/conf \
    -v $PROJECT_HOME/src/main/resources/db/migration:/flyway/sql \
    -t jyore/flyway


Assuming your flyway.conf file has all of your configuration information (see http://flywaydb.org/documentation/ for more information) for making the database connections is correct, you should see your migrations start to run!


## Leveraging a Data Container

In a CI/CD pipeline, I highly recommend creating a data volume container that you can push through your pipeline. You can then leverage the `--volumes-from` flag when running your docker container to mount the volumes from your data container


Using the previous directory example, create a data container using the following

    $ sudo docker create \
    -v $PROJECT_HOME/conf:/flyway/conf \
    -v $PROJECT_HOME/src/main/resources/db/migration:/flyway/sql \
    --name flywayData \
    jyore/flyway /bin/true



And then your run command is simply:

    $ sudo docker run --rm --volumes-from flywayData -t jyore/flyway



## Overriding Commands

This was demonstrated with the `--help` example, but it is worth noting that any flyway command (or command options) can be run by the container by adding your information to the end of the `run dommand`. For example, let's say we want to get the `info` about our current migrations status and pending migrations. We can run the following:

    $ sudo docker run --rm --volumes-from flywayData -t jyore/flyway info


This of course can be done with any of the main flyway commands `migrate|clean|info|validate|baseline|repair`. Please see flyway documentation at http://flywaydb.org/documentation/ for more information 
