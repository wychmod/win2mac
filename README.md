# Mac键盘映射 for Windows

将Windows键盘映射为Mac操作习惯，让您在Windows系统上也能使用熟悉的Mac快捷键。

## 📋 功能特性

### ✅ 已实现的功能

- **完整的Mac风格快捷键映射**：使用左Alt键代替Mac的Cmd键
- **常用编辑快捷键**：
  - `Alt+C` → 复制 (Ctrl+C)
  - `Alt+V` → 粘贴 (Ctrl+V)
  - `Alt+X` → 剪切 (Ctrl+X)
  - `Alt+A` → 全选 (Ctrl+A)
  - `Alt+S` → 保存 (Ctrl+S)
  - `Alt+Z` → 撤销 (Ctrl+Z)
  - `Alt+F` → 查找 (Ctrl+F)
  
- **浏览器/文件管理快捷键**：
  - `Alt+T` → 新建标签页
  - `Alt+W` → 关闭窗口
  - `Alt+Q` → 退出程序 (Alt+F4)
  - `Alt+R` → 刷新页面
  - `Alt+Tab` → 标签页切换
  - `Alt+1~9` → 跳转到对应标签页

- **文本光标移动**：
  - `Alt+←/→` → 按词移动
  - `Alt+↑/↓` → 跳转到文档开头/末尾
  - `Alt+Shift+←/→/↑/↓` → 选择文本

- **截图快捷键**：
  - `Alt+Shift+3` → 全屏截图
  - `Alt+Shift+4` → 区域截图

- **开机自启动**：提供一键配置工具
- **系统托盘控制**：右键菜单可暂停/恢复/退出映射

## 🚀 快速开始

### 1. 安装AutoHotkey

下载并安装AutoHotkey (免费开源软件)：
- 官方网站：https://www.autohotkey.com/
- 下载地址：https://www.autohotkey.com/download/ahk-install.exe

**安装步骤**：
1. 下载安装包
2. 双击运行，选择"Express Installation"（快速安装）
3. 安装完成后，系统将支持运行 `.ahk` 脚本文件

### 2. 运行键盘映射

双击 `MacKeyboardMapping.ahk` 文件即可启动键盘映射。

启动成功后：
- 系统托盘会显示绿色的 "H" 图标
- 弹出提示："映射已激活！使用Alt键作为Mac的Cmd键"

### 3. 设置开机自启动

运行 `设置开机自启动.bat` 批处理文件，按提示操作即可。

如需取消自启动，运行 `取消开机自启动.bat` 即可。

## 📖 使用说明

### 核心映射逻辑

本方案将**左Alt键**映射为Mac的**Cmd键**功能，这样：
- 您可以像在Mac上一样使用 `Alt+C` 复制、`Alt+V` 粘贴
- 右Alt键保持原有功能，不受影响
- Windows键（Win键）保持原有功能

### 系统托盘控制

右键点击系统托盘的AutoHotkey图标，可以：
- **重新加载配置**：修改脚本后刷新设置
- **编辑配置**：打开脚本文件进行自定义修改
- **暂停映射**：临时禁用键盘映射
- **退出**：完全关闭映射程序

### 特殊应用处理

对于某些特殊应用（如虚拟机、远程桌面），您可能希望禁用映射。

编辑 `MacKeyboardMapping.ahk` 文件，找到以下代码并取消注释：

```autohotkey
; 在VMware中禁用映射
#IfWinActive ahk_exe vmware.exe
LAlt::Send {LAlt}
#IfWinActive

; 在远程桌面中禁用映射
#IfWinActive ahk_exe mstsc.exe
LAlt::Send {LAlt}
#IfWinActive
```

## 🎯 完整快捷键列表

### 文本编辑类
| Mac快捷键 | Windows映射 | 功能说明 |
|----------|------------|---------|
| Cmd+C | Alt+C | 复制 |
| Cmd+V | Alt+V | 粘贴 |
| Cmd+X | Alt+X | 剪切 |
| Cmd+A | Alt+A | 全选 |
| Cmd+S | Alt+S | 保存 |
| Cmd+Z | Alt+Z | 撤销 |
| Cmd+Y / Cmd+Shift+Z | Alt+Y / Alt+Shift+Z | 重做 |
| Cmd+F | Alt+F | 查找 |
| Cmd+N | Alt+N | 新建 |
| Cmd+O | Alt+O | 打开 |
| Cmd+P | Alt+P | 打印 |

