let s:editor_root=expand("~/.config/nvim")
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc(s:editor_root . '/bundle')
let g:python3_host_prog=expand('$HOME/.local/share/nvim/venv/bin/python')
let g:python_host_prog=expand('$HOME/.local/share/nvim/venv/bin/python')
.
"vundle
set nocompatible
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
call vundle#end()
filetype plugin indent on
"vundle end

"colorscheme delek
"colorscheme koehler
"colorscheme delek
colorscheme apprentice
if g:colors_name == "apprentice"
  autocmd ColorScheme *  hi! Normal ctermbg=none guibg=NONE
  " other custom overrides
endif

let mapleader = ","
set nocompatible "not interested in vi
set nowrapscan "dont wrap file on scan
set autoindent
set showmatch "shows beginning bracket after closing
set incsearch "searches incrementally
"set autochdir "change working to current file

"load bash aliases
let $BASH_ENV='~/.config/nvim/bash_aliases'

"numbers
set number relativenumber "line numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  autocmd BufEnter                    NERD_* set norelativenumber
augroup END

"movement
"nnoremap <C-E> <C-U>

"windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-_> <C-W><C-S>
nnoremap <C-\> <C-W><C-V>
"nmap <C-y> <C-W>><C-W>>
"nmap <C-u> <C-W>-<C-W>-
"nmap <C-i> <C-W>+<C-W>+
"nmap <C-o> <C-W><<C-W><
set splitbelow
set splitright

"buffer navigation
"nnoremap <Tab> :buffers<CR>:buffer<Space>
nnoremap <S-tab> :e #<CR>

"saving file
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

"ale
nnoremap <silent> <leader>an :ALENext<cr>
nnoremap <silent> <leader>ap :ALEPrevious<cr>
"ale python
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_python_flake8_executable = expand('$HOME/.local/share/nvim/venv/bin/flake8')
let g:ale_python_pylint_executable = expand('$HOME/.local/share/nvim/venv/bin/pylint')
"ale yaml
let g:ale_yaml_yamllint_executable = expand('$HOME/.local/share/nvim/venv/bin/yamllint')

"nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMapHelp='<f1>'
let NERDTreeMinimalUI = 1

"git fugitive
set statusline=%<%F\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
nnoremap <LEADER>gs :Gstatus<CR>
nnoremap <LEADER>gw :Gwrite<CR>
nnoremap <LEADER>gr :Gread<CR>
nnoremap <LEADER>gf :Git fetch<CR>
nnoremap <LEADER>gp :Gpush<CR><CR>
nnoremap <LEADER>gt :Git checkout<space>
nnoremap <LEADER>gc :Gcommit<CR>
nnoremap <LEADER>gd :Gdiff<CR>
nnoremap <LEADER>gb :Gblame<CR>
nnoremap <LEADER>ga :Git add % --patch<CR>

set showmode
set expandtab
set shiftwidth=2
set softtabstop=2

"disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"per file commands
autocmd BufRead,BufNewFile document-index.txt set noexpandtab softtabstop=0 shiftwidth=8

"airline
let g:airline_powerline_fonts = 1

au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.py set foldmethod=indent foldlevel=20 makeprg=python\ %
au BufRead,BufNewFile *.py compiler pyunit


au FileType gitcommit setlocal tw=72
