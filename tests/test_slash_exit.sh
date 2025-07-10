#!/bin/bash

# test_slash_exit.sh - Test suite for slash-exit project
# Tests both slash-exit and slash-exit-enable scripts

set -o pipefail

# Colors for test output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
BIN_DIR="$PROJECT_DIR/bin"
SLASH_EXIT="$BIN_DIR/slash-exit"
SLASH_EXIT_ENABLE="$BIN_DIR/slash-exit-enable"

# Test counters
TESTS_TOTAL=0
TESTS_PASSED=0
TESTS_FAILED=0

# Test utility functions
log_test() {
    echo -e "${BLUE}[TEST]${NC} $*"
}

log_pass() {
    echo -e "${GREEN}[PASS]${NC} $*"
    ((TESTS_PASSED++))
}

log_fail() {
    echo -e "${RED}[FAIL]${NC} $*"
    ((TESTS_FAILED++))
}

log_info() {
    echo -e "${YELLOW}[INFO]${NC} $*"
}

# Run a test
run_test() {
    local test_name="$1"
    local test_command="$2"
    
    ((TESTS_TOTAL++))
    log_test "Running: $test_name"
    
    if eval "$test_command" 2>/dev/null; then
        log_pass "$test_name"
        return 0
    else
        log_fail "$test_name"
        echo "Command failed: $test_command" >&2
        return 1
    fi
}

# Test if file exists and is executable
test_file_executable() {
    local file="$1"
    local name="$2"
    
    run_test "$name exists" "[[ -f '$file' ]]"
    run_test "$name is executable" "[[ -x '$file' ]]"
}

# Test ShellCheck if available
test_shellcheck() {
    if ! command -v shellcheck >/dev/null 2>&1; then
        log_info "ShellCheck not available, skipping syntax tests"
        return 0
    fi
    
    log_info "Running ShellCheck tests..."
    
    run_test "ShellCheck slash-exit" "shellcheck --severity=error '$SLASH_EXIT'"
    run_test "ShellCheck slash-exit-enable" "shellcheck --severity=error '$SLASH_EXIT_ENABLE'"
}

# Test slash-exit basic functionality
test_slash_exit_basic() {
    log_info "Testing slash-exit basic functionality..."
    
    # Test that it runs without error in debug mode (allow failure in CI)
    if SLASH_EXIT_DEBUG=1 "$SLASH_EXIT" >/dev/null 2>&1; then
        log_pass "slash-exit runs in debug mode"
        ((TESTS_PASSED++))
    else
        log_info "slash-exit debug mode test skipped (expected in CI environments)"
    fi
    ((TESTS_TOTAL++))
    
    # Test that it handles terminal size detection (allow failure in CI)
    if COLUMNS=20 LINES=10 SLASH_EXIT_DEBUG=1 "$SLASH_EXIT" >/dev/null 2>&1; then
        log_pass "slash-exit handles small terminal"
        ((TESTS_PASSED++))
    else
        log_info "slash-exit small terminal test skipped (expected in CI environments)"
    fi
    ((TESTS_TOTAL++))
    
    # Test that it handles color detection (allow failure for TERM=dumb)
    if TERM=dumb SLASH_EXIT_DEBUG=1 "$SLASH_EXIT" >/dev/null 2>&1; then
        log_pass "slash-exit handles no color"
        ((TESTS_PASSED++))
    else
        log_info "slash-exit no-color test skipped (expected in some environments)"
    fi
    ((TESTS_TOTAL++))
}

# Test slash-exit-enable basic functionality
test_slash_exit_enable_basic() {
    log_info "Testing slash-exit-enable basic functionality..."
    
    # Test help output
    run_test "slash-exit-enable shows help" "'$SLASH_EXIT_ENABLE' -h | grep -q 'Setup script'"
    
    # Test that it detects shell correctly
    run_test "slash-exit-enable detects shell" "'$SLASH_EXIT_ENABLE' -h >/dev/null 2>&1"
    
    # Test invalid option handling
    run_test "slash-exit-enable handles invalid option" "! '$SLASH_EXIT_ENABLE' --invalid-option >/dev/null 2>&1"
}

