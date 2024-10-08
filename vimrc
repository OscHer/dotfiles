"List of hotkeys I frequently use
"10winc - :     Decrease horizontal size by 10 columns. More info: https://stackoverflow.com/questions/4368690/how-to-increase-the-vertical-split-window-size-in-vim
"10winc + :     Increase horizontal size by 10 columns. More info: https://stackoverflow.com/questions/4368690/how-to-increase-the-vertical-split-window-size-in-vim
"<leader> r :   Run current buffer as python code. More info: https://github.com/python-mode/python-mode
"<Ctrl+w> + :   Increase size of window in horizontal split. More info: https://stackoverflow.com/questions/4368690/how-to-increase-the-vertical-split-window-size-in-vim
"<Ctrl+w> - :   Increase size of window in horizontal split. More info: https://stackoverflow.com/questions/4368690/how-to-increase-the-vertical-split-window-size-in-vim
"ci" :          Change inside quotes. More info: https://stackoverflow.com/questions/36843099/in-vim-how-can-i-delete-everything-between-quotes-including-the-quotes
"di" :          Delete inside quote. More info: https://stackoverflow.com/questions/4619532/in-vim-how-do-i-delete-everything-within-the-double-quotes
"gf :           Go to file. More info: https://stackoverflow.com/questions/916409/easily-open-include-filenames-in-vim
"gd :           Go to local declaration.
"gu :           Visual mode: toggle upper/lower case selected chars/lines.
"zg :           Add to current spell list
"<leader>t :    Open a vertical split terminal
"<leader>cf     Create file under cursor
":map <silent> <leader>cf :call writefile([], expand("<cfile>"), "t")<cr>

" Pymode specific maps
" nnoremap <buffer> K :<C-u>execute "!pydoc " . expand("<cword>")<CR>
"[[    Jump to previous class or function (normal, visual, operator modes)
"]]    Jump to next class or function  (normal, visual, operator modes)
"[M    Jump to previous class or method (normal, visual, operator modes)
"]M    Jump to next class or method (normal, visual, operator modes)
"aM    Select a function or method. Ex: vaM, daM, yaM, caM (operator modes)
"iM    Select inner function or method. Ex: viM, diM, yiM, ciM (operator modes)

" Pydocstring
"F2    Press F2 to invoque Pydocstring over the current buffer

" Markdown preview
"<C-s> <Plug>MarkdownPreview
"<M-s> <Plug>MarkdownPreviewStop
"<C-p> <Plug>MarkdownPreviewToggle



"Vundle settings block {{{
"https://github.com/VundleVim/Vundle.vim
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"Load plugins managed by Vundle
Plugin 'vim-airline/vim-airline'            "Status bar plugin with no python dependencies
Plugin 'vim-airline/vim-airline-themes'     "Themes for said plugin
Plugin 'tpope/vim-fugitive'                 "Plugin for integration with git.
Plugin 'rbong/vim-flog'                     "Another git integration plugin
Plugin 'preservim/NERDTree'                 "Powerful file browser
Plugin 'Xuyuanp/nerdtree-git-plugin'        "Integrate NERDTree with git
Plugin 'preservim/nerdcommenter'            "Easy and light code comment tool
Plugin 'Yggdroot/indentLine'                "Display thin vertical lines for indentation
Plugin 'tpope/vim-surround'                 "Surround plugin to better treat with quotes, double quotes, brackets and the like
Plugin 'pedrohdz/vim-yaml-folds'            "Fold yaml tags based on indentation: https://github.com/pedrohdz/vim-yaml-folds 
Plugin 'ryanoasis/vim-devicons'
Plugin 'heavenshell/vim-pydocstring'        "Make pydoc great again. https://github.com/heavenshell/vim-pydocstring
Plugin 'python-mode/python-mode'            "A bunch of cool features for python development. https://github.com/python-mode/python-mode https://www.youtube.com/watch?v=67OZNp9Z0CQ
Plugin 'iamcco/markdown-preview.nvim'       "Creates a local webserver with markdown rendering in realtime. https://github.com/iamcco/markdown-preview.nvim
Plugin 'ironcamel/vim-script-runner', {'for': ['sh', 'python']} "Executes a script on another buffer. https://atareao.es/tutorial/vim/bash-con-vim/
Plugin 'tpope/vim-rhubarb'                  "When typing GBrowse in a git directory opens github project in your web browser. https://github.com/tpope/vim-rhubarb
Plugin 'tibabit/vim-templates'              "Templates for code files with its placeholders and so on. https://github.com/tibabit/vim-templates Plugin 'tibabit/vim-templates'              "Templates for code files with its placeholders and so on. https://github.com/tibabit/vim-templates
Plugin 'ycm-core/YouCompleteMe'             "Auto completion server-client plugin
Plugin 'hashivim/vim-vagrant'             "Auto completion server-client plugin

call vundle#end()
filetype plugin indent on
"}}}


