# slash-exit

A fun command for when you accidentally type `/exit` instead of `exit`. 
Inspired by the classic `sl` (Steam Locomotive) command.

Perfect for Claude Code users! 🚀

## Demo

When you accidentally type `/exit`, you'll see:
- 🚪 An animated door closing with sound effects
- 🌍 "Goodbye" in 10 different languages
- 😄 A friendly reminder about the correct command

## Installation

### Via Homebrew (Recommended)

```bash
# Add the tap
brew tap Hietan/tap

# Install slash-exit
brew install slash-exit

# Enable the /exit command
slash-exit-enable
```

### Manual Installation

```bash
# Clone the repository
git clone https://github.com/Hietan/slash-exit-homebrew.git
cd slash-exit-homebrew

# Make scripts executable
chmod +x bin/slash-exit bin/slash-exit-enable

# Run the setup script
./bin/slash-exit-enable
```

## What does it do?

### Animation Sequence

1. **Door Animation (3 seconds)**
   - Door slowly opens
   - Door shakes and rattles
   - Door slams shut with a *SLAM!*
   - Lock clicks into place with *CLICK!*

2. **Multilingual Goodbye (2 seconds)**
   - Displays "Goodbye" in 10 languages with flag emojis
   - Languages: English, Japanese, French, German, Italian, Spanish, Chinese, Korean, Russian, Portuguese
   - Each message appears with color cycling

3. **Final Message**
   - Helpful reminder: "But don't worry, you're still here! 😄"
   - Instructions: "To actually exit, type 'exit' (without the slash)"

### Supported Languages

- 🇬🇧 English: "Goodbye!"
- 🇯🇵 Japanese: "さようなら！"
- 🇫🇷 French: "Au revoir!"
- 🇩🇪 German: "Auf Wiedersehen!"
- 🇮🇹 Italian: "Arrivederci!"
- 🇪🇸 Spanish: "¡Adiós!"
- 🇨🇳 Chinese: "再见!"
- 🇰🇷 Korean: "안녕히 가세요!"
- 🇷🇺 Russian: "До свидания!"
- 🇧🇷 Portuguese: "Tchau!"

## For Claude Code Users

We know that typing `/exit` instead of `exit` is a common mistake when using Claude Code. 
This command turns that frustrating moment into a fun, entertaining experience!

## Commands

### `slash-exit`
The main command that displays the animation. You can run it directly:

```bash
slash-exit
```

### `slash-exit-enable`
Setup script that adds the `/exit` function to your shell configuration:

```bash
slash-exit-enable
```

**Features:**
- Automatically detects your shell (zsh, bash)
- Creates timestamped backups of your config files
- Safely adds shell function without conflicts
- Interactive confirmation prompts

## Technical Details

### Requirements
- macOS or Linux
- Terminal with color support (optional)
- Bash or Zsh shell

### Features
- **Responsive Design**: Adapts to terminal size
- **Color Support**: Automatic detection with monochrome fallback
- **Error Handling**: Graceful degradation for small terminals
- **Debug Mode**: `SLASH_EXIT_DEBUG=1` for quick testing
- **Safe Installation**: Backup creation and conflict detection

### Shell Integration

The setup script adds this function to your shell config:

```bash
# slash-exit command (installed via homebrew)
'/exit'() {
    /opt/homebrew/bin/slash-exit "$@"
}
```

## Development

### Running Tests

```bash
# Run the full test suite
./tests/test_slash_exit.sh

# Test with ShellCheck (requires shellcheck)
shellcheck bin/slash-exit bin/slash-exit-enable
```

### Project Structure

```
slash-exit-homebrew/
├── bin/
│   ├── slash-exit           # Main animation script
│   └── slash-exit-enable    # Setup script
├── Formula/
│   └── slash-exit.rb        # Homebrew Formula
├── tests/
│   └── test_slash_exit.sh   # Test suite
├── .github/workflows/
│   ├── test.yml             # CI: Tests
│   └── release.yml          # CD: Release automation
└── README.md
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests (`./tests/test_slash_exit.sh`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by the classic `sl` (Steam Locomotive) command
- Created with love for the Claude Code community
- Special thanks to all the beta testers who accidentally typed `/exit` 😄

---

*Made with ❤️ by [Hietan](https://github.com/Hietan)*