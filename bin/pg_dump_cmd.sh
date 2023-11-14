#!/bin/bash
# Call pg_dump on a bunch of tables, create a .tgz from the dumps
# $PSQL_URI defines db connection (not set here)

set -eu				# quit on $? != 0, unset vars

compress='no'
where=''
while getopts "cw:" o; do
    case "${o}" in
        c)
	    compress='yes'
	    echo output will be tar-ed/compressed
	    shift
	    ;;
	w)
	    where="WHERE $OPTARG"
	    echo looking for $where
	*)
	    ;;
    esac
done

if [[ ${1-X} == '-h' ]]; then
    echo usage: ./pg_dump_cmd.sh
    if [[ -z "$PSQL_URI" ]]; then
	echo \(needs \$PSQL_URI\)
    fi
    exit
fi

echo dumping from $PSQL_URI_ENV

for table in "$@"; do
    pg_dump "${PSQL_URI}" -a --table $table >${PSQL_URI_ENV}.$table.sql
    echo ${PSQL_URI_ENV}.$table.sql written
done

if [[ "$compress" == "yes" ]]; then
    tar_file="${PSQL_URI_ENV}.$(date '+%d%b%Y')"
    rm -f $tar_file
    tar cf $tar_file -T /dev/null 
    for table in "$@"; do
	tar fr ${tar_file} ${PSQL_URI_ENV}.${table}.sql
	rm ${PSQL_URI_ENV}.${table}.sql
    done
    gzip ${tar_file} -S '.tgz'
    tgz_file=$(echo $tar_file | sed s/\.tar$/\.tgz/)
    du -sch $tgz_file
fi
