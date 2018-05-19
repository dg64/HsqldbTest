HSQLDB_HOME=/opt/hsqldb/hsqldb
echo $HSQLDB_HOME

java -cp $HSQLDB_HOME/lib/hsqldb.jar org.hsqldb.util.DatabaseManagerSwing --urlid localhost-sa --rcfile ./dbmanager.rc
