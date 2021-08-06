#! /bin/bash
#
# Restructure an existing mediawiki db into something matching the mysql db
#

dbname=tmpdb
dumpfile=$1
dumplog=restructure.log

#
#
#
head $dumpfile | grep -- "-- PostgreSQL database dump" > /dev/null
if (( $? != 0 )); then
    echo "Error: dump file $dumpfile is not a postgresql dump."
    exit
fi

echo "" >> $dumplog
echo "Logging to $dumplog"

echo "Dropping old psql DB $dbname"
echo "Dropping old psql DB $dbname" >> $dumplog
dropdb $dbname

echo "Creating new psql DB $dbname"
echo "Creating new psql DB $dbname" >> $dumplog
createdb $dbname --encoding='SQL_ASCII' --locale='C' --template='template0'
if (( $? != 0 )); then
    exit
fi

echo "Loading psql dump $dumpfile into psql DB $dbname"
echo "Loading psql dump $dumpfile into psql DB $dbname" >> $dumplog
psql $dbname < $dumpfile >> $dumplog
if (( $? != 0 )); then
    exit
fi

echo "Adjusting psql search path" >> $dumplog
echo "alter database $dbname set search_path = mediawiki, public;" | psql $dbname >> $dumplog

# List of tables in the old mediawiki postgresql.
# I have removed the following empty ones which were no longer in use
# as they probably were upgraded away from.
#
# "config", "external_user", "profiling"
psql_tables=(
	"archive"
	"category"
	"categorylinks"
	"change_tag"
	"externallinks"
	"filearchive"
	"hitcounter"
	"image"
	"imagelinks"
	"interwiki"
	"ipblocks"
	"iwlinks"
	"job"
	"l10n_cache"
	"langlinks"
	"log_search"
	"logging"
	"math"
	"mathoid"
	"module_deps"
	"msg_resource"
	"msg_resource_links"
	"mwuser"
	"objectcache"
	"oldimage"
	"page"
	"page_props"
	"page_restrictions"
	"pagecontent"
	"pagelinks"
	"protected_titles"
	"querycache"
	"querycache_info"
	"querycachetwo"
	"recentchanges"
	"redirect"
	"revision"
	"site_identifiers"
	"site_stats"
	"sites"
	"tag_summary"
	"templatelinks"
	"transcache"
	"updatelog"
	"uploadstash"
	"user_former_groups"
	"user_groups"
	"user_newtalk"
	"user_properties"
	"valid_tag"
	"watchlist"
)

for table in "${psql_tables[@]}"; do
    echo "Restructuring psql $dbname table $table"
    echo "Restructuring psql $dbname table $table" >> $dumplog
    psql $dbname < tables/$table.sql >> $dumplog
    if (( $? != 0 )); then
	exit
    fi
done

for table in "${psql_tables[@]}"; do
    echo "Dumping psql $dbname table $table to $table.data"
    echo "Dumping psql $dbname table $table to $table.data" >> $dumplog
    pg_dump -t mediawiki.$table --data-only --inserts $dbname > $table.data
    if (( $? != 0 )); then
	exit
    fi
done
