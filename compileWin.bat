@echo off
setlocal

set WORKSPACE=%~dp0

echo "Setup VC 64 bit environment"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" amd64

mkdir install-debug
mkdir install-release

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=%WORKSPACE%\install-release -G "Visual Studio 12 2013 Win64" ..
MSBuild rabbitmq-c.sln /property:Configuration=Release
if %ERRORLEVEL% NEQ 0 (
    set returnCode=1
    goto end
)
MSBuild INSTALL.vcxproj /property:Configuration=Release
if %ERRORLEVEL% NEQ 0 (
    set returnCode=1
    goto end
)

cmake -DCMAKE_INSTALL_PREFIX=%WORKSPACE%\install-debug -G "Visual Studio 12 2013 Win64" ..
MSBuild rabbitmq-c.sln /property:Configuration=Debug
if %ERRORLEVEL% NEQ 0 (
    set returnCode=1
    goto end
)
MSBuild INSTALL.vcxproj /property:Configuration=Release
if %ERRORLEVEL% NEQ 0 (
    set returnCode=1
    goto end
)

:end
cd %~dp0
exit /b %returnCode%
