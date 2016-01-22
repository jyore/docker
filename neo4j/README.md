# neo4j

Provides neo4j containers

Referenced from: https://github.com/neo4j/docker-neo4j


## Tags

The following tags are available:

* `latest` : Currently aliases to tag `2.3.2`
* `2.3.2` : Provides community version `2.3.2`

## Running

### Standard

In order to run the container, a command similar to below should be run:
`docker run -d -p 7474:7474 --volume=$HOME/.neo4j/data:/data jyore/neo4j:2.3.2`
