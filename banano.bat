@echo off
title Banano Miner via XMRig - Auto Installer & Runner
color 0A

echo ========================================
echo         BANANO MINER AUTO STARTER
echo ========================================

:: Kiểm tra xmrig.exe đã tồn tại chưa
IF EXIST xmrig.exe (
    echo [✓] Đã tìm thấy xmrig.exe
) ELSE (
    echo [!] Không tìm thấy xmrig.exe, đang tải về...
    powershell -Command "Invoke-WebRequest -Uri https://github.com/xmrig/xmrig/releases/latest/download/xmrig-6.21.0-msvc-win64.zip -OutFile xmrig.zip"
    powershell -Command "Expand-Archive -Path xmrig.zip -DestinationPath . -Force"
    move /Y xmrig-*-win64\xmrig.exe xmrig.exe >nul
    rmdir /S /Q xmrig-*-win64
    del xmrig.zip
    echo [✓] Đã tải và giải nén xmrig.exe
)

:: Nhập địa chỉ ví BANANO
echo.
set /p WALLET=Nhập ví BANANO (ví dụ: ban_...): 
if "%WALLET%"=="" (
    echo [!] Ví không được để trống. Thoát...
    pause
    exit /b
)

:: Nhập số luồng (thread)
echo.
set /p THREADS=Nhập số luồng CPU muốn dùng (Enter để mặc định 2): 
if "%THREADS%"=="" set THREADS=2

:: Chạy XMRig
echo.
echo [→] Đang khởi động XMRig để đào BANANO...
xmrig.exe -o xmrig.nanswap.com:3333 -a rx -k -u %WALLET% -p x -t %THREADS%
pause
