#!/bin/bash
# MacOS Preferences

# Close any open System Preferences panes to prevent them from overriding settings
osascript -e 'tell application "System Preferences" to quit'



#############################
#  Documents                #
#############################

# Save documents to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false



#############################
#  Finder                   #
#############################

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Always show the ~/Library folder
chflags nohidden ~/Library

# Always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv



#############################
#  Dock                     #
#############################

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false



#############################
#  Activity Monitor         #
#############################

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5



#############################
#  iMessage                 #
#############################

# Disable smart quotes in iMessage as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false
