set ambiwidth=single
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set breakindent
set cindent
set cmdheight=1
set cmdwinheight=20
set complete-=i
set cursorline
set dictionary=/usr/share/dict/words
" set diffopt+=iwhite
set directory=~/.vim/tmp
set display+=lastline
set encoding=utf-8
set exrc
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set listchars=eol:␍,tab:␉\ ,trail:∙
set matchtime=3
set modeline
set modelines=5
set mouse=nv
set nobackup
" set nocompatible
set noexpandtab
set noshowmode
" set noswapfile
set noundofile
set nowritebackup
set nrformats-=octal
set number
set ruler
set scrolloff=1
set shiftwidth=8
set showmatch
set sidescrolloff=5
set smartcase
set smartindent
set smarttab
set tabstop=8
set termguicolors
set ttyfast
set updatetime=500
set wildmenu
set wildmode=list:longest
if has("nvim")
  set clipboard+=unnamedplus
  set inccommand=split
else
  set clipboard=unnamed,autoselect
  set ttymouse=xterm2
  set viminfo+=n~/.vim/viminfo
  set viminfo^=!
endif

if &term == "screen-256color"
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif

" if &term =~ "screen"
"   colorscheme solarized8_flat
" else
"   " let g:solarized_termcolors = 256
"   " let g:solarized_termtrans = 1
"   colorscheme solarized
" endif
" let g:solarized_termtrans = 1
" colorscheme solarized8_flat
" let g:material_theme_style = 'palenight'
" colorscheme material
let g:neodark#solid_vertsplit = 1
let g:neodark#terminal_transparent = 1
" let g:neodark#use_custom_terminal_theme = 1
colorscheme neodark
filetype plugin indent on
syntax enable

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'aklt/plantuml-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/dictionary.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'kannokanno/previm'
Plug 'KeitaNakamura/neodark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'mileszs/ack.vim'
Plug 'plasticboy/vim-markdown'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
call plug#end()

let mapleader = "\<Space>"
let g:ackprg = 'ag --vimgrep'
" let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_smartcase = 1
" let g:fzf_layout = {'window': 'tabnew'}
let g:fzf_buffers_jump = 1
let g:gitgutter_terminal_reports_focus = 0
let g:loaded_matchparen = 1
let g:lightline = {
  \ 'colorscheme': 'selenized_dark',
  \ 'active': {'left': [['mode', 'paste'],
  \                     ['readonly', 'fugitive', 'filename', 'modified']],
  \            'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]},
  \ 'inactive': {'left': [['mode', 'paste'],
  \                       ['readonly', 'fugitive', 'filename', 'modified']],
  \              'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]},
  \ 'component': {'lineinfo': ' %3l:%-2v'},
  \ 'component_function': {
  \   'readonly': 'LightLineReadonly',
  \   'modified': 'LightLineModified',
  \   'fugitive': 'LightLineFugitive'
  \ },
  \ 'separator': {'left': '', 'right': ''},
  \ 'subseparator': {'left': '', 'right': ''},
  \ 'tabline': {'right': []},
  \ }
let g:lsp_diagnostics_enabled = 0
let NERDTreeQuitOnOpen = 1
let g:netrw_nogx = 1
let g:previm_open_cmd = 'open -a Safari'
" let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
  \'win'     : '#I #W#F',
  \'cwin'    : '#I #W#F',
  \'y'       : '%Y-%m-%d',
  \'z'       : '%H:%M',
  \'options' : {'status-justify' : 'left'}}
let g:tmuxline_theme = 'nightly_fox'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0

function! LightLineReadonly()
  if &filetype == 'help'
    return ''
  elseif &readonly
    return ''
    " return emoji#for('lock')
  else
    return ''
  endif
endfunction
function! LightLineModified()
  if &filetype == 'help'
    return ''
  elseif &modified
    " return emoji#for('boom')
    return '*'
  elseif &modifiable
    return ''
  else
    return '-'
  endif
endfunction
function! LightLineFugitive()
  if &filetype == 'help'
    return ''
  elseif exists('*fugitive#statusline')
    let status = fugitive#statusline()
    return status !=# '' ? ''.' '.status : ''
  else
    return ''
  endif
endfunction

inoremap <silent> <C-g> <ESC>
cnoremap <silent> <C-g> <C-c>
cnoremap <silent> <C-y> <C-g>
vnoremap <silent> <C-g> <C-c>
nnoremap <silent> <ESC>u :<C-u>nohlsearch<CR>
nnoremap <silent> <M-u> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-n> :<C-u>nohlsearch<CR>
nnoremap <silent> <Leader>a :<C-u>Ag! <C-r><C-w><CR>
nnoremap <silent> <Leader>b :<C-u>Buffers<CR>
nnoremap <silent> <Leader>g :<C-u>GFiles<CR>
nnoremap <silent> <Leader>G :<C-u>GFiles?<CR>
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

map <MiddleMouse>   <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <MiddleMouse>   <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" nmap <Leader><Leader>s <Plug>(easymotion-s)
" xmap <Leader>s <Plug>(easymotion-bd-f2)
" nmap K <Plug>(easymotion-overwin-line)
" xmap K <Plug>(easymotion-bd-jk)

nnoremap <silent> <Leader>f :<C-u>NERDTreeToggle<CR>
nnoremap <silent> <Leader>F :<C-u>NERDTreeFind<CR>

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd FileType * set formatoptions-=o formatoptions-=r
" autocmd! FileType fzf
" autocmd FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd InsertLeave * set nopaste
" autocmd InsertLeave * :call system('osascript -e "tell application \"System Events\" to key code 102" &')
" autocmd QuickfixCmdPost make,vimgrep cwindow
if has("nvim")
  autocmd TermOpen * startinsert
  autocmd TermOpen * setlocal nonumber
  highlight Normal guibg=none
  highlight NonText guibg=none
endif

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command -nargs=1 MD call system('open '.shellescape('dict://'.<q-args>))
command -nargs=0 MDW call system('open '.shellescape('dict://'.shellescape(expand('<cword>'))))
command T4 set shiftwidth=4 expandtab

if executable('clangd')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd', '-background-index']},
    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
    \ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  " setlocal signcolumn=yes
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <Leader><Leader>r <plug>(lsp-references)
  " nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" augroup vimrc-auto-cursorline
"   autocmd!
"   autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
"   autocmd CursorHold,CursorHoldI * setlocal cursorline
" augroup END

" vi:et:sw=2
