@echo off
chcp 65001 >nul
echo ========================================
echo Mac键盘映射 - 开机自启动配置工具
echo ========================================
echo.

REM 获取脚本所在目录
set "SCRIPT_DIR=%~dp0"
set "AHK_SCRIPT=%SCRIPT_DIR%MacKeyboardMapping.ahk"

REM 检查AHK脚本是否存在
if not exist "%AHK_SCRIPT%" (
    echo [错误] 找不到 MacKeyboardMapping.ahk 文件！
    echo 请确保该文件与此批处理文件在同一目录下。
    pause
    exit /b 1
)

echo [1] 正在设置开机自启动...
echo.

REM 创建启动快捷方式的VBS脚本
set "VBS_SCRIPT=%TEMP%\CreateShortcut.vbs"
(
echo Set oWS = WScript.CreateObject^("WScript.Shell"^)
echo sLinkFile = oWS.SpecialFolders^("Startup"^) ^& "\MacKeyboardMapping.lnk"
echo Set oLink = oWS.CreateShortcut^(sLinkFile^)
echo oLink.TargetPath = "%AHK_SCRIPT%"
echo oLink.WorkingDirectory = "%SCRIPT_DIR%"
echo oLink.Description = "Mac键盘映射自动启动"
echo oLink.Save
) > "%VBS_SCRIPT%"

REM 执行VBS脚本创建快捷方式
cscript //nologo "%VBS_SCRIPT%"

if %errorlevel% equ 0 (
    echo [成功] 已成功添加到开机自启动！
    echo.
    echo 快捷方式位置: %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
    echo.
    echo [2] 是否立即启动Mac键盘映射? ^(Y/N^)
    choice /c YN /n /m "请选择: "
    if errorlevel 2 goto :skip_start
    if errorlevel 1 goto :start_script
) else (
    echo [错误] 设置自启动失败！
    echo 请尝试以管理员身份运行此脚本。
)

REM 删除临时VBS脚本
del "%VBS_SCRIPT%" 2>nul

pause
exit /b 0

:start_script
echo.
echo [启动中] 正在启动Mac键盘映射...
start "" "%AHK_SCRIPT%"
echo [完成] Mac键盘映射已启动！
echo.
echo 您可以在系统托盘看到绿色的H图标。
echo 右键点击可以暂停、编辑或退出映射。
goto :cleanup

:skip_start
echo.
echo 已跳过启动，下次开机将自动运行。
goto :cleanup

:cleanup
del "%VBS_SCRIPT%" 2>nul
echo.
pause
