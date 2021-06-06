set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" -----------------------------
" IMPORTANT:
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree.git'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'
" Plugin 'minibufexpl.vim'
Plugin 'SuperTab'
Plugin 'AutoComplPop'
Plugin 'surround.vim'
Plugin 'Markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'easymotion/vim-easymotion'
Plugin 'tComment'
Plugin 'ZoomWin'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'styled-components/vim-styled-components'
Plugin 'jparise/vim-graphql'
Plugin 'edkolev/tmuxline.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'w0rp/ale'


" plugin from http://vim-scripts.org/vim/scripts.html --- Plugin 'L9'
" Git plugin not hosted on GitHub --- Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine --- Plugin 'file:///home/gmarik/path/to/plugin'
" -----------------------------
call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on
syntax enable

" ---- CUSTOM SETTINGS -------
colorscheme molokai
" colorscheme gruvbox
"----------------


" tagbar
map <F6> :TagbarToggle <CR>
map <F5> :NERDTreeToggle <CR>
let g:NERDTreeWinSize=30
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" open Nerd Tree when there was no file on the command line:
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

map <c-p> :CtrlP <CR>
let g:ctrlp_custom_ignore = 'coverage\|dist\|dist-*\|node_modules\|DS_Store\|git'
" open ctrl p file in new buffer
let g:ctrlp_switch_buffer = 0
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-v>', '<2-LeftMouse>'],
    \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
    \ }

set number
set showcmd
set cursorline
set wildmenu
set showmatch
set hlsearch
set incsearch
" move vertically by visual line:
nnoremap j gj
nnoremap k gk
set nopaste
set tabstop=10 softtabstop=4 shiftwidth=4 expandtab
autocmd BufWritePre *.js %s/\s\+$//e

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"for cursor
let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"
set noerrorbells                " don't beep
" optional reset cursor on start:

" easy motion, case insensitive
let g:EasyMotion_smartcase = 1

" ctrl w + o makes it full screen
nnoremap <silent> <C-w>w :ZoomWin<CR>

" linting / auto format on save
let g:ale_sign_error = '🚩'
let g:ale_sign_warning = '⚡️'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fix_on_save = 1
let g:ale_linters = {
\'javascript': ['flow', 'eslint'],
\}
let g:ale_fixers = {
\'javascript': ['eslint'],
\}

"So I can move around in insert
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>


""Automatically insert a matching brace in Vim
inoremap { {}<ESC>ha
inoremap ( ()<ESC>ha
inoremap " ""<ESC>ha
inoremap ' ''<ESC>ha
inoremap [ []<ESC>ha

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" JavaScript configuration ------------------------------------------------ {{{
let g:javascript_plugin_jsdoc = 0
let g:javascript_plugin_flow = 1

" See https://github.com/elzr/vim-json#specific-customizations
let g:vim_json_syntax_conceal = 0
" ALE config {{{

" let g:ale_enabled = 2
let g:ale_completion_enabled = 1
let g:ale_lint_delay = 201   " millisecs
" let g:ale_lint_on_text_changed = 'always'  " never/insert/normal/always
let g:ale_lint_on_enter = 2
let g:ale_lint_on_filetype_changed = 2
let g:ale_lint_on_save = 2
let g:ale_fix_on_save = 2
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 2
" let g:ale_open_list = 2
"
" TODO: Temporary hack until our eslint is configured correctly
" let g:ale_javascript_eslint_options = '--rulesdir eslint --no-ignore'

let g:ale_linters = {
\   'graphql': ['eslint', 'flow'],
\   'javascript.jsx': ['eslint', 'flow'],
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['typescript'],
\}
let g:ale_fixers = {
\   'graphql': ['eslint', 'prettier'],
\   'javascript.jsx': ['eslint', 'prettier'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\}

set mouse=a
set backspace=indent,eol,start
set splitright               " Split vertical windows right to the current windows
nnoremap <space> zz
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>



" ---- lightline settings -------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }


" ---- fzf settings -------
nnoremap <silent> <C-f> :Files<CR>
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

" search 
nmap <C-p> :FzfHistory<cr>
imap <C-p> <esc>:<C-u>FzfHistory<cr>

" search across files in the current directory
nmap <C-b> :FzfFiles<cr>
imap <C-b> <esc>:<C-u>FzfFiles<cr>

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" === complate popup color configuratio"
highlight Pmenu ctermbg=black guibg=gray 
highlight PmenuSel ctermbg=black guibg=gray 


