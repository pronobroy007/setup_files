set path+=**

set t_Co=256

syntax on
set number

"For insert mode.
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

"set nocompatible    "be iMproved, required
set tabstop=4       "tab space = 4 space.
set shiftwidth=4    "use >> = 4 space.
set softtabstop=4
set expandtab

filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
	Plugin 'tpope/vim-fugitive'
    Plugin 'git://git.wincent.com/command-t.git'
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

	"File manager.
        Plugin 'scrooloose/nerdtree'
        Plugin 'kien/ctrlp.vim'
	"For code highlight for c++/python.
        Plugin 'octol/vim-cpp-enhanced-highlight'
    "For syntex checker.
        Plugin 'scrooloose/syntastic'
    "For sttatus bar.
        Plugin 'vim-airline/vim-airline'
    "For base16 theam.
        Plugin 'chriskempson/base16-vim'


	"For Code completion.
        Plugin 'neoclide/coc.nvim'
        "For python languageserver.
        "pip3 install python-language-server 
        Plugin 'neoclide/coc-python'
        "For C# languageserver.
        Plugin 'omnisharp/omnisharp-vim'
        "For PHP languageserver.
        Plugin 'shawncplus/phpcomplete.vim'
        "For auto pairs like {, [, < etc.
        Plugin 'neoclide/coc-pairs'	
        "For Snippets.
        Plugin 'neoclide/coc-snippets'
call vundle#end()            " required
filetype plugin indent on    " required

"For cpp code highlighting :
"---------------------------
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1

"For nvim status line :
"---------------------
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled = 1

"For Syntastic :
"---------------
    "It will only work if Syntastic and OmniSharp installed.
    let g:syntastic_cs_checkers = ['code_checker']
    "Ignore some of the messages in syntastic.
    let g:syntastic_quiet_messages = { 'regex': 'Unnecessary using directive.' }

	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_python_checkers=['flake8']

"File manager :
"--------------
	"For ctrlP
	let g:ctrlp_working_path_mode = 'c'

" For key map :
"---------------
	"Spell checker.
	map<F6> :set spell!<cr>

	"For vim tab.
	nnoremap tn :tabnew<space>
	nnoremap tl :tabnext<cr>
	nnoremap th :tabprev<cr>
	nnoremap tj :tabfirst<cr>
	nnoremap tk :tablast<cr>
	"Ex : tm 0 	-->  this will move current tab in first position.
	nnoremap tm :tabm<space>

    "For nerdtree
	nnoremap nt :NERDTree<cr>

"For nerdtree
"------------
    "put this in your .vimrc
    set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.meta
    "Nerdtree config for wildignore
    let NERDTreeRespectWildIgnore=1


" For base16 background theam
" ----------------------------
    if filereadable(expand("~/.vimrc_background")) 
      let base16colorspace=256
      source ~/.vimrc_background
    endif
    
"For C# omnisharp :
"------------------
    " Use the stdio OmniSharp-roslyn server
    "let g:OmniSharp_server_stdio = 1
    let g:OmniSharp_server_use_mono = 1

    " Set the type lookup function to use the preview window instead of echoing it
    "let g:OmniSharp_typeLookupInPreview = 1

    " Timeout in seconds to wait for a response from the server
    let g:OmniSharp_timeout = 5

    " Don't autoselect first omnicomplete option, show options even if there is only
    " one (so the preview documentation is accessible). Remove 'preview' if you
    " don't want to see any documentation whatsoever.
    "set completeopt=longest,menuone,preview

    " Fetch full documentation during omnicomplete requests.
    " By default, only Type/Method signatures are fetched. Full documentation can
    " still be fetched when you need it with the :OmniSharpDocumentation command.
    let g:omnicomplete_fetch_full_documentation = 1

    " Set desired preview window height for viewing documentation.
    " You might also want to look at the echodoc plugin.
    set previewheight=5

    " Tell ALE to use OmniSharp for linting C# files, and no other linters.
    let g:ale_linters = { 'cs': ['OmniSharp'] }

    " Update semantic highlighting after all text changes
    "let g:OmniSharp_highlight_types = 3
    " Update semantic highlighting on BufEnter and InsertLeave
    " let g:OmniSharp_highlight_types = 2




"For COC.NVIM
"------------
	" if hidden is not set, TextEdit might fail.
	set hidden

	" Some servers have issues with backup files, see #649
	set nobackup
	set nowritebackup

	" Better display for messages
	set cmdheight=2

	" You will have bad experience for diagnostic messages when it's default 4000.
	set updatetime=300

	" don't give |ins-completion-menu| messages.
	set shortmess+=c

	" always show signcolumns
	set signcolumn=yes

	" Use tab for trigger completion with characters ahead and navigate.
	" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
	inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
	" Coc only does snippet and additional edit on confirm.
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	" Or use `complete_info` if your vim support it, like:
	" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" Remap keys for gotos
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  else
		call CocAction('doHover')
	  endif
	endfunction

	" Highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Remap for rename current word
	nmap <leader>rn <Plug>(coc-rename)

	" Remap for format selected region
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s).
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap for do codeAction of current line
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Fix autofix problem of current line
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Create mappings for function text object, requires document symbols feature of languageserver.
	xmap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap if <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)

	" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
	nmap <silent> <C-d> <Plug>(coc-range-select)
	xmap <silent> <C-d> <Plug>(coc-range-select)

	" Use `:Format` to format current buffer
	command! -nargs=0 Format :call CocAction('format')

	" Use `:Fold` to fold current buffer
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" use `:OR` for organize import of current buffer
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add status line support, for integration with other plugin, checkout `:h coc-status`
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	" Using CocList
	" Show all diagnostics
	nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions
	nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	" Show commands
	nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document
	nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols
	nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list
	nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"********************************************************************
"********************************************************************
