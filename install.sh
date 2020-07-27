#! /bin/bash
# Autor: Ismael Ferreira
# based Debian SO

echo "Add Repository, update and upgrade OS........................"
#add-apt-repository ppa:obsproject/obs-studio #obs studio
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list # Add the Cloud SDK distribution URI as a package source
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

apt -y update
apt -y upgrade
apt -y dist-upgrade
apt -y autoclean
apt -y autoremove
apt -y clean

clear

echo "Installing Build Essentials (GIT, Curl, Google Cloud SDK, Virtualbox and OBS Studio) .........................."

apt -y install \ 
build-essential \ 
default-jdk \
libssl-dev \ 
make \
automake \ 
gcc \ 
exuberant-ctags \ 
ncurses-term \ 
ack-grep \
silversearcher-ag \ 
fontconfig \ 
imagemagick \ 
libmagickwand-dev \
software-properties-common \ 
git \ 
vim \ 
vim-gtk3 \ 
curl \ 
apt-transport-https \ 
ca-certificates \ 
gnupg-agent \
telnet \ 
wget \ 
lm-sensors \
htop \
google-cloud-sdk \
virtualbox \
traceroute \
whois \
tree \
ffmpeg \
obs-studio \

clear

echo "Instaling Chrome"
#wget -q -O -- https://dl.google.com/linux/linux_signing_key.pub && sudo apt-key add --
#sh -c ‘echo “deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main” >> /etc/apt/sources.list.d/google-chrome.list’
apt install google-chrome-stable

echo "Installing kubectl..........................."
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

echo "Installing minikube.........................."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.0/minikube-linux-amd64 
chmod +x minikube 
mv minikube /usr/local/bin/

echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo "Installing VLC, SLACK, ZOOM.........................."

snap install vlc -y
snap install slack --classic
wget -O Downloads/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ~/Downloads/zoom.deb
 
clear

echo 'installing code..........................'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'Installing extensions'
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-googlecloudtools.cloudcode

clear

echo "Instaling PIP"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

echo "Installing DOCKER.........................."
curl -fsSL get.docker.com -o get-docker.sh && chmod +x get-docker.sh
sh get-docker.sh
groupadd docker
usermod -aG docker $USER
systemctl enable docker
#docker run hello-world

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Ismael.Ferreira\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"ismael@somosnuvem.com.br\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Generating a GIT SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
#cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

clear

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "Last Adjustments.........................."
apt -y update
apt -y upgrade
apt -y autoclean
apt -y autoremove
apt -y clean

clear

echo "Restarting SO.........................."
shutdown -r 2



