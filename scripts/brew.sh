#!/bin/bash
# Homebrew Setup

# Initial installation script
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update homebrew and formulae
brew update
brew upgrade

# Install xcode build tools
# xcode-select --install
# sudo xcodebuild -license accept

# Save Homebrew’s installed location
BREW_PREFIX=$(brew --prefix)

# Install coreutils
brew install coreutils

# Install miscellaneous leaves
brew install bazel
brew install cmake
brew install fastlane
brew install fswatch
brew install go
brew install grpc-swift
brew install hyperfine
brew install jq
brew install minicom
brew install nmap
brew install tmux