### 窗口管理类
| Mac快捷键 | Windows映射 | 功能说明 |
|----------|------------|---------|
| Cmd+W | Alt+W | 关闭窗口 |
| Cmd+Q | Alt+Q | 退出程序 |
| Cmd+M | Alt+M | 最小化窗口 |
| Cmd+T | Alt+T | 新建标签页 |
| Cmd+Shift+T | Alt+Shift+T | 恢复关闭的标签 |
| Cmd+Tab | Alt+Tab | 标签页切换 |
| Cmd+` | Alt+` | 同应用窗口切换 |

### 浏览器类
| Mac快捷键 | Windows映射 | 功能说明 |
|----------|------------|---------|
| Cmd+R | Alt+R | 刷新页面 |
| Cmd+L | Alt+L | 地址栏 |
| Cmd+H | Alt+H | 历史记录 |
| Cmd+D | Alt+D | 添加书签 |
| Cmd+1~9 | Alt+1~9 | 跳转到对应标签 |

### 光标移动类
| Mac快捷键 | Windows映射 | 功能说明 |
|----------|------------|---------|
| Cmd+← | Alt+← | 移动到词首 |
| Cmd+→ | Alt+→ | 移动到词尾 |
| Cmd+↑ | Alt+↑ | 移动到文档开头 |
| Cmd+↓ | Alt+↓ | 移动到文档末尾 |
| Cmd+Shift+← | Alt+Shift+← | 选择到词首 |
| Cmd+Shift+→ | Alt+Shift+→ | 选择到词尾 |
| Cmd+Backspace | Alt+Backspace | 删除整个词 |

### 截图类
| Mac快捷键 | Windows映射 | 功能说明 |
|----------|------------|---------|
| Cmd+Shift+3 | Alt+Shift+3 | 全屏截图 |
| Cmd+Shift+4 | Alt+Shift+4 | 区域截图 |

## ⚙️ 自定义配置

### 添加新的快捷键映射

编辑 `MacKeyboardMapping.ahk` 文件，添加新的映射规则：

```autohotkey
; 格式：LAlt & 键名::Send 目标键
LAlt & b::Send ^b        ; Alt+B → Ctrl+B (加粗)
LAlt & i::Send ^i        ; Alt+I → Ctrl+I (斜体)
LAlt & u::Send ^u        ; Alt+U → Ctrl+U (下划线)
```

### 修改现有映射

找到对应的映射行并修改即可。例如，如果您想让 `Alt+Q` 关闭当前标签页而非退出程序：

```autohotkey
; 修改前
LAlt & q::Send !{F4}     ; Cmd+Q → Alt+F4 (退出程序)

; 修改后
LAlt & q::Send ^w        ; Cmd+Q → Ctrl+W (关闭标签页)
```

修改后，右键托盘图标选择"重新加载配置"即可生效。

## 🔧 常见问题

### Q: 为什么选择Alt键而不是Win键作为Cmd键？

A: 因为：
1. Alt键的位置与Mac键盘上的Cmd键位置更接近
2. Win键在Windows系统中有重要的系统功能（如Win+D显示桌面）
3. 使用Alt键更符合Mac用户的肌肉记忆

### Q: 映射会影响游戏或特殊软件吗？

A: 大多数情况下不会。如果某些软件出现问题，您可以：
1. 在托盘图标右键选择"暂停映射"
2. 在配置文件中添加该应用的例外规则（参考"特殊应用处理"章节）

### Q: 如何暂时禁用映射？

A: 右键点击系统托盘的AutoHotkey图标，选择"暂停映射"即可。再次点击可恢复。

### Q: 卸载该映射

A: 
1. 运行 `取消开机自启动.bat` 删除自启动配置
2. 右键托盘图标选择"退出"
3. 删除整个文件夹即可

### Q: 映射不生效怎么办？

A: 请检查：
1. AutoHotkey是否正确安装
2. `MacKeyboardMapping.ahk` 是否正在运行（查看系统托盘）
3. 是否被某些安全软件拦截（添加到白名单）

## 💡 技术说明

### 稳定性保证

本方案使用AutoHotkey实现，具有以下优势：
- **成熟稳定**：AutoHotkey是Windows上最成熟的键盘映射工具，已有20年历史
- **轻量级**：占用资源极少，后台运行不影响系统性能
- **开源免费**：完全开源，无后门风险
- **可定制性强**：脚本语言简单易懂，可随意修改

### 系统兼容性

- 支持Windows 7/8/10/11
- 适配所有键盘类型
- 不影响系统其他功能

## 📝 许可证

本项目采用MIT许可证，可自由使用和修改。

## 🤝 贡献

如果您有任何改进建议或发现问题，欢迎：
- 修改配置文件满足您的个人需求
- 分享您的自定义配置方案

---

**享受Mac般流畅的操作体验！** 🎉
