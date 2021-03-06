#!/bin/bash

# remove comment if you want to enable debugging
set -x

TERRAFORM_VERSION="0.11.14"
PACKER_VERSION="1.4.4"

# install pip
pip install -U pip && pip3 install -U pip
if [[ $? == 127 ]]; then
    wget -q https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    python3 get-pip.py
fi
# install awscli and ebcli
pip install -U awscli

apt_install_prerequisites(){
    echo "[$(date +%H:%M:%S)]: Adding apt repositories..."
    # Add repository for apt-fast
    add-apt-repository -y ppa:apt-fast/stable 
    echo "[$(date +%H:%M:%S)]: Running apt-get clean..."
    apt-get clean
    echo "[$(date +%H:%M:%S)]: Running apt-get update..."
    apt-get -qq update
    apt-get -qq install -y apt-fast
    echo "[$(date +%H:%M:%S)]: Running apt-fast install..."
    apt-fast -qq install -y jq whois build-essential uild-essential cmake python3-dev python3-pip python3-tk python3-lxml python3-six unzip -y

}

#terraform
T_VERSION=$(/usr/local/bin/terraform -v | head -1 | cut -d ' ' -f 2 | tail -c +2)
T_RETVAL=${PIPESTATUS[0]}

terraform_install() {
    [[ $T_VERSION != $TERRAFORM_VERSION ]] || [[ $T_RETVAL != 0 ]] \
    && wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
}
# packer
P_VERSION=$(/usr/local/bin/packer -v)
P_RETVAL=$?
packer_install() {
    [[ $P_VERSION != $PACKER_VERSION ]] || [[ $P_RETVAL != 1 ]] \
    && wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip -o packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin \
    && rm packer_${PACKER_VERSION}_linux_amd64.zip
}

kubectl_install() {
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    mv ./kubectl /usr/local/bin/kubectl

    echo "source <(kubectl completion zsh)" /home/vagrant/.zshrc
}

install_neovim () {
    apt remove vim -yes
    apt autoremove
    sudo apt-get install neovim -yes
    apt-get install python-neovim
    apt-get install python3-neovim
    alia
    cat << EOF > /root/.config/nvim/init.vim
let g:solarized_termtrans = 1 " Pretty settings for colors
let mapleader = ","


colorscheme desert

set bg=dark

set shiftwidth=4 " indenting is 4 spaces not 8

set path=**

set expandtab

set relativenumber

set noswapfile

set hidden

let g:neetrw_banner = 0

let g:netrw_liststyle = 3

set shell=/usr/bin/zsh


set hlsearch

nnoremap <leader><space> :nohlsearch<CR>


nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
EOF
    

}

vundle_install() {
    git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
    whoami
    pwd
    ls -la
    cat << EOF > /root/.vimrc
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'davidhalter/jedi-vim'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
EOF
}



############### DOCKER


docker_install(){

    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    apt-get update
    apt-cache policy docker-ce
    apt-get install -y docker-ce
    systemctl enable docker
    systemctl start docker
    systemctl status docker
    apt-get install -y openssh-server
    systemctl enable ssh
    systemctl start ssh
    systemctl status ssh
}



############ SSh AND git
set_ssh_and_git(){
    mkdir /root/.ssh
    sudo cp -R /home/vagrant/.ssh/* /root/.ssh
    sudo chown -R root: /root/.ssh/*
    sudo chmod 400 /root/.ssh/*



    sudo sed 's/without-password/yes/' /etc/ssh/sshd_config
    systemctl restart ssh

    eval `ssh-agent`
    git config --global core.autocrlf false
    git config --global user.name "Pavel Malinov"
    git config --global user.email "pavel.malinov@softwareag.com"
    git config --global core.editor "vim"

    ssh-add /root/.ssh/id_rsa
    ssh-keyscan  bitbucket.org >> ~/.ssh/known_hosts
    ssh-keyscan  gitlab.com >> ~/.ssh/known_hosts

    git clone git@bitbucket.org:sagcsoteam/sagcloud-k8s-aws-environments.git //opt/sagcloud-k8s-aws-environments
    git clone git@bitbucket.org:sagcsoteam/common-services.git /opt/common-services
    git clone git@bitbucket.org:sagcsoteam/common-scripts.git /opt/common-scripts
    git clone git@bitbucket.org:sagcsoteam/common-salt.git /opt/common-salt
    git clone git@bitbucket.org:sagcsoteam/common-deployment.git /opt/common-deployment
    git clone git@bitbucket.org:sagcsoteam/aris-helm-charts.git /opt/aris-helm-charts
    git clone git@bitbucket.org:sagcsoteam/product-module-aris-k8s.git /opt/product-module-aris-k8s
    git clone git@bitbucket.org:sagcsoteam/helm-charts.git /opt/helm-charts
}

install_golang() {
  if ! which go > /dev/null; then
    echo "[$(date +%H:%M:%S)]: Installing Golang v.1.12..."
    cd /home/vagrant || exit
    wget --progress=bar:force https://dl.google.com/go/go1.12.linux-amd64.tar.gz
    tar -C /usr/local -xzf go1.12.linux-amd64.tar.gz
    mkdir /root/go
    cat <<'EOF'>> /root/.zshrc
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
EOF

  else
    echo "[$(date +%H:%M:%S)]: Golang seems to be installed already. Skipping."
  fi
}

install_node() {


    curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
    sudo apt-get -y install nodejs
}

set_up_chrony() {
    apt install -y chrony
    sed -i '/^#/ d' /etc/chrony/chrony.conf
    sed -i '0,/pool*/iserver\ 169\.254\.169\.123\ prefer\ iburst\ minpoll\ 4\ maxpoll\ 4/' /etc/chrony/chrony.conf
    systemctl enable chrony
    systemctl restart chrony
}


main(){
    apt_install_prerequisites
    terraform_install
    packer_install
    kubectl_install
#   vundle_install
    docker_install
    install_golang
    install_node
    set_ssh_and_git
    set_up_chrony   
    
}

main
exit 0