@echo off
setlocal
cd /d "%~dp0"
where python >nul 2>&1
if errorlevel 1 (
  echo Khong tim thay Python. Hay cai Python 3 va dam bao lenh python co trong PATH.
  pause
  exit /b 1
)
start "English Vocab server" cmd /k "cd /d ""%~dp0"" && python -m http.server 8000 --bind 127.0.0.1"
timeout /t 2 /nobreak >nul
start "" "http://127.0.0.1:8000/index.html"
endlocal
