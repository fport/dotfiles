# dotfiles

To disable the Apple press and hold for VSCode only, run this command in a terminal:

```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```
Then restart VSCode.

To re-enable, run this command in a terminal:

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool true
