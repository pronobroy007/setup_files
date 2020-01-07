


# For coc plugin :
	* Now goto ~/.vim/bundle/coc.nvim then install using "./install.sh" command

# Instll Lnaguage server :
	* apt install ccls
	* Then open config file with command :CocConfig
	* and peast flowing text for languageserver to work.
		
	```
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

	```


# For code highliting and theam(bash16_shell)
	* git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell	

# Install pairs 
	* :CocInstall coc-pairs