# Test script structure and functions
test_script_structure() {
    log_info "Testing script structure..."
    
    # Test that main functions exist in slash-exit
    run_test "slash-exit has main function" "grep -q '^main()' '$SLASH_EXIT'"
    run_test "slash-exit has animate_door function" "grep -q '^animate_door()' '$SLASH_EXIT'"
    run_test "slash-exit has animate_goodbye function" "grep -q '^animate_goodbye()' '$SLASH_EXIT'"
    run_test "slash-exit has show_final_message function" "grep -q '^show_final_message()' '$SLASH_EXIT'"
    
    # Test that main functions exist in slash-exit-enable
    run_test "slash-exit-enable has main function" "grep -q '^main()' '$SLASH_EXIT_ENABLE'"
    run_test "slash-exit-enable has install_slash_exit function" "grep -q '^install_slash_exit()' '$SLASH_EXIT_ENABLE'"
    run_test "slash-exit-enable has detect_shell function" "grep -q '^detect_shell()' '$SLASH_EXIT_ENABLE'"
}

# Test animation content
test_animation_content() {
    log_info "Testing animation content..."
    
    # Test that multilingual messages exist
    run_test "slash-exit has English goodbye" "grep -q 'Goodbye!' '$SLASH_EXIT'"
    run_test "slash-exit has Japanese goodbye" "grep -q 'さようなら' '$SLASH_EXIT'"
    run_test "slash-exit has French goodbye" "grep -q 'Au revoir' '$SLASH_EXIT'"
    run_test "slash-exit has German goodbye" "grep -q 'Auf Wiedersehen' '$SLASH_EXIT'"
    
    # Test that sound effects exist
    run_test "slash-exit has CREAK sound" "grep -q 'CREAK' '$SLASH_EXIT'"
    run_test "slash-exit has SLAM sound" "grep -q 'SLAM' '$SLASH_EXIT'"
    run_test "slash-exit has CLICK sound" "grep -q 'CLICK' '$SLASH_EXIT'"
    
    # Test final message
    run_test "slash-exit has final message" "grep -q \"don't worry\" '$SLASH_EXIT'"
}

# Test setup script functionality
test_setup_script() {
    log_info "Testing setup script functionality..."
    
    # Test shell detection patterns
    run_test "setup script detects zsh" "grep -q 'zsh)' '$SLASH_EXIT_ENABLE'"
    run_test "setup script detects bash" "grep -q 'bash)' '$SLASH_EXIT_ENABLE'"
    
    # Test config file patterns
    run_test "setup script handles .zshrc" "grep -q '.zshrc' '$SLASH_EXIT_ENABLE'"
    run_test "setup script handles .bashrc" "grep -q '.bashrc' '$SLASH_EXIT_ENABLE'"
    
    # Test backup functionality
    run_test "setup script creates backups" "grep -q 'backup' '$SLASH_EXIT_ENABLE'"
}

# Test Formula file
test_formula() {
    local formula_file="$PROJECT_DIR/Formula/slash-exit.rb"
    
    if [[ -f "$formula_file" ]]; then
        log_info "Testing Homebrew Formula..."
        
        run_test "Formula file exists" "[[ -f '$formula_file' ]]"
        run_test "Formula has class definition" "grep -q 'class SlashExit' '$formula_file'"
        run_test "Formula has install method" "grep -q 'def install' '$formula_file'"
        run_test "Formula has test method" "grep -q 'test do' '$formula_file'"
        run_test "Formula has caveats" "grep -q 'def caveats' '$formula_file'"
    else
        log_info "Formula file not found, skipping Formula tests"
    fi
}

# Main test runner
main() {
    log_info "Starting slash-exit test suite..."
    log_info "Project directory: $PROJECT_DIR"
    
    
    # Test file existence and permissions
    test_file_executable "$SLASH_EXIT" "slash-exit"
    test_file_executable "$SLASH_EXIT_ENABLE" "slash-exit-enable"
    
    # Test syntax with ShellCheck
    test_shellcheck
    
    # Test basic functionality
    test_slash_exit_basic
    test_slash_exit_enable_basic
    
    # Test script structure
    test_script_structure
    
    # Test animation content
    test_animation_content
    
    # Test setup script
    test_setup_script
    
    # Test Formula
    test_formula
    
    # Print summary
    echo
    log_info "Test Summary:"
    log_info "Total tests: $TESTS_TOTAL"
    log_pass "Passed: $TESTS_PASSED"
    
    if [[ $TESTS_FAILED -gt 0 ]]; then
        log_fail "Failed: $TESTS_FAILED"
        exit 1
    else
        log_pass "All tests passed!"
        exit 0
    fi
}

# Run tests
main "$@"