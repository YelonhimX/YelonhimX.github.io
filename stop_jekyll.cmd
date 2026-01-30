@echo off
chcp 65001 > nul
echo ========================================
echo   停止Jekyll开发服务器
echo ========================================
echo.
echo 正在停止Jekyll服务器...
echo.

setlocal enabledelayedexpansion
set found=0

for /f "tokens=5" %%a in ('netstat -ano ^| findstr :4000 ^| findstr LISTENING') do (
    echo 找到进程ID: %%a
    taskkill /PID %%a /F >nul 2>&1
    if errorlevel 1 (
        echo 停止进程失败: %%a
    ) else (
        echo 已停止进程: %%a
    )
    set found=1
)

if !found!==0 (
    echo 未找到运行在端口4000的Jekyll服务器
    echo 可能的原因：
    echo 1. 服务器未运行
    echo 2. 服务器运行在其他端口
    echo 3. 进程已停止
)

echo.
echo ========================================
echo Jekyll服务器管理完成
echo ========================================
echo.
pause