cp bashrc ~/.bashrc
cp gitconfig ~/.gitconfig
cp tmux.conf ~/.tmux.conf
cp xresources ~/.Xresources

mkdir -p ~/.ssh
cp ssh-base-config ~/.ssh/config

mkdir -p ~/.config
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
cp i3-config ~/.config/i3/config
cp i3status-config ~/.config/i3status/config

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/autoload
cp -r nvim/* ~/.config/nvim/.
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
