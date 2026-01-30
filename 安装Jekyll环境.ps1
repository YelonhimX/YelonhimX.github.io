# Jekyll环境安装配置脚本
# 适用于Windows 11 PowerShell 5.1

Write-Host "=== Jekyll环境安装配置脚本 ===" -ForegroundColor Green
Write-Host "开始时间: $(Get-Date)" -ForegroundColor Yellow
Write-Host ""

# 步骤1：检查当前环境
Write-Host "步骤1：检查当前环境" -ForegroundColor Cyan
Write-Host "------------------------" -ForegroundColor Cyan

# 检查Ruby
try {
    $rubyVersion = ruby -v 2>&1
    Write-Host "✓ Ruby已安装: $rubyVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Ruby未安装" -ForegroundColor Red
}

# 检查RubyGems
try {
    $gemVersion = gem -v 2>&1
    Write-Host "✓ RubyGems已安装: 版本 $gemVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ RubyGems未安装" -ForegroundColor Red
}

# 检查Bundler
try {
    $bundleVersion = bundle -v 2>&1
    Write-Host "✓ Bundler已安装: $bundleVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Bundler未安装" -ForegroundColor Red
}

Write-Host ""

# 步骤2：安装Ruby（如果未安装）
Write-Host "步骤2：安装Ruby" -ForegroundColor Cyan
Write-Host "------------------------" -ForegroundColor Cyan

try {
    ruby -v 2>&1 | Out-Null
    Write-Host "✓ Ruby已安装，跳过安装步骤" -ForegroundColor Green
} catch {
    Write-Host "正在安装Ruby..." -ForegroundColor Yellow
    
    # 方法1：使用RubyInstaller
    Write-Host "请手动安装Ruby：" -ForegroundColor Yellow
    Write-Host "1. 访问 https://rubyinstaller.org/downloads/" -ForegroundColor White
    Write-Host "2. 下载 Ruby+Devkit 3.2.x (x64) 版本" -ForegroundColor White
    Write-Host "3. 运行安装程序，确保勾选："
    Write-Host "   - 添加Ruby到PATH"
    Write-Host "   - 安装MSYS2开发工具链"
    Write-Host "   - 关联.rb文件"
    Write-Host ""
    Write-Host "安装完成后，重新打开终端并再次运行此脚本。" -ForegroundColor Yellow
    
    # 等待用户确认
    $response = Read-Host "按Enter继续或输入'exit'退出"
    if ($response -eq 'exit') {
        exit
    }
}

Write-Host ""

# 步骤3：安装Bundler和Jekyll
Write-Host "步骤3：安装Bundler和Jekyll" -ForegroundColor Cyan
Write-Host "------------------------" -ForegroundColor Cyan

try {
    # 检查Bundler
    bundle -v 2>&1 | Out-Null
    Write-Host "✓ Bundler已安装" -ForegroundColor Green
} catch {
    Write-Host "安装Bundler..." -ForegroundColor Yellow
    gem install bundler
    Write-Host "✓ Bundler安装完成" -ForegroundColor Green
}

try {
    # 检查Jekyll
    jekyll -v 2>&1 | Out-Null
    Write-Host "✓ Jekyll已安装" -ForegroundColor Green
} catch {
    Write-Host "安装Jekyll..." -ForegroundColor Yellow
    gem install jekyll
    Write-Host "✓ Jekyll安装完成" -ForegroundColor Green
}

Write-Host ""

# 步骤4：安装Windows依赖
Write-Host "步骤4：安装Windows依赖" -ForegroundColor Cyan
Write-Host "------------------------" -ForegroundColor Cyan

Write-Host "安装Windows平台依赖..." -ForegroundColor Yellow
gem install wdm --version "~> 0.1.1"
Write-Host "✓ Windows依赖安装完成" -ForegroundColor Green

Write-Host ""

# 步骤5：安装项目依赖
Write-Host "步骤5：安装项目依赖" -ForegroundColor Cyan
Write-Host "------------------------" -ForegroundColor Cyan

