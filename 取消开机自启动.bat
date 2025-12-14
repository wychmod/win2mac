@echo off
chcp 65001 >nul
echo ========================================
echo Mac键盘映射 - 取消开机自启动工具
echo ========================================
echo.

set "STARTUP_LINK=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\MacKeyboardMapping.lnk"

if exist "%STARTUP_LINK%" (
    echo [1] 正在删除开机自启动快捷方式...
    del "%STARTUP_LINK%"
    
    if not exist "%STARTUP_LINK%" (
        echo [成功] 已成功取消开机自启动！
        echo.
        echo 注意：如果程序当前正在运行，它不会自动关闭。
        echo 您可以在系统托盘右键点击图标选择"退出"来关闭它。
    ) else (
        echo [错误] 删除失败，请尝试手动删除或以管理员身份运行。
    )
) else (
    echo [提示] 未找到开机自启动配置，可能已经被删除。
)

echo.
pause
