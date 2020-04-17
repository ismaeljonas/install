#! /bin/bash
# Autor: Ismael Ferreira

#add repository
echo "Add Repository, update and upgrade........................"

add-apt-repository ppa:obsproject/obs-studio #obs studio
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list # Add the Cloud SDK distribution URI as a package source
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt-get update && apt-get upgrade

#Installing VirtualBox
echo "Installing VirtualBox........................"

#Installing kubectl https://kubernetes.io/docs/getting-started-guides/kubectl/
echo "Installing kubectl..........................."
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

#Installing minikube https://github.com/kubernetes/minikube/releases
echo "Installing minikube.........................."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.0/minikube-linux-amd64 
chmod +x minikube 
mv minikube /usr/local/bin/

echo "Installing Obs Studio.........................."
#git curl

echo "Installing GIT, Curl, ZSH, Google Cloud SDK, Virtualbox and OBS Studio .........................."
apt-get install git -y
apt-get install curl -y
apt-get install zsh -y
apt-get install google-cloud-sdk -y
apt-get install virtualbox -y
apt-get install ffmpeg && apt-get install obs-studio -y

echo "Installing VLC, SLACK, VSCODE.........................."

snap install vlc -y
snap install slack --classic
snap install --classic code #vscode

#echo "Installing GAM, Docker.........................."

#bash <(curl -s -S -L https://git.io/install-gam)
#bash <(curl -s -S -L https://get.docker.com)

# Install Oh My Zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
