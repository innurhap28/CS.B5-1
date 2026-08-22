#!/bin/ash

export DB_DIR="database"
export DB_FILE="$DB_DIR/project.db"
export SCHEMA_FILE="$DB_DIR/01_schema.sql"
export INSERT_FILE="$DB_DIR/02_insert.sql"
export QUERY_FILE="$DB_DIR/03_queries.sql"
export RESULT_DIR="results"
export RESULT_FILE="$RESULT_DIR/queries_result.txt"

bash ./scripts/init.sh || exit 1
bash ./scripts/setup_db.sh || exit 1
bash ./scripts/run_queries.sh || exit 1