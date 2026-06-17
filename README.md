<div align="center">

# 🍎➡️ WIN Win2Mac Keyboard Mapping

**让 Windows 键盘像 macOS 一样顺手。**

一个轻量、透明、可审计的 AutoHotkey 脚本，把左 Alt 键变成 macOS 的 Command 键，让长期跨平台工作的人的肌肉记忆不再打架。

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![AutoHotkey](https://img.shields.io/badge/AutoHotkey-v1.1-4caf50.svg)](https://www.autohotkey.com/)
[![Windows](https://img.shields.io/badge/Windows-10%2F11-0078d4.svg)](https://www.microsoft.com/windows)
[![Status](https://img.shields.io/badge/status-stable-brightgreen.svg)]()
[![GitHub](https://img.shields.io/badge/GitHub-win2mac-181717.svg?logo=github)]()

</div>

---

## 目录

- [项目定位](#-项目定位)
- [为什么选择 Win2Mac](#-为什么选择-win2mac)
- [核心特性](#-核心特性)
- [适用场景](#-适用场景)
- [环境要求](#-环境要求)
- [快速开始](#-快速开始)
- [安装与启动](#-安装与启动)
- [快捷键映射](#-快捷键映射)
- [配置说明](#-配置说明)
- [常见问题](#-常见问题)
- [故障排查](#-故障排查)
- [贡献指南](#-贡献指南)
- [许可证](#-许可证)

---

## 项目定位

`Win2Mac` 是一个面向 macOS 用户的 Windows 快捷键映射方案。它通过 AutoHotkey 监听当前用户会话，将 **左 Alt** 组合键转换为对应的 Windows 快捷键，让你在 Windows 上也能自然复用 macOS 的肌肉记忆。

> 🎯 **按下 `Alt + C`，脚本自动发送 `Ctrl + C`。**
> 不用改变键盘布局、不改注册表、不装驱动，即开即用。

本项目是**用户级快捷键增强工具**，不是驱动级固件、键盘布局或注册表重映射方案。它足够轻量，小到可以单文件运行；也足够透明，企业和个人都能按自己的标准审计和定制。

---

## 为什么选择 Win2Mac

| 痛点 | Win2Mac 的解法 |
| --- | --- |
| macOS  muscle memory 在 Windows 上频频失灵 | 左 Alt 模拟 Command，复制 / 粘贴 / 保存 / 查找 / 撤销等高频操作无需重新适应 |
| 驱动 / 注册表重映射风险高、回滚难 | AutoHotkey 脚本级映射，删除文件即卸载 |
| 现有方案影响系统键、输入法或右 Alt | 只拦截 **左 Alt**，Win 键、右 Alt、AltGr 和 `Alt+Tab` 全部保留 |
| 需要管理员权限或安装包 | 普通用户权限即可运行，无需安装、无需联网 |

---

## 核心特性

- 🧠 **macOS 习惯零迁移成本**：左 Alt 扮演 Command 键，复制、粘贴、保存、撤销、查找、全选等一键还原。
- 🌐 **浏览器 + 文件资源管理器**：新建标签、恢复标签、关闭标签、刷新、聚焦地址栏、切换标签页全部覆盖。
- ✍️ **文本导航与选择**：按词移动、跳到文档头尾、按词选择、删除前一词等效率操作 intact。
- 📸 **截图 shortcut**：全屏截图和区域截图都支持。
- 🪟 **窗口管理**：最小化、退出应用、切换窗口，顺手操作。
- 🛡️ **原生系统行为完整保留**：不碰 Win 键、右 Alt、AltGr、`Alt+Tab` 和输入法。
- 📦 **单文件核心实现**：`MacKeyboardMapping.ahk` 一个文件即可运行，易于审计、分发和团队定制。
- 🎛️ **系统托盘菜单**：支持重载配置、编辑脚本、暂停 / 恢复映射、一键退出。
- ⚡ **开机自启动**：提供一键设置 / 取消自启动批处理脚本。
- 🚫 **零依赖**：不需要后台服务、安装包或网络连接。

---

## 适用场景

### ✅ 推荐使用

- 长期或临时在 Windows 开发机上工作的 macOS 用户。
- 企业内部 Windows 终端需要统一 macOS 风格快捷键体验。
- 研发人员在 Windows、远程桌面、虚拟机和本地 IDE 之间频繁切换。
- 需要轻量、可审计、可快速回滚的键盘映射方案。

### ⚠️ 谨慎使用

- 游戏、全屏应用或反作弊环境。
- 远程桌面、虚拟机、堡垒机和云桌面场景。
- 大量依赖右 Alt、AltGr 或特殊输入法组合键的语言输入环境。
- 已同时使用 PowerToys Keyboard Manager、厂商键盘驱动或其他 AutoHotkey 脚本的环境。

---

## 环境要求

| 项目 | 要求 |
| --- | --- |
| 操作系统 | Windows 10 / Windows 11（Windows 7/8 理论可用但未作为主要验证目标） |
| AutoHotkey | [AutoHotkey v1.1](https://www.autohotkey.com/download/) |
| 权限 | 普通用户权限即可；如需作用于管理员权限窗口，需以管理员权限运行脚本 |
| 文件关联 | `.ahk` 文件需关联到 AutoHotkey v1 解释器 |

> ⚠️ **注意**：当前脚本使用 AutoHotkey v1 语法，**不兼容 AutoHotkey v2**。若系统已安装 v2，请同时安装 v1，或确保 `.ahk` 文件由 v1 解释器运行。

---

## 快速开始

```powershell
# 1. 安装 AutoHotkey v1.1
https://www.autohotkey.com/download/

# 2. 双击运行主脚本
MacKeyboardMapping.ahk

# 3. 系统托盘出现 AutoHotkey 图标，即表示生效
```

就是这么简单。30 秒内，你的 Windows 键盘就会开始“macOS 化”。

---

## 安装与启动

### 1. 安装 AutoHotkey

从 AutoHotkey 官方网站下载并安装 **v1.1** 版本：

- 🏠 官网：[https://www.autohotkey.com/](https://www.autohotkey.com/)
- ⬇️ 下载页：[https://www.autohotkey.com/download/](https://www.autohotkey.com/download/)

安装完成后，双击 `.ahk` 文件应能直接运行脚本。

### 2. 获取项目文件

将项目目录放到本机固定位置，例如：

```text
D:\idea\win2mac
```

核心文件说明：

| 文件 | 说明 |
| --- | --- |
| `MacKeyboardMapping.ahk` | 主映射脚本 |
| `设置开机自启动.bat` | 为当前用户创建开机启动快捷方式 |
| `取消开机自启动.bat` | 删除当前用户的开机启动快捷方式 |
| `README.md` | 项目说明文档 |

### 3. 启动映射

双击运行：

```text
MacKeyboardMapping.ahk
```

启动成功后，系统托盘中会出现 AutoHotkey 图标。右键托盘图标可执行：

- 🔄 重新加载配置
- 📝 编辑配置
- ⏸️ 暂停 / 恢复映射
- ❌ 退出

### 4. 设置开机启动

运行：

```text
设置开机自启动.bat
```

该脚本会在当前用户的 Startup 目录中创建快捷方式：

```text
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\MacKeyboardMapping.lnk
```

设置后，下次登录 Windows 时会自动启动映射脚本。

### 5. 取消开机启动

运行：

```text
取消开机自启动.bat
```

> 该脚本只删除开机启动快捷方式，不会自动关闭当前已经运行的 AutoHotkey 进程。如需立即停止映射，请在系统托盘中右键图标并选择退出。

---

## 快捷键映射

> 本项目将 **左 Alt** 作为映射键。表格中的 `Alt` 均指左 Alt，右 Alt 和 AltGr 不参与映射。

### 文本编辑

| macOS 习惯 | 你在 Windows 按 | 实际发送 | 功能 |
| --- | --- | --- | --- |
| `Command + C` | `Alt + C` | `Ctrl + C` | 复制 |
| `Command + V` | `Alt + V` | `Ctrl + V` | 粘贴 |
| `Command + X` | `Alt + X` | `Ctrl + X` | 剪切 |
| `Command + A` | `Alt + A` | `Ctrl + A` | 全选 |
| `Command + S` | `Alt + S` | `Ctrl + S` | 保存 |
| `Command + Z` | `Alt + Z` | `Ctrl + Z` | 撤销 |
| `Command + Y` | `Alt + Y` | `Ctrl + Y` | 重做 |
| `Command + Shift + Z` | `Alt + Shift + Z` | `Ctrl + Y` | 重做 |
| `Command + F` | `Alt + F` | `Ctrl + F` | 查找 |
| `Command + N` | `Alt + N` | `Ctrl + N` | 新建 |
| `Command + O` | `Alt + O` | `Ctrl + O` | 打开 |
| `Command + P` | `Alt + P` | `Ctrl + P` | 打印 |

### 浏览器 & 资源管理器

| macOS 习惯 | 你在 Windows 按 | 实际发送 | 功能 |
| --- | --- | --- | --- |
| `Command + T` | `Alt + T` | `Ctrl + T` | 新建标签页 |
| `Command + Shift + T` | `Alt + Shift + T` | `Ctrl + Shift + T` | 恢复关闭的标签页 |
| `Command + W` | `Alt + W` | `Ctrl + W` | 关闭当前标签页或窗口 |
| `Command + R` | `Alt + R` | `Ctrl + R` | 刷新 |
| `Command + L` | `Alt + L` | `Ctrl + L` | 聚焦地址栏 |
| `Command + H` | `Alt + H` | `Ctrl + H` | 打开历史记录 |
| `Command + D` | `Alt + D` | `Ctrl + D` | 添加书签或收藏 |
| `Command + 1` ~ `9` | `Alt + 1` ~ `9` | `Ctrl + 1` ~ `9` | 跳转到对应标签页 |

### 文本光标移动与选择

| 你在 Windows 按 | 实际发送 | 功能 |
| --- | --- | --- |
| `Alt + ←` | `Ctrl + ←` | 按词向左移动 |
| `Alt + →` | `Ctrl + →` | 按词向右移动 |
| `Alt + ↑` | `Ctrl + Home` | 移动到文档开头 |
| `Alt + ↓` | `Ctrl + End` | 移动到文档末尾 |
| `Alt + Shift + ←` | `Ctrl + Shift + ←` | 向左按词选择 |
| `Alt + Shift + →` | `Ctrl + Shift + →` | 向右按词选择 |
| `Alt + Shift + ↑` | `Ctrl + Shift + Home` | 选择到文档开头 |
| `Alt + Shift + ↓` | `Ctrl + Shift + End` | 选择到文档末尾 |
| `Alt + Backspace` | `Ctrl + Backspace` | 删除前一个词 |

### 窗口管理

| macOS 习惯 | 你在 Windows 按 | 实际行为 | 功能 |
| --- | --- | --- | --- |
| `Command + Q` | `Alt + Q` | `Alt + F4` | 退出当前程序或关闭当前窗口 |
| `Command + M` | `Alt + M` | `WinMinimize` | 最小化当前窗口 |
| `Command + \`` | `Alt + \`` | `Alt + Esc` | 切换到下一个窗口 |

> 💡 说明：Windows 的窗口模型与 macOS 不同，`Alt + \`` 当前映射为 `Alt + Esc`，不保证只在同一应用窗口间切换。

### 截图

| macOS 习惯 | 你在 Windows 按 | 实际发送 | 功能 |
| --- | --- | --- | --- |
| `Command + Shift + 3` | `Alt + Shift + 3` | `Win + PrintScreen` | 全屏截图 |
| `Command + Shift + 4` | `Alt + Shift + 4` | `Win + Shift + S` | 打开 Windows 区域截图工具 |

---

## 配置说明

### 热键语法

脚本使用 AutoHotkey v1 语法。当前实现使用 `#UseHook` 强制键盘钩子，并使用 `<!` 明确限定左 Alt，避免右 Alt 和 AltGr 误触发。

所有映射都应通过 `MacSend(...)` 发送目标快捷键。`MacSend(...)` 会先释放物理左 Alt，再发送目标组合键，避免 JetBrains IDE、Office 等应用先捕获 `Alt + C` 并触发自身菜单快捷键。

```autohotkey
$<!c::MacSend("^c")        ; 左 Alt + C -> Ctrl + C
$<!+t::MacSend("^+t")      ; 左 Alt + Shift + T -> Ctrl + Shift + T
$<!Backspace::MacSend("^{Backspace}")
```

常用符号速查：

| 符号 | 含义 |
| --- | --- |
| `<!` | 左 Alt |
| `+` | Shift |
| `^` | Ctrl |
| `#` | Win |
| `$` | 防止脚本发送的按键再次触发自身热键 |
| `MacSend` | 释放左 Alt 后向当前活动窗口发送目标按键 |

### 修改已有映射

编辑 `MacKeyboardMapping.ahk`，找到对应热键行并调整。例如将 `Alt + Q` 从退出程序改为关闭标签页：

```autohotkey
; 原配置
$<!q::MacSend("!{F4}")

; 修改后
$<!q::MacSend("^w")
```

修改后通过以下方式生效：

- 右键系统托盘 AutoHotkey 图标 → 重新加载配置。
- 或重新双击 `MacKeyboardMapping.ahk`，脚本会因 `#SingleInstance Force` 自动替换旧实例。

### 添加新映射

示例：添加粗体、斜体和下划线。

```autohotkey
$<!b::MacSend("^b")
$<!i::MacSend("^i")
$<!u::MacSend("^u")
```

### 为特定应用排除映射

远程桌面、虚拟机、游戏或专业软件可能需要原生快捷键。若要对特定程序禁用一组映射，建议将相关映射放入条件块：

```autohotkey
#If !WinActive("ahk_exe mstsc.exe") && !WinActive("ahk_exe vmware.exe")
$<!c::MacSend("^c")
$<!v::MacSend("^v")
$<!x::MacSend("^x")
#If
```

> ⚠️ 注意：如果某个热键已经在全局范围定义，再在下方新增应用排除规则并不会自动覆盖全局定义。需要将该热键移动到条件块内，或为该应用单独定义对应热键行为。

---

## 常见问题

### 为什么选择左 Alt，而不是 Win 键？

左 Alt 在大多数 Windows 键盘上的位置更接近 macOS Command 键，适合迁移肌肉记忆。Win 键承载大量系统级快捷键（显示桌面、打开运行、锁屏、窗口布局），保留它可以降低对原生系统行为的影响。

### 右 Alt 或 AltGr 会被影响吗？

不会。当前脚本使用 `<!` 限定左 Alt，不定义右 Alt 热键，也不通过脚本拦截右 Alt 后再发送回去。因此右 Alt 和 AltGr 保持系统原生行为。

### 为什么没有把 `Command + Tab` 映射为标签页切换？

Windows 原生窗口切换依赖 `Alt + Tab`。为了避免破坏系统级窗口切换，本项目不接管该组合。

如果需要浏览器标签切换，建议继续使用 `Ctrl + Tab` / `Ctrl + Shift + Tab`，或自行添加非冲突热键。

### 为什么某些软件里快捷键没有效果？

常见原因：

- 目标软件以管理员权限运行，而脚本以普通权限运行。
- 目标软件使用独立输入框、终端、远程桌面或虚拟化键盘处理逻辑。
- 目标软件已经占用或屏蔽对应快捷键。
- 当前有其他键盘增强工具同时运行并产生冲突。

### 如何临时关闭映射？

右键系统托盘 AutoHotkey 图标，选择 **暂停映射**。再次选择可恢复。若需要完全停止，请选择 **退出**。

### 如何卸载？

1. 运行 `取消开机自启动.bat`。
2. 在系统托盘中退出 AutoHotkey 脚本。
3. 删除项目目录。

---

## 故障排查

### 脚本没有启动

检查项：

1. 是否已安装 AutoHotkey v1.1。
2. 双击 `MacKeyboardMapping.ahk` 后是否有系统托盘图标。
3. `.ahk` 文件是否关联到了 AutoHotkey v1，而不是 v2 或其他编辑器。
4. 是否被安全软件、企业终端管控或应用白名单策略拦截。

可在 PowerShell 中检查进程：

```powershell
Get-Process AutoHotkey* -ErrorAction SilentlyContinue
```

### 快捷键有时没反应

可能原因与处理方式：

| 现象 | 处理方式 |
| --- | --- |
| 当前窗口以管理员权限运行 | 以管理员权限启动脚本 |
| 当前窗口来自远程桌面或虚拟机 | 在该应用中暂停映射，或增加应用排除规则 |
| 目标程序没有实现对应 Ctrl 快捷键 | 确认原生 `Ctrl + C` / `Ctrl + S` 等是否可用 |
| 多个 AutoHotkey 脚本冲突 | 退出其他脚本后重试 |

### 快捷键误触发

处理建议：

- 确认脚本版本使用左 Alt 限定语法 `<!`，而不是通用 Alt 语法 `!`。
- 确认映射热键使用 `$<!...::MacSend(...)`，而不是直接 `<!...::Send ...`。
- 确认脚本顶部包含 `#UseHook`，并且 `MacSend(...)` 会先执行 `SendInput, {LAlt up}`。
- 检查是否有旧版脚本仍在运行。
- 检查是否有 PowerToys、键盘驱动、输入法或 IDE 插件同时做了键位改写。
- 对远程桌面、虚拟机、游戏和特殊应用增加排除规则。

### 开机启动没有生效

检查项：

1. Startup 目录中是否存在 `MacKeyboardMapping.lnk`。
2. 快捷方式目标是否指向当前项目目录下的 `MacKeyboardMapping.ahk`。
3. 项目目录是否被移动或删除。
4. AutoHotkey 是否仍然安装，且 `.ahk` 文件关联正常。

可检查当前用户 Startup 目录：

```powershell
[Environment]::GetFolderPath('Startup')
```

### 修改脚本后没有生效

请重新加载脚本：

- 右键托盘图标 → 重新加载配置。
- 或重新双击 `MacKeyboardMapping.ahk`。

如果仍未生效，确认编辑的是当前开机启动快捷方式指向的脚本文件，而不是另一个副本。

---

## 贡献指南

欢迎提交改进建议、问题反馈和映射方案。请遵循以下原则：

- 🛡️ 保持默认行为保守，不覆盖系统级关键快捷键。
- 🧪 新增映射前先确认不会影响右 Alt、AltGr、Win 键和输入法。
- 📝 修改 README 时必须同步更新快捷键表，避免文档与脚本不一致。
- 🎯 对容易误触发的快捷键优先考虑左 Alt 限定写法 `<!`。
- 🔧 对远程桌面、虚拟机和管理员权限窗口等场景补充排障说明。

提交变更前建议运行测试脚本：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\tests\Test-HotkeyMapping.ps1
```

如果本地没有测试脚本，至少应手工验证：

1. 双击启动脚本。
2. 验证复制、粘贴、保存、查找、浏览器新建标签和截图快捷键。
3. 验证右 Alt 或 AltGr 不被映射影响。
4. 验证系统托盘中的暂停、恢复、重载和退出功能。

---

## 许可证

本项目采用 [MIT License](LICENSE) 开源协议。

```text
MIT License

Copyright (c) 2025 Win2Mac Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

若用于企业内部，请以组织内部的软件分发和安全审计流程为准。

---

<div align="center">

Made with ❤️ for macOS users stuck on Windows.

**[⬆ Back to Top](#-win2mac-keyboard-mapping)**

</div>
