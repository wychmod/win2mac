; ============================================
; Windows keyboard mapping to macOS-style shortcuts
; AutoHotkey v1.1 script
; ============================================

#NoEnv
#SingleInstance Force
#UseHook
SendMode Input
SetWorkingDir %A_ScriptDir%

; Always release the physical Alt key before forwarding the mapped shortcut.
; This prevents applications such as JetBrains IDEs from seeing Alt+C/Alt+S
; and triggering their own menu or action shortcuts before the macOS-style
; mapping is delivered.
MacSend(keys) {
    SendInput, {LAlt up}
    Sleep, 10
    SendInput, %keys%
}

MacMinimizeActiveWindow() {
    SendInput, {LAlt up}
    Sleep, 10
    WinMinimize, A
}

; ============================================
; Core mappings: left Alt acts like macOS Command
; ============================================

; Text editing
$<!c::MacSend("^c")        ; Left Alt+C -> Ctrl+C
$<!v::MacSend("^v")        ; Left Alt+V -> Ctrl+V
$<!x::MacSend("^x")        ; Left Alt+X -> Ctrl+X
$<!a::MacSend("^a")        ; Left Alt+A -> Ctrl+A
$<!s::MacSend("^s")        ; Left Alt+S -> Ctrl+S
$<!z::MacSend("^z")        ; Left Alt+Z -> Ctrl+Z
$<!f::MacSend("^f")        ; Left Alt+F -> Ctrl+F
$<!n::MacSend("^n")        ; Left Alt+N -> Ctrl+N
$<!o::MacSend("^o")        ; Left Alt+O -> Ctrl+O
$<!p::MacSend("^p")        ; Left Alt+P -> Ctrl+P
$<!w::MacSend("^w")        ; Left Alt+W -> Ctrl+W
$<!t::MacSend("^t")        ; Left Alt+T -> Ctrl+T
$<!q::MacSend("!{F4}")     ; Left Alt+Q -> Alt+F4

; Redo
$<!y::MacSend("^y")        ; Left Alt+Y -> Ctrl+Y
$<!+z::MacSend("^y")       ; Left Alt+Shift+Z -> Ctrl+Y

; Browser and file explorer
$<!r::MacSend("^r")        ; Left Alt+R -> Ctrl+R
$<!l::MacSend("^l")        ; Left Alt+L -> Ctrl+L
$<!h::MacSend("^h")        ; Left Alt+H -> Ctrl+H
$<!d::MacSend("^d")        ; Left Alt+D -> Ctrl+D
$<!+t::MacSend("^+t")      ; Left Alt+Shift+T -> Ctrl+Shift+T

; Keep native Windows Alt+Tab behavior. It is intentionally not remapped.

; Browser tab number shortcuts
$<!1::MacSend("^1")
$<!2::MacSend("^2")
$<!3::MacSend("^3")
$<!4::MacSend("^4")
$<!5::MacSend("^5")
$<!6::MacSend("^6")
$<!7::MacSend("^7")
$<!8::MacSend("^8")
$<!9::MacSend("^9")

; Cursor movement
$<!Left::MacSend("^{Left}")
$<!Right::MacSend("^{Right}")
$<!Up::MacSend("^{Home}")
$<!Down::MacSend("^{End}")

; Text selection
$<!+Left::MacSend("^+{Left}")
$<!+Right::MacSend("^+{Right}")
$<!+Up::MacSend("^+{Home}")
$<!+Down::MacSend("^+{End}")

; Deletion
$<!Backspace::MacSend("^{Backspace}")

; Screenshots
$<!+3::MacSend("#{PrintScreen}")
$<!+4::MacSend("#+s")

; Window management
$<!m::MacMinimizeActiveWindow()
$<!`::MacSend("!{Esc}")

; ============================================
; Optional application-specific exclusions
; ============================================

; For remote desktops, virtual machines, games, or other special apps,
; move the relevant mappings into a #If block or define app-specific behavior.
; Example:
;
; #If !WinActive("ahk_exe mstsc.exe") && !WinActive("ahk_exe vmware.exe")
; $<!c::MacSend("^c")
; $<!v::MacSend("^v")
; #If

; ============================================
; Tray menu
; ============================================

TrayTip, Mac Keyboard Mapping, Mapping enabled. Left Alt works as macOS Command., 3, 1

Menu, Tray, NoStandard
Menu, Tray, Add, Reload Config, ReloadScript
Menu, Tray, Add, Edit Config, EditScript
Menu, Tray, Add, Pause Mapping, PauseScript
Menu, Tray, Add, Exit, ExitScript
Menu, Tray, Default, Reload Config
Menu, Tray, Tip, Mac Keyboard Mapping - Running

Return

ReloadScript:
Reload
Return

EditScript:
Edit
Return

PauseScript:
Pause, Toggle
if (A_IsPaused) {
    Menu, Tray, Rename, Pause Mapping, Resume Mapping
    TrayTip, Mac Keyboard Mapping, Mapping paused., 2, 2
} else {
    Menu, Tray, Rename, Resume Mapping, Pause Mapping
    TrayTip, Mac Keyboard Mapping, Mapping resumed., 2, 1
}
Return

ExitScript:
ExitApp
Return
