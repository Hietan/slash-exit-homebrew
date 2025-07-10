# Security Policy

## Supported Versions

We provide security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in slash-exit, please help us by reporting it responsibly.

### How to Report

1. **Do not** create a public GitHub issue for security vulnerabilities
2. Send an email to the project maintainer with:
   - A detailed description of the vulnerability
   - Steps to reproduce the issue
   - Potential impact assessment
   - Any suggested fixes (if available)

### What to Expect

- **Acknowledgment**: We will acknowledge receipt of your report within 48 hours
- **Assessment**: We will assess the vulnerability and determine its severity
- **Fix**: If confirmed, we will work on a fix and coordinate disclosure
- **Credit**: We will credit you in the security advisory (unless you prefer to remain anonymous)

## Security Considerations

slash-exit is a command-line tool that:

- Modifies user shell configuration files (`~/.bashrc`, `~/.zshrc`)
- Creates backup files with timestamps
- Uses terminal control sequences and ANSI codes
- Handles user interruption signals (Ctrl+C)

### Potential Risk Areas

- **Shell Configuration**: The tool modifies shell startup files
- **File Permissions**: Backup files inherit permissions from original files
- **Terminal Control**: Uses escape sequences that could potentially be misused
- **Signal Handling**: Implements trap handlers for cleanup

### Safe Usage

- Always review shell configuration changes before sourcing
- Backup files are created automatically but verify them
- Use in trusted environments only
- Terminal size and capability detection is built-in

## Security Best Practices

When contributing to this project:

1. **Input Validation**: Validate all user inputs and file paths
2. **File Operations**: Use safe file handling practices
3. **Shell Injection**: Avoid dynamic shell command construction
4. **Privilege Escalation**: Never require elevated privileges
5. **Error Handling**: Implement proper error handling and cleanup

## Scope

This security policy applies to:
- The main slash-exit executable
- The slash-exit-enable setup script
- The Homebrew formula
- Any associated documentation

---

Thank you for helping keep slash-exit secure! 🔒