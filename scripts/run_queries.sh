#!/bin/bash

echo "- # 쿼리 실행 시작 -----------------"

sqlite3 "$DB_FILE" <<EOF > "$RESULT_FILE"
.headers on
.mode column
.echo on

.read "$QUERY_FILE"
EOF

if [ $? -ne 0 ]; then
    echo "[ERROR] 쿼리 실행 실패"
    exit 1
fi

echo "[OK] 쿼리 실행 완료"
echo "[INFO] 결과 저장 : $RESULT_FILE"