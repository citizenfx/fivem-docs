@echo off
setlocal enabledelayedexpansion

:check_go
where go >nul 2>nul
if %errorlevel% neq 0 (
    echo GO is not installed. Please install Go and try again.
    exit /b 1
)
goto :check_gcc

:check_gcc
where gcc >nul 2>nul
if %errorlevel% neq 0 (
    echo GCC is not installed. Please install GCC and try again.
    exit /b 1
)
goto :check_hugo

:check_hugo
where hugo >nul 2>nul
if %errorlevel% equ 0 (
    echo Hugo is already installed. Starting Hugo server...
    hugo server --disableFastRender
    exit /b 0
)
goto :clone_and_build_hugo

:clone_and_build_hugo
echo Hugo not found. Cloning and building Hugo...

git clone https://github.com/blattersturm/hugo.git
if %errorlevel% neq 0 (
    echo Failed to clone Hugo repository.
    exit /b 1
)

cd hugo
if %errorlevel% neq 0 (
    echo Failed to change directory to Hugo.
    exit /b 1
)

git switch processed-content-variable
if %errorlevel% neq 0 (
    echo Failed to switch branch.
    exit /b 1
)

go env -w CGO_ENABLED=1

go install --tags extended
if %errorlevel% neq 0 (
    echo Failed to install Hugo.
    exit /b 1
)

go build --tags extended
if %errorlevel% neq 0 (
    echo Failed to build Hugo.
    exit /b 1
)

echo Hugo has been successfully built.
echo Starting Hugo server...
hugo server --disableFastRender

exit /b 0

:end