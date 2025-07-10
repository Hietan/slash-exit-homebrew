# Contributing to slash-exit

Thank you for your interest in contributing to slash-exit! This project is a fun command-line tool that displays entertaining animations when users accidentally type `/exit` instead of `exit`.

## How to Contribute

### Reporting Issues

If you find a bug or have a feature request, please:

1. Check if the issue already exists in the [GitHub Issues](https://github.com/Hietan/slash-exit-homebrew/issues)
2. If not, create a new issue with:
   - A clear title and description
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Your environment details (OS, shell, terminal)

### Submitting Changes

1. **Fork the repository** and create a new branch from `main`
2. **Make your changes** following the project conventions
3. **Test your changes** using the provided test scripts
4. **Run linting** with `shellcheck bin/slash-exit bin/slash-exit-enable`
5. **Update documentation** if needed
6. **Submit a pull request** with a clear description

### Development Setup

```bash
# Clone your fork
git clone https://github.com/yourusername/slash-exit-homebrew.git
cd slash-exit-homebrew

# Test the main script
./bin/slash-exit

# Test the setup script
./bin/slash-exit-enable

# Run linting
shellcheck bin/slash-exit bin/slash-exit-enable
```

### Code Style

- Follow shell scripting best practices
- Use proper error handling and trap statements
- Maintain compatibility with both bash and zsh
- Keep the code readable and well-commented
- Ensure proper ANSI color code usage

### Animation Guidelines

- Maintain the 3-second door closing animation timing
- Keep the 2-second multilingual goodbyes sequence
- Ensure animations work in terminals with minimum 80x24 size
- Test both color and monochrome fallback modes

### Testing

- Test on multiple shells (bash, zsh)
- Test on different terminal sizes
- Test color and monochrome modes
- Verify cursor restoration after interruption

## Getting Help

If you have questions about contributing, feel free to:

- Open an issue for discussion
- Check the project documentation in `CLAUDE.md`
- Look at existing pull requests for examples

## Code of Conduct

Please note that this project follows our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold this code.

---

Thank you for contributing to slash-exit! 🚪✨