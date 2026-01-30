@echo off
chcp 65001 > nul
echo ========================================
echo   启动Jekyll开发服务器
echo ========================================
echo.
echo 正在启动Jekyll开发服务器...
echo.
echo 访问地址: http://localhost:4000
echo 按 Ctrl+C 停止服务器
echo.
echo ========================================
echo.
"C:\Users\123456\AppData\Local\Microsoft\WindowsApps\jekyll.bat" serve --livereload --port 4000