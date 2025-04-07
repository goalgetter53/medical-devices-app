#!/bin/bash

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
flutter build web --release --web-renderer html 