# dotfiles

```bash
chmod +x ./dotfiles/script.sh
```

```bash
# for vim setup
npm i -g prettier 
```

```bash
#Oh My Zsh Theme + Fonts:
brew install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

zsh-autosuggestions

1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

    ```sh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

    ```sh
    plugins=( 
        # other plugins...
        zsh-autosuggestions
    )
    ```

3. Start a new terminal session.
