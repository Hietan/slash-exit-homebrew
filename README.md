# slash-exit

<div align="center">

![GitHub release (latest by date)](https://img.shields.io/github/v/release/Hietan/slash-exit-homebrew?style=for-the-badge)
![GitHub](https://img.shields.io/github/license/Hietan/slash-exit-homebrew?style=for-the-badge)
![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-blue?style=for-the-badge)
![Shell](https://img.shields.io/badge/shell-zsh%20%7C%20bash-green?style=for-the-badge)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Hietan/slash-exit-homebrew/test.yml?style=for-the-badge&label=tests)
![Homebrew](https://img.shields.io/badge/homebrew-supported-orange?style=for-the-badge)

**A fun command for when you accidentally type `/exit` instead of `exit`.**

*Inspired by the classic `sl` (Steam Locomotive) command.*

🚀 **Perfect for Claude Code users!** 🚀

[📥 Install](#installation) • [🎬 Demo](#demo) • [📚 Documentation](#what-does-it-do) • [🤝 Contributing](#contributing)

</div>

---

## 🎬 Demo

When you accidentally type `/exit`, you'll see:

<div align="center">

| Stage | Duration | Description |
|-------|----------|-------------|
| 🚪 **Door Animation** | 3 seconds | Door opens, shakes, and slams shut with sound effects |
| 🌍 **Multilingual Goodbye** | 2 seconds | "Goodbye" in 10 different languages with flag emojis |
| 😄 **Friendly Reminder** | - | Helpful message about the correct command |

</div>

> **Try it yourself:** After installation, just type `/exit` in your terminal!

## 📥 Installation

<div align="center">

### 🍺 Via Homebrew (Recommended)

</div>

```bash
# Add the tap
brew tap Hietan/tap

# Install slash-exit
brew install slash-exit

# Enable the /exit command
slash-exit-enable
```

<div align="center">

### 🔧 Manual Installation

</div>

```bash
# Clone the repository
git clone https://github.com/Hietan/slash-exit-homebrew.git
cd slash-exit-homebrew

# Make scripts executable
chmod +x bin/slash-exit bin/slash-exit-enable

# Run the setup script
./bin/slash-exit-enable
```

<div align="center">

### ✅ Verification

</div>

```bash
# Test the installation
/exit

# Check if the command is available
which slash-exit
```

## 📚 What does it do?

<div align="center">

### 🎭 Animation Sequence

</div>

<details>
<summary><strong>🚪 Door Animation (3 seconds)</strong></summary>

- Door slowly opens
- Door shakes and rattles
- Door slams shut with a *SLAM!*
- Lock clicks into place with *CLICK!*

</details>

<details>
<summary><strong>🌍 Multilingual Goodbye (2 seconds)</strong></summary>

- Displays "Goodbye" in 10 languages with flag emojis
- Languages: English, Japanese, French, German, Italian, Spanish, Chinese, Korean, Russian, Portuguese
- Each message appears with color cycling

</details>

<details>
<summary><strong>😄 Final Message</strong></summary>

- Helpful reminder: "But don't worry, you're still here! 😄"
- Instructions: "To actually exit, type 'exit' (without the slash)"

</details>

<div align="center">

### 🗺️ Supported Languages

</div>

<div align="center">

| Flag | Language | Text |
|------|----------|------|
| 🇬🇧 | English | "Goodbye!" |
| 🇯🇵 | Japanese | "さようなら！" |
| 🇫🇷 | French | "Au revoir!" |
| 🇩🇪 | German | "Auf Wiedersehen!" |
| 🇮🇹 | Italian | "Arrivederci!" |
| 🇪🇸 | Spanish | "¡Adiós!" |
| 🇨🇳 | Chinese | "再见!" |
| 🇰🇷 | Korean | "안녕히 가세요!" |
| 🇷🇺 | Russian | "До свидания!" |
| 🇧🇷 | Portuguese | "Tchau!" |

</div>

## 🤖 For Claude Code Users

<div align="center">

We know that typing `/exit` instead of `exit` is a common mistake when using Claude Code.  
This command turns that frustrating moment into a **fun, entertaining experience**!

> *"Turn your typos into entertainment!"* 🎉

</div>

## 🛠️ Commands

<div align="center">

### ⚡ `slash-exit`

</div>

The main command that displays the animation. You can run it directly:

```bash
slash-exit
```

<div align="center">

### 🔧 `slash-exit-enable`

</div>

Setup script that adds the `/exit` function to your shell configuration:

```bash
slash-exit-enable
```

<div align="center">

**✨ Features:**
- 🔍 Automatically detects your shell (zsh, bash)
- 🛡️ Creates timestamped backups of your config files
- 🔐 Safely adds shell function without conflicts
- 💬 Interactive confirmation prompts

</div>

## ⚙️ Technical Details

<div align="center">

### 📋 Requirements

</div>

<div align="center">

| Requirement | Status |
|-------------|--------|
| 🍎 macOS or 🐧 Linux | ✅ Supported |
| 🎨 Terminal with color support | ⚠️ Optional |
| 🐚 Bash or Zsh shell | ✅ Required |

</div>

<div align="center">

### 🚀 Features

</div>

<div align="center">

| Feature | Description |
|---------|-------------|
| 📱 **Responsive Design** | Adapts to terminal size |
| 🎨 **Color Support** | Automatic detection with monochrome fallback |
| 🛡️ **Error Handling** | Graceful degradation for small terminals |
| 🐛 **Debug Mode** | `SLASH_EXIT_DEBUG=1` for quick testing |
| 🔒 **Safe Installation** | Backup creation and conflict detection |

</div>

<div align="center">

### 🔌 Shell Integration

</div>

The setup script adds this function to your shell config:

```bash
# slash-exit command (installed via homebrew)
'/exit'() {
    /opt/homebrew/bin/slash-exit "$@"
}
```

## 🔧 Development

<div align="center">

### 🧪 Running Tests

</div>

```bash
# Run the full test suite
./tests/test_slash_exit.sh

# Test with ShellCheck (requires shellcheck)
shellcheck bin/slash-exit bin/slash-exit-enable
```

<div align="center">

### 📁 Project Structure

</div>

```
slash-exit-homebrew/
├── 📁 bin/
│   ├── 🚀 slash-exit           # Main animation script
│   └── ⚙️ slash-exit-enable    # Setup script
├── 📁 Formula/
│   └── 🍺 slash-exit.rb        # Homebrew Formula
├── 📁 tests/
│   └── 🧪 test_slash_exit.sh   # Test suite
├── 📁 .github/
│   ├── 📁 workflows/
│   │   ├── ✅ test.yml         # CI: Tests
│   │   └── 🚀 release.yml      # CD: Release automation
│   └── 📁 ISSUE_TEMPLATE/
│       ├── 🐛 bug_report.yml
│       └── ✨ feature_request.yml
└── 📄 README.md
```

## 🤝 Contributing

<div align="center">

**We welcome contributions!** 🎉

</div>

<div align="center">

### 🚀 Quick Start

</div>

1. 🍴 **Fork** the repository
2. 🌿 **Create** your feature branch (`git checkout -b feature/amazing-feature`)
3. ✨ **Make** your changes
4. 🧪 **Run** tests (`./tests/test_slash_exit.sh`)
5. 📝 **Commit** your changes (`git commit -m 'Add amazing feature'`)
6. 🚀 **Push** to the branch (`git push origin feature/amazing-feature`)
7. 🔀 **Open** a Pull Request

<div align="center">

### 📝 Guidelines

</div>

<div align="center">

| Type | Description |
|------|-------------|
| 🐛 **Bug Fix** | Fix existing functionality |
| ✨ **Feature** | Add new functionality |
| 📚 **Documentation** | Improve documentation |
| 🎨 **Style** | Code formatting changes |
| ♻️ **Refactor** | Code restructuring |
| 🧪 **Test** | Add or update tests |

</div>

<div align="center">

### 💡 Ideas for Contributions

</div>

- 🎨 New animation themes
- 🌍 Additional language support
- 🔧 Performance improvements
- 📱 Mobile terminal support
- 🎵 Sound effects (optional)
- 🏃‍♂️ Faster animation modes

<div align="center">

**See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines**

</div>

## 📜 License

<div align="center">

This project is licensed under the **Apache License 2.0**  
See the [LICENSE](LICENSE) file for details.

</div>

## 🙏 Acknowledgments

<div align="center">

- 🚂 Inspired by the classic `sl` (Steam Locomotive) command
- 💝 Created with love for the Claude Code community
- 🎉 Special thanks to all the beta testers who accidentally typed `/exit` 😄

</div>

---

<div align="center">

### 🌟 Show Your Support

If you found this project helpful, please consider:

[![GitHub stars](https://img.shields.io/github/stars/Hietan/slash-exit-homebrew?style=social)](https://github.com/Hietan/slash-exit-homebrew/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Hietan/slash-exit-homebrew?style=social)](https://github.com/Hietan/slash-exit-homebrew/network/members)

**⭐ Star this repo** • **🍴 Fork it** • **📢 Share it**

</div>

<div align="center">

### 📬 Connect

[![GitHub](https://img.shields.io/badge/GitHub-Hietan-black?style=for-the-badge&logo=github)](https://github.com/Hietan)

*Made with ❤️ by [Hietan](https://github.com/Hietan)*

</div>

<div align="center">

---

*Remember: It's `/exit` for fun, `exit` for real! 🚪✨*

</div>