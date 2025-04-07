#!/bin/bash
set -e

# Print commands as they are executed
set -x

echo "Current directory:"
pwd
ls -la

# Ensure we're in the right place and the directory exists
if [ ! -d "client/medical_devices_app" ]; then
  echo "Error: Flutter app directory not found"
  ls -la client/
  exit 1
fi

echo "Moving to Flutter app directory..."
cd client/medical_devices_app || exit 1

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

echo "Moving build output to expected location..."
mkdir -p ../../build
cp -r build/web ../../build/ 