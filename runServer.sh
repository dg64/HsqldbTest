#! /bin/bash
HSQLDB_HOME=/opt/hsqldb/hsqldb
echo $HSQLDB_HOME

java -cp $HSQLDB_HOME/lib/hsqldb.jar org.hsqldb.server.Server --props server.properties
