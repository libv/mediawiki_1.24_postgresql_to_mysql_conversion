#! /bin/bash

dbname=tmpdb
dumpfile=postgresql.sql
dumplog=restructure_load.log

#
# Restructure an existing mediawiki db into something matching the mysql db
#

echo "Dropping old DB $dbname"
dropdb $dbname

echo "Creating new DB $dbname"
createdb $dbname --encoding='SQL_ASCII' --locale='C' --template='template0'
if (( $? != 0 )); then
    exit
fi

echo "Loading dump $dumpfile into DB $dbname"
psql $dbname < $dumpfile > $dumplog
if (( $? != 0 )); then
    exit
fi
echo "Log of load is available in $dumplog"
