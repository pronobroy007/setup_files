# Requirement 
    git
    curl
    nvim > 0.4.3
    nodejs >= 10.12
    Nurd fonts.......


# For vim-plug
     curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim   

# For Python language server
    pip3 install pylint jedi 

# For C/C++ language server
    sudo apt install clangd-9
    //This will install clangd as /usr/bin/clangd-9. Make it the default clangd:
    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100

# Install coc.nvim plugin 
    :CocInstall coc-omnisharp coc-clangd coc-phpls coc-python coc-pairs coc-snippets

# Configure Lnaguage server protocol 
    * Open config.jf file with command :CocConfig
    * and peast flowing text for languageserver to work.

    {
        "languageserver": 
        {
            "clangd": 
            {
              "command": "clangd",
              "rootPatterns": ["compile_flags.txt", "compile_commands.json"],
              "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"]
            }
        }
    }




# Install FZF for Fuzzy finder for terminal
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

# Install developer tools
    sudo apt install git build-essential g++ ruby ruby-dev npm -y

# Install powerline
    sudo apt install powerline
    
# For make color and folder icon in terminal
    https://www.addictivetips.com/ubuntu-linux-tips/make-linux-terminal-user-friendly-colorls/
    sudo gem install colorls

# Install zsh, oh-my-zsh, powerlevel10k
    sudo apt install zsh -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    * p10k configure        To configure p10k
    * Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

# For Tmux 
    # Add this into .zshrc file.
    sources /usr/share/powerline/bindings/tmux/powerline.conf

# For nvim
    mkdir ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim
        >> As neovim is mostly compatible with standard vim, 
        >> you can symlink nvim/init.vim to your old .vimrc to 
        >> keep old configuration options: 

    [NOTE: If after this linke nvim not work then ls -l ~/.config/nvim/init.vim
        and if if .vimrc link say's that like is Dead then goto .config/nvim/ and 
        do this :  ln -s ~/.vimrc init.vim]


    if has('nvim')
        " Neovim specific commands
    else
        " Standard vim specific commands
    endif
        >> if you want some lines to specific to each version, 
        >> you can use an if block in your .vimrc file:


# For c# Language
    Install dotnet-sdK :
    ---------------------
        wget -q https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
        sudo dpkg -i packages-microsoft-prod.deb
        sudo apt-get update -y
        sudo apt-get install -y apt-transport-https 
        sudo apt-get update -y
        sudo apt-get install -y dotnet-sdk-3.1


    Install mono : 
    --------------
        sudo apt install apt-transport-https dirmngr gnupg ca-certificates -y
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF 
        echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
        sudo apt update -y
        sudo apt install mono-devel -y

    # Install vscode and also install unity tool extension on it if needed.


sam g9198
