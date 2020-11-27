#!/usr/bin/env bash

# increase max open files limit (fixes "failed to open stream: Too many open files" issue while running big PHP test suites)
limitMaxfilesPlistFilepath='/Library/LaunchDaemons/osxtools.limit.maxfiles.plist'
cat <<'EOF' | sudo tee $limitMaxfilesPlistFilepath > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>osxtools.limit.maxfiles</string>
    <key>ProgramArguments</key>
    <array>
      <string>launchctl</string>
      <string>limit</string>
      <string>maxfiles</string>
      <string>100000</string>
      <string>1000000</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>ServiceIPC</key>
    <false/>
  </dict>
</plist>
EOF
sudo launchctl load -w $limitMaxfilesPlistFilepath
