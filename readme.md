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

# For nvim
    * ln -s ~/.vimrc ~/.config/nvim/init.vim
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

# For Tmux 
    # Add this into .zshrc file.
    sources /usr/share/powerline/bindings/tmux/powerline.conf







