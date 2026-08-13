Write-Host "===== B5-1 SQL 환경 설치 ====="

# SQLite
if (winget list --id SQLite.SQLite) {
    Write-Host "SQLite already installed"
}
else {
    Write-Host "Installing SQLite..."
    winget install --id SQLite.SQLite
    if ($LASTEXITCODE -eq 0) {
        Write-Host "SQLite installation completed"
    }
    else {
        Write-Host "Failed to install SQLite"
    }
}

# DBeaver
if (winget list --id DBeaver.DBeaver.Community) {
    Write-Host "DBeaver already installed"
}
else {
    Write-Host "Installing DBeaver..."
    winget install --id DBeaver.DBeaver.Community
    if ($LASTEXITCODE -eq 0) {
        Write-Host "DBeaver installation completed"
    }
    else {
        Write-Host "Failed to install DBeaver"
    }
}

Write-Host ""
Write-Host "===== 설치 완료 ====="