@ECHO OFF
chcp 65001
cls
@SETLOCAL
echo "========请先参考README.md准备好编译环境========"
echo.

echo "========编译选项========"
echo "请注意：项目默认使用Release库，除非您自行编译Debug版的OcrLib(含引用库)，否则请不要选择Debug编译"
echo "请输入编译选项并回车: 1)Release, 2)Debug"
set BUILD_TYPE=Release
set /p flag=
if %flag% == 1 (set BUILD_TYPE=Release)^
else if %flag% == 2 (set BUILD_TYPE=Debug)^
else (echo 输入错误！Input Error!)
echo.

echo "请输入选项并回车: 0)ALL, 1)vs2019-x86, 2)vs2019-x64:"
set /p flag=
if %flag% == 0 (call :buildALL)^
else if %flag% == 1 (call :gen2019-x86)^
else if %flag% == 2 (call :gen2019-x64)^
else (echo "输入错误！Input Error!")
GOTO:EOF

:buildALL
call :gen2019-x86
call :gen2019-x64
GOTO:EOF

:gen2019-x86
mkdir build-win-vs2019-x86
pushd build-win-vs2019-x86
call :cmakeParams "Visual Studio 16 2019" "Win32"
popd
GOTO:EOF

:gen2019-x64
mkdir build-win-vs2019-x64
pushd build-win-vs2019-x64
call :cmakeParams "Visual Studio 16 2019" "x64"
popd
GOTO:EOF

:cmakeParams
echo cmake -G "%~1" -A "%~2" ..
cmake -G "%~1" -A "%~2" ..
GOTO:EOF

@ENDLOCAL
