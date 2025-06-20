#!/bin/bash

# Author: autotim
# Purpose: Test Bash Lint with ShellCheck

set -euo pipefail
IFS=$'\n\t'

main() {
  echo "🚀 Hello from RHCSA Lab Bash World!"
  current_user=$(whoami)
  echo "You're logged in as: $current_user"

  if [[ $EUID -ne 0 ]]; then
    echo "⚠️  Warning: This script is not running as root." >&2
  else
    echo "✅ Running as root."
  fi
}

main "$@"
