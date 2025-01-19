#!/bin/bash

# Directory containing the hook scripts (current directory of this script)
HOOKS_DIR="$(pwd)"
# Target .git/hooks directory relative to the current directory
TARGET_DIR="../.git/hooks"

# Ensure the .git/hooks directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: .git/hooks directory not found. Are you in the correct repository?"
  exit 1
fi

# Get the relative path from TARGET_DIR to HOOKS_DIR
RELATIVE_HOOKS_DIR=$(realpath --relative-to="$TARGET_DIR" "$HOOKS_DIR")

# Loop through all scripts in the HOOKS_DIR and create symlinks in the TARGET_DIR
for hook in "$HOOKS_DIR"/*; do
  # Skip this script itself
  if [ "$(basename "$hook")" == "setup-hooks.sh" ]; then
    continue
  fi

  # Create or update the symlink in the .git/hooks directory
  ln -sf "$RELATIVE_HOOKS_DIR/$(basename "$hook")" "$TARGET_DIR/$(basename "$hook")"
  echo "Installed hook: $(basename "$hook")"
done

echo "All hooks installed successfully."
