#!/bin/bash
set -e

# Print commands as they are executed
set -x

echo "Current directory:"
pwd
ls -la

# Verify Flutter files exist
if [ ! -f "pubspec.yaml" ]; then
  echo "Error: Flutter app files not found in current directory"
  ls -la
  exit 1
fi

echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git --depth 1 -b stable "$HOME/flutter"
export PATH="$PATH:$HOME/flutter/bin"

echo "Flutter version check..."
flutter --version

echo "Enabling web..."
flutter config --enable-web

echo "Getting dependencies..."
flutter pub get

echo "Building web..."
flutter build web --release

# No need to move files, they're already in the right place 