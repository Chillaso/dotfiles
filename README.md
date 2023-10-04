# Chillaso Dotfiles

## Dotfiles list

* [Git](git/.gitconfig) - You know what is this
* [Zsh](zsh/.zshrc) - Shell
* [Vim](vim/.vimrc) - File editor
* [Qtile](qtile/) - Windows tile manager
* [Rofi](Rofi/) - Windows switcher

## Requirements

### ZSH
1. Install zsh console and make it default shell
```shell
sudo apt install -y zsh curl && chsh -s $(which zsh)
```
2. Install Oh-My-Zsh!
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
3. Install Powerlevel10k
```shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
4. Install UbuntuMonoNerd Font
```shell
cd ~/Downloads && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/UbuntuMono.zip
```
> Unzip fonts and install them. Then configure your terminal to use Nerd Fonts. Check latest font versions [here](https://www.nerdfonts.com/font-downloads)

### VIM
1. Install vim
```shell
sudo apt install -y vim
```
2. Create config folders for Dracula theme
```shell
mkdir -p ~/.vim/pack/themes/start && cd ~/.vim/pack/themes/start
```
3. Clone Dracula theme repository
```shell
git clone https://github.com/dracula/vim.git dracula
```
4. Copy [Vim](vim/.vimrc) config
```shell
cp ~/dotfiles/vim/.vimrc ~/.vimrc
```

### Qtile

### Rofi
1. Install rofi
```shell
sudo apt install -y rofi
```
2. Move config.rasi and rofi theme to right location
```shell
mv config.rasi ~/.config/rasi/
mv onedark.rasi /usr/share/rofi/themes/
```

### Git
```shell
sudo apt install -y git
```
