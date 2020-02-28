# Install developer tools.
sudo apt install git build-essential g++ ruby ruby-dev nodejs npm -y
sudo apt install python-pip python3-pip -y
# For make color and folder icon in terminal
# https://www.addictivetips.com/ubuntu-linux-tips/make-linux-terminal-user-friendly-colorls/
sudo gem install colorls


# Install bandle.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Base16 theam.
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell	

# Install coc.nvim.
~/.vim/bundle/coc.nvim/install.sh

# Install ccls.
snap install ccls

# Install c# language server.
wget -q https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install apt-transport-https
apt update
sudo apt-get install dotnet-sdk-3.1

sudo apt install apt-transport-https dirmngr gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
udo apt install mono-devel



# Install zsh.
sudo apt install zsh
# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Make Defauld shell to zsh.
chsh -s $(which zsh)


