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
Plug 'mileszs/ack.vim'
Plug 'tyru/caw.vim'
Plug 'koron/codic-vim'
Plug 'itchyny/dictionary.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
" Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'kaicataldo/material.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'tyru/open-browser.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'aklt/plantuml-syntax'
Plug 'kannokanno/previm'
Plug 'tpope/vim-rhubarb'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'jacoborus/tender.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-emoji'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'plasticboy/vim-markdown'
" Plug 'lambdalisue/vim-pyenv'
Plug 't9md/vim-quickhl'
Plug 'lifepillar/vim-solarized8'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
call plug#end()

let g:ackprg = 'ag --vimgrep'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" let g:fzf_layout = {'window': 'tabnew'}
let g:fzf_buffers_jump = 1
let g:gitgutter_terminal_reports_focus = 0
" let g:indent_guides_start_level = 2
" let g:indent_guides_color_change_percent = 2
" let g:indent_guides_guide_size = 1
let g:loaded_matchparen = 1
let g:lightline = {
  \ 'colorscheme': 'neodark',
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
  \ }
let NERDTreeQuitOnOpen = 1
let g:netrw_nogx = 1
let g:previm_open_cmd = 'open -a Safari'
let g:tagbar_sort = 0
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
  \'a'       : '#h',
  \'win'     : '#I #W#F',
  \'cwin'    : '#I #W#F',
  \'x'       : ['#(free)', '#(ssid)'],
  \'y'       : '%H:%M',
  \'z'       : '%Y-%m-%d',
  \'options' : {'status-justify' : 'left'}}
let g:tmuxline_theme = 'vim_statusline_1'
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
nnoremap <silent> <Leader>a :<C-u>Ag! <C-r><C-w><CR>
nnoremap <silent> <Leader>b :<C-u>Buffers<CR>
nnoremap <silent> <Leader>g :<C-u>GFiles<CR>
nnoremap <silent> <Leader>G :<C-u>GFiles?<CR>
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
nmap <Leader>m <Plug>(quickhl-manual-this)
xmap <Leader>m <Plug>(quickhl-manual-this)
nmap <Leader>M <Plug>(quickhl-manual-reset)
xmap <Leader>M <Plug>(quickhl-manual-reset)
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

nmap <Leader>s <Plug>(easymotion-overwin-f2)
xmap <Leader>s <Plug>(easymotion-bd-f2)
nmap K <Plug>(easymotion-overwin-line)
xmap K <Plug>(easymotion-bd-jk)

nnoremap <silent> <Leader>f :<C-u>NERDTreeToggle<CR>
nnoremap <silent> <Leader>F :<C-u>NERDTreeFind<CR>
nnoremap <silent> <Leader>t :<C-u>TagbarToggle<CR>

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

" augroup vimrc-auto-cursorline
"   autocmd!
"   autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
"   autocmd CursorHold,CursorHoldI * setlocal cursorline
" augroup END

" if jedi#init_python()
"   function! s:jedi_auto_force_py_version() abort
"     let g:jedi#force_py_version = pyenv#python#get_internal_major_version()
"   endfunction
"   augroup vim-pyenv-custom-augroup
"     autocmd! *
"     autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
"     autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
"   augroup END
" endif

" vi:et:sw=2
