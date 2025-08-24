#!/bin/sh

# check common process names for iTerm
if pgrep -x "iTerm2" >/dev/null || pgrep -x "iTerm" >/dev/null; then
  # iTerm is running: create a new tab if there is a window, otherwise create a window
  osascript -e 'tell application "iTerm" to create window with default profile'
else
  # Not running: just launch iTerm and let it create its initial window
  open -a "iTerm"
fi