if (Test-Path "Gemfile") {
    Write-Host "找到Gemfile，安装项目依赖..." -ForegroundColor Yellow
    
    # 设置UTF-8编码（避免Windows编码问题）
    $originalEncoding = [Console]::OutputEncoding
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    
    try {
        bundle install
        Write-Host "✓ 项目依赖安装完成" -ForegroundColor Green
    } catch {
        Write-Host "✗ 依赖安装失败，尝试清理后重新安装..." -ForegroundColor Red
        bundle clean --force
        bundle install
        Write-Host "✓ 项目依赖安装完成（经过清理）" -ForegroundColor Green
    } finally {
        # 恢复原始编码
        [Console]::OutputEncoding = $originalEncoding
    }
} else {
    Write-Host "✗ 未找到Gemfile，请确保Gemfile存在" -ForegroundColor Red
    Write-Host "正在创建基本Gemfile..." -ForegroundColor Yellow
    
    $gemfileContent = @'
source "https://rubygems.org"

# GitHub Pages 兼容的Jekyll版本
gem "jekyll", "~> 3.9.0"

# 分页插件（在_config.yml中已配置）
gem "jekyll-paginate"

# 代码高亮
gem "rouge"

# Windows平台需要
gem "wdm", "~> 0.1.1" if Gem.win_platform?

# 开发依赖
group :development do
  gem "jekyll-sitemap"
  gem "jekyll-feed"
  gem "jekyll-seo-tag"
end
'@
    
    Set-Content -Path "Gemfile" -Value $gemfileContent
    Write-Host "✓ Gemfile创建完成" -ForegroundColor Green
    
    # 安装依赖
    Write-Host "安装新创建的Gemfile依赖..." -ForegroundColor Yellow
    bundle install
    Write-Host "✓ 项目依赖安装完成" -ForegroundColor Green
}

Write-Host ""

# 步骤6：验证安装
Write-Host "步骤6：验证安装" -ForegroundColor Cyan
Write-Host "------------------------" -ForegroundColor Cyan

Write-Host "验证Ruby版本:" -ForegroundColor White
ruby -v

Write-Host "验证Jekyll版本:" -ForegroundColor White
jekyll -v

Write-Host "验证Bundler版本:" -ForegroundColor White
bundle -v

Write-Host ""

# 步骤7：测试Jekyll构建
Write-Host "步骤7：测试Jekyll构建" -ForegroundColor Cyan
Write-Host "------------------------" -ForegroundColor Cyan

Write-Host "测试Jekyll构建..." -ForegroundColor Yellow
try {
    bundle exec jekyll build --trace
    Write-Host "✓ Jekyll构建测试成功" -ForegroundColor Green
} catch {
    Write-Host "✗ Jekyll构建测试失败" -ForegroundColor Red
    Write-Host "错误信息: $_" -ForegroundColor Red
}

Write-Host ""

# 步骤8：创建启动脚本
Write-Host "步骤8：创建启动脚本" -ForegroundColor Cyan
Write-Host "------------------------" -ForegroundColor Cyan

$startScript = @'
@echo off
chcp 65001 > nul
echo 启动Jekyll开发服务器...
echo.
echo 访问地址: http://localhost:4000
echo 按Ctrl+C停止服务器
echo.
bundle exec jekyll serve --livereload --port 4000
pause
'@

Set-Content -Path "start-jekyll.bat" -Value $startScript -Encoding UTF8
Write-Host "✓ 启动脚本创建完成: start-jekyll.bat" -ForegroundColor Green

Write-Host ""

# 完成总结
Write-Host "=== 安装配置完成 ===" -ForegroundColor Green
Write-Host "完成时间: $(Get-Date)" -ForegroundColor Yellow
Write-Host ""
Write-Host "下一步操作:" -ForegroundColor Cyan
Write-Host "1. 双击运行 'start-jekyll.bat' 启动开发服务器" -ForegroundColor White
Write-Host "2. 在浏览器中访问 http://localhost:4000" -ForegroundColor White
Write-Host "3. 开始编辑您的博客内容" -ForegroundColor White
Write-Host ""
Write-Host "常用命令:" -ForegroundColor Cyan
Write-Host "• 启动服务器: bundle exec jekyll serve --livereload" -ForegroundColor White
Write-Host "• 构建网站: bundle exec jekyll build" -ForegroundColor White
Write-Host "• 清理缓存: bundle exec jekyll clean" -ForegroundColor White
Write-Host ""
Write-Host "如果遇到问题，请检查:" -ForegroundColor Yellow
Write-Host "1. Ruby是否正确安装并添加到PATH"
Write-Host "2. 是否安装了MSYS2开发工具链"
Write-Host "3. 端口4000是否被占用"
Write-Host "4. 查看Jekyll调试环境搭建指南.md获取更多帮助"