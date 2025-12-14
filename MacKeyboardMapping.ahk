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

; 文本编辑快捷键 - 使用!表示Alt键，只映射纯Alt组合
!c::Send ^c        ; Alt+C → Ctrl+C (复制)
!v::Send ^v        ; Alt+V → Ctrl+V (粘贴)
!x::Send ^x        ; Alt+X → Ctrl+X (剪切)
!a::Send ^a        ; Alt+A → Ctrl+A (全选)
!s::Send ^s        ; Alt+S → Ctrl+S (保存)
!z::Send ^z        ; Alt+Z → Ctrl+Z (撤销)
!f::Send ^f        ; Alt+F → Ctrl+F (查找)
!n::Send ^n        ; Alt+N → Ctrl+N (新建)
!o::Send ^o        ; Alt+O → Ctrl+O (打开)
!p::Send ^p        ; Alt+P → Ctrl+P (打印)
!w::Send ^w        ; Alt+W → Ctrl+W (关闭窗口)
!t::Send ^t        ; Alt+T → Ctrl+T (新建标签)
!q::Send !{F4}     ; Alt+Q → Alt+F4 (退出程序)

; 撤销/重做
!y::Send ^y        ; Alt+Y → Ctrl+Y (重做)

; Alt+Shift+Z → Ctrl+Y (重做)
+!z::Send ^y

; 浏览器和资源管理器快捷键
!r::Send ^r        ; Alt+R → Ctrl+R (刷新)
!l::Send ^l        ; Alt+L → Ctrl+L (地址栏)
!h::Send ^h        ; Alt+H → Ctrl+H (历史记录)
!d::Send ^d        ; Alt+D → Ctrl+D (添加书签)

; Alt+Shift+T → Ctrl+Shift+T (恢复关闭的标签)
; 注意：这里需要特殊处理，因为!t已被占用
; +!t::Send ^+t  ; 此行已注释，因为与!t冲突

; 标签页切换 (已禁用，保留原生Alt+Tab窗口切换功能)
; LAlt & Tab::Send ^{Tab}      ; Cmd+Tab → Ctrl+Tab (下一个标签) - 已注释
; +!Tab::Send ^+{Tab}          ; Cmd+Shift+Tab → Ctrl+Shift+Tab (上一个标签) - 已注释

; 数字键快捷键(浏览器标签页跳转)
!1::Send ^1
!2::Send ^2
; !3 和 !4 被截图快捷键占用，见下方截图部分
!5::Send ^5
!6::Send ^6
!7::Send ^7
!8::Send ^8
!9::Send ^9

; 光标移动(Mac风格)
!Left::Send ^{Left}    ; Alt+← → Ctrl+← (按词移动)
!Right::Send ^{Right}  ; Alt+→ → Ctrl+→ (按词移动)
!Up::Send ^{Home}      ; Alt+↑ → Ctrl+Home (文档开头)
!Down::Send ^{End}     ; Alt+↓ → Ctrl+End (文档末尾)

; 选择文本(Mac风格) - 使用独立热键定义
+!Left::Send ^+{Left}     ; Cmd+Shift+← (选择到词首)
+!Right::Send ^+{Right}   ; Cmd+Shift+→ (选择到词尾)
+!Up::Send ^+{Home}       ; Cmd+Shift+↑ (选择到文档开头)
+!Down::Send ^+{End}      ; Cmd+Shift+↓ (选择到文档末尾)

; 删除操作(Mac风格)
!Backspace::Send ^{Backspace}  ; Alt+Backspace → 删除整个词

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

; Alt+Shift+3 → 全屏截图
+!3::Send #{PrintScreen}

; Alt+Shift+4 → 区域截图
+!4::Send #+s

; ============================================
; 窗口管理
; ============================================

; Alt+M → 最小化窗口
!m::WinMinimize, A

; Alt+` → 同一应用的窗口切换
!`::Send !{Esc}

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
