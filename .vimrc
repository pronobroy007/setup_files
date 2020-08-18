set path+=**
set t_Co=256

syntax on
set number

"For insert mode.
"let &t_SI = "\<esc>[5 q"
"let &t_SR = "\<esc>[5 q"
"let &t_EI = "\<esc>[2 q"


"set nocompatible       "be iMproved, required
set nowrap              "If line gose off the screen it will keep going.
set noswapfile          "Create no .swp files.
set tabstop=4           "tab space = 4 space.
set shiftwidth=4        "use >> = 4 space.
set softtabstop=4
set expandtab
filetype off            " required

"For Folding / hiding text.
autocmd BufWinLeave *.* mkview 
autocmd BufWinEnter *.* silent loadview  

call plug#begin('~/.vim/plugged')
    "File manager.
        Plug 'scrooloose/nerdtree'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
    "For syntex checker.
        Plug 'scrooloose/syntastic'
    "For Theam.
        Plug 'dracula/vim'
    "For code complition.
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"For cpp code highlighting :
"---------------------------
    "For Dracula Theam.
    "syntax enable
    colorscheme dracula
    "colorscheme gruvbox

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
	"set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
    let g:syntastic_quiet_messages={'level':'warnings'}
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_check_on_open = 0
	let g:syntastic_python_checkers=['flake8']

" For FZF :
"----------
    "let $FZF_DEFAULT_COMMAND = 'find . ! -name "*.meta" ! -name "*.cs"'
    let $FZF_DEFAULT_COMMAND = 'find . ! -name "*.meta"'

" For key map :
"---------------
	"Spell checker.
	map<F6> :set spell!<cr>

    "For Normal Mode :
    "-----------------
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
        "For FZF
        nmap <silent> <C-p> :Files<cr> 
        nmap <silent> <C-b> :Buffers<cr> 
        "For select all
        nmap<C-a> ggVG

    "For Visual Mode :
    "-----------------
        vmap<C-c> "+y

"For nerdtree
"------------
    "put this in your .vimrc
    set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.meta
    "Nerdtree config for wildignore
    let NERDTreeRespectWildIgnore=1


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
    set completeopt=longest,menuone,preview

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
    "let g:OmniSharp_highlight_types = 2


"For Coc.Nvim :
"--------------
    " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
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
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
