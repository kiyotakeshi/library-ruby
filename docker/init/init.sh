#!/bin/bash

mysql -u root -p1qazxsw2 library_development < "/docker-entrypoint-initdb.d/sql/sample-schema.sql"
mysql -u root -p1qazxsw2 library_development < "/docker-entrypoint-initdb.d/sql/sample-data.sql"
