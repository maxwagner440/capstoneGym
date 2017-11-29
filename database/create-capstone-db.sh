#!/bin/bash
BASEDIR=$(dirname $0)
psql -U postgres -f "$BASEDIR/dropdb.sql" &&
createdb -U postgres data &&
psql -U postgres -d data -f "$BASEDIR/schema.sql" &&
psql -U postgres -d data -f "$BASEDIR/user.sql" &&
psql -U postgres -d data -f "$BASEDIR/data.sql"