set -e

psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE DATABASE backend_test;"
