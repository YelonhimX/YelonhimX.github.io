@echo off
chcp 65001 > nul
echo ========================================
echo    Jekyll开发服务器启动脚本
echo ========================================
echo.
echo 正在启动Jekyll开发服务器...
echo.
echo 访问地址: http://localhost:4000
echo 按 Ctrl+C 停止服务器
echo.
echo ========================================
echo.

REM 检查Ruby是否安装
where ruby >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误: Ruby未安装！
    echo 请先安装Ruby：
    echo 1. 访问 https://rubyinstaller.org/downloads/
    echo 2. 下载 Ruby+Devkit 3.2.x (x64) 版本
    echo 3. 运行安装程序并添加到PATH
    echo.
    pause
    exit /b 1
)

REM 检查Bundler是否安装
where bundle >nul 2>&1
if %errorlevel% neq 0 (
    echo 警告: Bundler未安装，正在尝试安装...
    gem install bundler
    if %errorlevel% neq 0 (
        echo 错误: Bundler安装失败！
        pause
        exit /b 1
    )
)

REM 检查Jekyll是否安装
where jekyll >nul 2>&1
if %errorlevel% neq 0 (
    echo 警告: Jekyll未安装，正在尝试安装...
    gem install jekyll
    if %errorlevel% neq 0 (
        echo 错误: Jekyll安装失败！
        pause
        exit /b 1
    )
)

REM 检查项目依赖
if exist Gemfile (
    echo 检查项目依赖...
    bundle check
    if %errorlevel% neq 0 (
        echo 安装项目依赖...
        bundle install
        if %errorlevel% neq 0 (
            echo 错误: 依赖安装失败！
            pause
            exit /b 1
        )
    )
)

echo 启动Jekyll开发服务器...
echo.
bundle exec jekyll serve --livereload --port 4000

if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo 服务器启动失败！
    echo 可能的原因：
    echo 1. 端口4000被占用
    echo 2. 依赖未正确安装
    echo 3. 配置文件错误
    echo.
    echo 尝试使用其他端口：
    echo bundle exec jekyll serve --livereload --port 4001
    echo ========================================
    echo.
    pause
)