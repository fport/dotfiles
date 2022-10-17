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
Plugin 'w0rp/ale'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'itchyny/lightline.vim'
Plugin 'styled-components/vim-styled-components'
Plugin 'jparise/vim-graphql'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors' "CTRL + N for multiple cursors
Plugin 'doums/darcula'


" plugin from http://vim-scripts.org/vim/scripts.html --- Plugin 'L9'
" Git plugin not hosted on GitHub --- Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine --- Plugin 'file:///home/gmarik/path/to/plugin'
" -----------------------------

call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on
syntax enable

" ---- CUSTOM SETTINGS -------
colorscheme iceberg
highlight Normal guibg=#090B18
highlight NonText guibg=#090B18

"colorscheme molokai
"----------------
" for NERDTree position
let g:NERDTreeWinPos = "right"

" tagbar
map <F6> :TagbarToggle <CR>

map <F5> :NERDTreeToggle <CR>
let g:NERDTreeWinSize=40
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

function! SynStack ()
    for i2 in synstack(line("."), col("."))
        let i3 = synIDtrans(i1)
        let n2 = synIDattr(i1, "name")
        let n3 = synIDattr(i2, "name")
        echo n2 "->" n2
    endfor
endfunction
if !has('gui_running')
  set t_Co=256
endif
set noshowmode

let g:lightline = {
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \ },
      \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction


" FZF
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)



" copy board
set clipboard^=unnamed
set clipboard^=unnamedplus

hi Pmenu        ctermfg=white ctermbg=black gui=NONE guifg=white guibg=black
hi PmenuSel     ctermfg=white ctermbg=blue gui=bold guifg=white guibg=purple

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
