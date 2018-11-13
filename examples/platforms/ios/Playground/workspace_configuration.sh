#!/bin/bash

scriptPath="$(dirname "$0")"
cd "$scriptPath"
fullPath=$(pwd)
settingsFile="$fullPath"/hello.xcworkspace/xcuserdata/$USER.xcuserdatad/WorkspaceSettings.xcsettings

cp -f "$settingsFile" "$settingsFile.plist"

defaults write "$settingsFile" BuildLocationStyle CustomLocation
defaults write "$settingsFile" CustomBuildLocationType RelativeToWorkspace
defaults write "$settingsFile" CustomBuildProductsPath "Build/Products"
defaults write "$settingsFile" CustomBuildIntermediatesPath "Build/Intermediates"
defaults write "$settingsFile" CustomIndexStorePath "Build/Index/DataStore"

cp -f "$settingsFile.plist" "$settingsFile"