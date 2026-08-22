#!/bin/bash

echo "- # DB 설정 시작 ------------------"

sqlite3 "$DB_FILE" << EOF
PRAGMA foreign_keys = ON;
.read $SCHEMA_FILE
.read $INSERT_FILE
EOF

if [ $? -ne 0 ]; then
    echo "[ERROR] DB 설정 실패"
    exit 1
fi
echo "[OK] DB 설정 완료"