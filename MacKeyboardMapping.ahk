; ============================================
; Windows键盘映射为Mac风格配置
; 使用AutoHotkey实现Mac操作习惯
; ============================================

#NoEnv
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%

; ============================================
; 核心映射：将左Alt映射为Cmd键的功能
; ============================================

; 文本编辑快捷键
LAlt & c::Send ^c        ; Cmd+C → Ctrl+C (复制)
LAlt & v::Send ^v        ; Cmd+V → Ctrl+V (粘贴)
LAlt & x::Send ^x        ; Cmd+X → Ctrl+X (剪切)
LAlt & a::Send ^a        ; Cmd+A → Ctrl+A (全选)
LAlt & s::Send ^s        ; Cmd+S → Ctrl+S (保存)
LAlt & z::Send ^z        ; Cmd+Z → Ctrl+Z (撤销)
LAlt & f::Send ^f        ; Cmd+F → Ctrl+F (查找)
LAlt & n::Send ^n        ; Cmd+N → Ctrl+N (新建)
LAlt & o::Send ^o        ; Cmd+O → Ctrl+O (打开)
LAlt & p::Send ^p        ; Cmd+P → Ctrl+P (打印)
LAlt & w::Send ^w        ; Cmd+W → Ctrl+W (关闭窗口)
LAlt & t::Send ^t        ; Cmd+T → Ctrl+T (新建标签)
LAlt & q::Send !{F4}     ; Cmd+Q → Alt+F4 (退出程序)

; 撤销/重做
LAlt & y::Send ^y        ; Cmd+Y → Ctrl+Y (重做)
; Cmd+Shift+Z → Ctrl+Y (重做) - 使用独立热键定义
+!z::Send ^y

; 浏览器和资源管理器快捷键
LAlt & r::Send ^r        ; Cmd+R → Ctrl+R (刷新)
LAlt & l::Send ^l        ; Cmd+L → Ctrl+L (地址栏)
LAlt & h::Send ^h        ; Cmd+H → Ctrl+H (历史记录)
LAlt & d::Send ^d        ; Cmd+D → Ctrl+D (添加书签)
; Cmd+Shift+T → Ctrl+Shift+T (恢复关闭的标签) - 使用独立热键定义
+!t::Send ^+t

; 标签页切换
LAlt & Tab::Send ^{Tab}      ; Cmd+Tab → Ctrl+Tab (下一个标签)
; Cmd+Shift+Tab → Ctrl+Shift+Tab (上一个标签) - 使用独立热键定义
+!Tab::Send ^+{Tab}

; 数字键快捷键(浏览器标签页跳转)
LAlt & 1::Send ^1
LAlt & 2::Send ^2
LAlt & 3::Send ^3
LAlt & 4::Send ^4
LAlt & 5::Send ^5
LAlt & 6::Send ^6
LAlt & 7::Send ^7
LAlt & 8::Send ^8
LAlt & 9::Send ^9

; 光标移动(Mac风格)
LAlt & Left::Send ^{Left}    ; Cmd+← → Ctrl+← (按词移动)
LAlt & Right::Send ^{Right}  ; Cmd+→ → Ctrl+→ (按词移动)
LAlt & Up::Send ^{Home}      ; Cmd+↑ → Ctrl+Home (文档开头)
LAlt & Down::Send ^{End}     ; Cmd+↓ → Ctrl+End (文档末尾)

; 选择文本(Mac风格) - 使用独立热键定义
+!Left::Send ^+{Left}     ; Cmd+Shift+← (选择到词首)
+!Right::Send ^+{Right}   ; Cmd+Shift+→ (选择到词尾)
+!Up::Send ^+{Home}       ; Cmd+Shift+↑ (选择到文档开头)
+!Down::Send ^+{End}      ; Cmd+Shift+↓ (选择到文档末尾)

; 删除操作(Mac风格)
LAlt & Backspace::Send ^{Backspace}  ; Cmd+Backspace → 删除整个词

; ============================================
; 保留原有的Windows快捷键功能
; ============================================

; 保留Win键的原有功能
LWin::Send {LWin}
RWin::Send {RWin}

; 保留右Alt键的原有功能(用于某些特殊字符输入)
RAlt::Send {RAlt}

; ============================================
; 截图快捷键(Mac风格)
; ============================================

; Cmd+Shift+3 → 全屏截图 - 使用独立热键定义
+!3::Send #{PrintScreen}

; Cmd+Shift+4 → 区域截图 - 使用独立热键定义
+!4::Send #+s

; ============================================
; 窗口管理
; ============================================

; Cmd+M → 最小化窗口
LAlt & m::WinMinimize, A

; Cmd+` → 同一应用的窗口切换
LAlt & `::Send !{Esc}

; ============================================
; 特殊应用优化(可选)
; ============================================

; 在某些特定应用中禁用映射(如虚拟机、远程桌面)
; 取消注释以下代码来禁用特定应用的映射
/*
#IfWinActive ahk_exe vmware.exe
LAlt::Send {LAlt}
#IfWinActive

#IfWinActive ahk_exe mstsc.exe
LAlt::Send {LAlt}
#IfWinActive
*/

; ============================================
; 系统托盘提示
; ============================================

; 显示启动提示
TrayTip, Mac键盘映射, 映射已激活！使用Alt键作为Mac的Cmd键。, 3, 1

; 右键菜单
Menu, Tray, NoStandard
Menu, Tray, Add, 重新加载配置, ReloadScript
Menu, Tray, Add, 编辑配置, EditScript
Menu, Tray, Add, 暂停映射, PauseScript
Menu, Tray, Add, 退出, ExitScript
Menu, Tray, Default, 重新加载配置
Menu, Tray, Tip, Mac键盘映射 - 运行中

Return

; 菜单功能
ReloadScript:
Reload
Return

EditScript:
Edit
Return

PauseScript:
Pause, Toggle
if (A_IsPaused) {
    Menu, Tray, Rename, 暂停映射, 恢复映射
    TrayTip, Mac键盘映射, 映射已暂停, 2, 2
} else {
    Menu, Tray, Rename, 恢复映射, 暂停映射
    TrayTip, Mac键盘映射, 映射已恢复, 2, 1
}
Return

ExitScript:
ExitApp
Return
