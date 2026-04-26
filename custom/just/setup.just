install-flatpaks:
    flatpak preinstall

setup-dotfiles:
    git clone ssh://git@github.com/fruzyna/dotfiles ~/.dotfiles
    ~/.dotfiles/setup.sh

setup-all:
    ujust install-flatpaks
    ujust setup-dotfiles