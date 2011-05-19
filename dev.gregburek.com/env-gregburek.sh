#!/bin/bash
#
#Author: Greg Burek
#Date: 05-18-2011
# If run as 
# su - gregburek -c "wget http://50.19.99.157/gregburek-setup.sh -O - | sh"
# as root, will setup my account properly

# Setup ssh keys
mkdir ~/.ssh
wget --no-check-certificate https://github.com/gregburek/aws-scripts/raw/master/dev.gregburek.com/id_rsa.pub -O ~/.ssh/airy-greg.pub
cat ~/.ssh/airy-greg.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh;
chmod 600 ~/.ssh/authorized_keys

# Setup Janus and Solarized for vim
curl https://github.com/gregburek/janus/raw/master/bootstrap.sh -o - | sh
curl https://github.com/posterous/vim/raw/master/vimrc.local > ~/.vimrc.local

# Setup Oh My zsh! shell
wget --no-check-certificate https://github.com/gregburek/aws-scripts/raw/master/dev.gregburek.com/zsh.tar.gz -O ~/zsh.tar.gz
tar xzf ~/zsh.tar.gz
git comlone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ln -s ~/.zsh/zshrc ~/.zshrc

# Setup byobu to run at login and screen to use ^O as the command key
echo '`echo $- | grep -qs i` && byobu-launcher && exit 1' > ~/.zprofile
echo 'escape ^Oo' > ~/.screenrc
