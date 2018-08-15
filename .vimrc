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
" set diffopt+=vertical
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
" set previewheight=20
" set pumheight=10
set ruler
set scrolloff=1
set shiftwidth=8
set showmatch
" set showtabline=2
set sidescrolloff=5
set smartcase
set smartindent
set smarttab
set tabstop=8
" set tabpagemax=50
set ttyfast
" set timeout
" set timeoutlen=1000
" set ttimeout
" set ttimeoutlen=100
set updatetime=500
set wildmenu
set wildmode=list:longest
if has("nvim")
  set clipboard+=unnamedplus
  set inccommand=split
  " set termguicolors
else
  set clipboard=unnamed,autoselect
  set ttymouse=xterm2
  set viminfo+=n~/.vim/viminfo
  set viminfo^=!
endif

" let g:solarized_termcolors = 256
" let g:solarized_degrade = 1
let g:solarized_termtrans = 1
colorscheme solarized
filetype plugin indent on
syntax enable

call plug#begin('~/.vim/plugged')
Plug 'tyru/caw.vim'
Plug 'koron/codic-vim'
Plug 'itchyny/dictionary.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'kannokanno/previm'
Plug 'godlygeek/tabular'
Plug 'edkolev/tmuxline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-emoji'
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'plasticboy/vim-markdown'
Plug 't9md/vim-quickhl'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
call plug#end()

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" let g:fzf_launcher = "In_a_new_term_function3 %s"
" let g:fzf_layout = {'window': 'tabnew'}
let g:fzf_buffers_jump = 1
" let g:gitgutter_sign_modified = '*'
" let g:gitgutter_sign_modified_removed = '**'
let g:gitgutter_terminal_reports_focus = 0
" let g:indent_guides_start_level = 2
" let g:indent_guides_color_change_percent = 2
" let g:indent_guides_guide_size = 1
let g:loaded_matchparen = 1
let g:lightline = {
  \ 'colorscheme': 'solarized',
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
  \ 'subseparator': {'left': '', 'right': ''}
  \ }
let g:previm_open_cmd = 'open -a Safari'
" let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
  \'a'       : '#h',
  \'win'     : '#I #W#F',
  \'cwin'    : '#I #W#F',
  \'x'       : ['#(free)', '#(ssid)'],
  \'y'       : '%H:%M',
  \'z'       : '%Y-%m-%d',
  \'options' : {'status-justify' : 'left'}}
let g:tmuxline_theme = 'lightline_insert'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0

function! LightLineReadonly()
  if &filetype == 'help'
    return ''
  elseif &readonly
"     return ''
    return emoji#for('lock')
  else
    return ''
  endif
endfunction
function! LightLineModified()
  if &filetype == 'help'
    return ''
  elseif &modified
    return emoji#for('boom')
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
nmap <Leader>f <Plug>(easymotion-bd-f)

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd FileType * set formatoptions-=o formatoptions-=r
" autocmd! FileType fzf
" autocmd FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd InsertLeave * set nopaste
" autocmd InsertLeave * :call system('osascript -e "tell application \"System Events\" to key code 102" &')
" autocmd QuickfixCmdPost make,vimgrep cwindow

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command -nargs=1 MD call system('open '.shellescape('dict://'.<q-args>))
command -nargs=0 MDW call system('open '.shellescape('dict://'.shellescape(expand('<cword>'))))

augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

" highlight CursorLineNr cterm=bold ctermfg=130 ctermbg=7 gui=bold guifg=#cb4b16
" highlight CursorLine cterm=underline ctermbg=NONE gui=underline guibg=NONE

" vi:et:sw=2