"General settings
set number                    " Show line number
set numberwidth=1             " Dedicated columns for line number
set clipboard=unnamed         "
set ic
syntax enable                 " Enable syntax highlight for code
set showcmd
set encoding=utf-8
set showmatch
set sw=2
set laststatus=2
set showmode
set tabstop=2
set shiftwidth=4
set expandtab                 " Convert tabs into spaces
set cursorcolumn              " Show full column for cursor position. This helps us when indenting 
set cursorline                " Show full line for cursor position. This help us position line we're editing
set nowrap                    " Do not wrap long lines
set hlsearch                  " Highlight all matches when searching
set undofile                  " Persistent undo even if we reopen vim.
set relativenumber            " Relative line number; let's give it a try
set spelllang=devel,en,es     " Dictionaries used for spell checking. " Dictionaries used for spell checking. 'devel' is a self-made dictionary in order to avoid false triggers on IT jargon tech such as ansible, Vagrantfile, Dockerfile, github and the like
set spell                     " Enable spell check by default
set spellsuggest=8            " Show at most 8 suggestions for misspelled words

hi clear SpellBad
hi SpellBad ctermbg=blue

" General keyboard mappings
nnoremap <C-l> :set rnu!<CR>                          " Toggle relative and absolute line number
nnoremap <leader>b :new \| r ! grep -Erns '\#[ ]?TODO(\-.*)?:' <CR>   " Create a backlog buffer and open it for editing
nnoremap <CR> :noh<CR>                                " Unset last search pattern just hitting return
nnoremap <Tab> :bNext<CR>                             " Go to next buffer
nnoremap <S-Tab> :bprevious<CR>                       " Go to previous buffer
nnoremap <leader>t :rightb vert term<CR>
map <silent> <leader>cf :call writefile([], expand("<cfile>"), "t")<CR>
nnoremap <buffer> K :<C-u>execute "!pydoc " . expand("<cword>")<CR>   " Open documentation for word under cursor

" Markdown Preview hotkeys
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle


"Insert mode mappings
"Autoclose some chars. set paste must be not active for these to work
autocmd BufRead,BufNewFile *.py inoremap " ""<left>
autocmd BufRead,BufNewFile *.py inoremap ' ''<left>
autocmd BufRead,BufNewFile *.py inoremap ( ()<left>
autocmd BufRead,BufNewFile *.py inoremap [ []<left>
autocmd BufRead,BufNewFile *.py,*.yml inoremap { {}<left>

" Add cursor line and column highlight
hi CursorLine cterm=NONE ctermbg=red ctermfg=white    " Some styles for cursorline
hi CursorColumn cterm=NONE ctermbg=red ctermfg=white  " Some style for cursorcolumn
nnoremap H :set cursorline! cursorcolumn!             " Toggle cursorline and cursor colum visibility with H key in normal mode
nnoremap H :set cursorline! cursorcolumn!             " Toggle cursorline and cursor colum visibility with H key in normal mode

" Line number personalization
highlight clear LineNr
highlight clear CursorLineNr
highlight CursorLineNr ctermfg=White ctermbg=red cterm=bold
highlight LineNr ctermfg=darkgrey ctermbg=black

" Some abbreviations for everyday use
source $HOME/.vim/abbreviations.vim


" Hic sunt Plugins
"Airline plugin specific config
"Enable powerline fonts for airline status bar
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

" unicode symbols
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"     
"      
"     
" 


" airline features on/off
let g:airline#extensions#tabline#enabled = 1 "Show buffer name
let g:airline#extensions#tabline#buffer_nr_show = 1 "Show buffer number before buffer name

" NERDTree
"autocmd VimEnter * NERDTree       " Enable NERDTree on startup
autocmd VimEnter * wincmd p       " Change windows focus from NERDTree to main window
"let g:NERDTreeWinPos = "right"   " Position NERDTree at the right edge of the screen by default
let NERDTreeShowHidden=1          " Show hidden files in the file explorer by default
let NERDTreeWinSize = 22          " Default value for NERDTree file explorer size
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Nerdcommenter
filetype plugin on
let g:NERDCreateDefaultMappings = 1

"IndentLine
let g:indentLine_char = '⦙'
let g:indentLine_color_term = 59
let g:indentLine_defaultGroup = 'SpecialKey'
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"vim-yaml-folds
set foldlevelstart=5
set omnifunc=syntaxcomplete#Complete
nnoremap <Space> za

" JSON editor syntax
let g:vim_json_conceal = 0
setlocal foldmethod=syntax
"setlocal foldmethod=indent

" Python mode
let g:pymode_python = 'python3'

" Pydocstring
let g:pydocstring_doq_path = "~/.local/bin/doq"
nmap <silent> <F2> :PydocstringFormat<CR>   Press F2 to invoque Pydocstring over the current buffer

" MarkDown Preview settings
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" specify browser to open preview page
" default: ''
let g:mkdp_browser = '/usr/bin/firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" vim-templates placeholder configuration 
" https://github.com/tibabit/vim-templates
let g:tmpl_author_email = '65867332+OscHer@users.noreply.github.com'
let g:tmpl_author_name = 'Óscar Heredia'
let g:tmpl_author_company = 'Trebolinux'

