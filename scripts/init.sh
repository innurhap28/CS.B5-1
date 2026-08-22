#!/bin/bash

echo "- # 초기화 시작 --------------------"

if ! command -v sqlite3 > /dev/null 2>&1; then
    echo "[ERROR] sqlite3가 설치되어 있지 않습니다."
    exit 1
fi

echo "[OK] sqlite3 설치 확인 완료"

for FILE in "$SCHEMA_FILE" "$INSERT_FILE" "$QUERY_FILE"; do
    if [ ! -f "$FILE" ]; then
        echo "[ERROR] 파일을 찾을 수 없습니다: $FILE"
        exit 1
    fi 
done

echo "[OK] SQL 파일 확인 완료"

if [ -f "$DB_FILE" ]; then
    echo "[INFO] 기존 DB 삭제 : $DB_FILE"
    rm -f "$DB_FILE"
fi

mkdir -p "$RESULT_DIR"
rm -f "$RESULT_FILE"

echo "[OK] 초기화 완료"