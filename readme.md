# Install Nurd fonts.

# For install vandle 
    * git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# For coc plugin :
	* Now goto ~/.vim/bundle/coc.nvim then install using "./install.sh" command

# Instll Lnaguage server :
	* apt install ccls
	* Then open config file with command :CocConfig
	* and peast flowing text for languageserver to work.
		
	{
		"languageserver": 
		{
		  "ccls": 
			{
				"command": "ccls",
				"filetypes": ["c", "cpp", "cuda", "objc", "objcpp"],
				"rootPatterns": [".ccls-root", "compile_commands.json"],
				"initializationOptions": 
				{
				   "cache": 
					{
					 "directory": ".ccls-cache"
					}
				 }
			  }
		}
	}	


# Install pairs 
	* :CocInstall coc-pairs

# Install OmniSharp
    * :OmniSharpInstall

# Install Python autocomplition
    * :CocInstall coc-python

# Install .Net Core and mono-devel for C# 
    * wget -q https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    * sudo dpkg -i packages-microsoft-prod.deb
    * sudo apt-get update
    * sudo apt-get install apt-transport-https
    * apt update
    * sudo apt-get install dotnet-sdk-3.1

    * sudo apt install apt-transport-https dirmngr gnupg ca-certificates
    * sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
    * echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
    * sudo apt update
    * udo apt install mono-devel



# For nvim
    * ln -s ~/.vimrc ~/.config/nvim/init.vim
        >> As neovim is mostly compatible with standard vim, 
        >> you can symlink nvim/init.vim to your old .vimrc to 
        >> keep old configuration options: 



    if has('nvim')
        " Neovim specific commands
    else
        " Standard vim specific commands
    endif
        >> if you want some lines to specific to each version, 
        >> you can use an if block in your .vimrc file:









