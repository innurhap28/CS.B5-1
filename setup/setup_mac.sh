#!/bin/bash

if ! command -v brew > /dev/null 2>&1; then
    echo "Homebrew가 설치되어 있지 않습니다."
    exit 1
fi
    
echo "===== B5-1 SQL 환경 설치 ====="

# SQLite 설치 여부 확인 및 설치
if command -v sqlite3 > /dev/null 2>&1; then
    echo "SQLite already installed"
else
    echo "installing SQLite..."

    if brew install sqlite; then
        echo "SQlite install sucessed"
    else
        echo "failed to install SQLite"
        exit 1
    fi
fi

# # DBeaver 설치 여부 확인 및 설치
# if brew list --cask dbeaver-community > /dev/null 2>&1; then
#     echo "DBeaver already installed"
# else
#     echo "installing DBeaver..."

#     if brew install --cask dbeaver-community; then
#         echo "DBeaver install sucessed"
#     else
#         echo "failed to install DBeaver"
#         exit 1
#     fi
# fi

echo ""
echo "===== 설치 완료 ====="