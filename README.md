# 🖱️ Windows 11 Mouse Gestures (MX Master Style)

A lightweight **AutoHotkey** script that brings gesture functionality—inspired by the Logitech MX Master 3—to any standard mouse. Manage virtual desktops, windows, and system shortcuts using simple swipes with the middle mouse button.

## ✨ Features
- **Virtual Desktops:** Seamlessly switch between workspaces with horizontal swipes.
- **Task View:** Quick access to all open windows.
- **Productivity Shortcuts:** Open File Explorer or close apps with diagonal gestures.
- **Smart Detection:** Advanced logic to differentiate between straight swipes and diagonal movements, preventing accidental triggers.
- **Non-Intrusive:** Quick middle-clicks still function normally (e.g., for opening links in browser tabs).

## 🚀 Controls (Gestures)

Hold the **Middle Mouse Button (Wheel)** and move the mouse in the following directions:

| Gesture | Action | Shortcut |
| :--- | :--- | :--- |
| **⬅️ Left / ➡️ Right** | Switch Virtual Desktops | `Win + Ctrl + Left/Right` |
| **⬆️ Up** | Open Task View | `Win + Tab` |
| **⬇️ Down** | Show/Hide Desktop (Minimize All) | `Win + D` |
| **↗️ Diagonal Up-Right** | Open File Explorer | `Explorer.exe` |
| **↖️ Diagonal Up-Left** | Close Active Window | `Alt + F4` |

> **Pro Tip:** Press `Ctrl + Alt + S` to instantly Suspend/Resume the script.

## 🛠️ Installation & Usage

1. **Install AutoHotkey:** Download and install **> v1.1** from the [official website](https://www.autohotkey.com/).
2. **Download the Script:** Save the `.ahk` file to your local machine.
3. **Run:** Double-click the script. A green "H" icon will appear in your system tray.
4. **Auto-Start (Optional):** Press `Win + R`, type `shell:startup`, and place a shortcut to the script in that folder to launch it on Windows boot.

## ⚙️ Customization
You can fine-tune the behavior by editing the variables at the top of the script:
- `threshold`: The minimum distance (in pixels) the mouse must move to trigger a gesture.
- `diagonal_ratio`: The precision required for diagonal swipes (default `0.6`). Increase toward `1.0` for stricter diagonal detection.

## 📝 License
This project is open-source and available under the MIT License.
