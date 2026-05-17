install-flatpaks:
    flatpak preinstall

setup-keys:
    #!/bin/bash
    mkdir ~/.ssh
    ujust mount crypt
    cp /mnt/crypt/keys/ssh/{backup_id_ed25519*,id_ecdsa_sk*} ~/.ssh
    chmod 600 ~/.ssh/{id_ecdsa_sk,backup_id_ed25519}
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ecdsa_sk
    ssh-add ~/.ssh/backup_id_ed25519

setup-dotfiles:
    git clone ssh://git@github.com/fruzyna/dotfiles ~/.dotfiles
    cd ~/.dotfiles && ./setup.sh && dconf load / < gnome-dconf.ini

setup-home:
    mkdir ~/Projects
    rmdir ~/{Desktop,Music,Public,Templates}
    cp /mnt/crypt/keys/keepass ~

setup-all:
    ujust install-flatpaks
    ujust setup-keys
    ujust setup-dotfiles
    ujust setup-home
