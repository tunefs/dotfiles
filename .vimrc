set ambiwidth=single
set autoindent
set autoread
set background=dark
" set background=light
set backspace=indent,eol,start
set belloff=all
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
set guioptions-=e
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
" set list
set listchars=eol:↲,tab:↳\ ,space:∙,trail:␣
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
set shell=fish
set tabstop=8
set termguicolors
set notitle
set ttyfast
set updatetime=500
set wildmenu
set wildmode=longest:full,full
if has("nvim")
  set clipboard+=unnamedplus
  set inccommand=split
  set winblend=15
  set pumblend=15
else
  set clipboard=unnamed,autoselect
  set ttymouse=xterm2
  set viminfo+=n~/.vim/viminfo
  set viminfo^=!
endif

if &term == "screen-256color"
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  let &t_SI = "\<Esc>[5 q"
  let &t_SR = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[1 q"
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'aklt/plantuml-syntax'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'easymotion/vim-easymotion'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mileszs/ack.vim'
if !exists('g:vscode')
if has("nvim")
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif
endif
Plug 'plasticboy/vim-markdown'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-fugitive'
Plug 'brglng/vim-im-select'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
call plug#end()

let mapleader = "\<Space>"
let g:ackprg = 'ag --vimgrep'
" let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_smartcase = 2
" let g:fzf_layout = {'window': 'tabnew'}
let g:dracula_italic = 0
let g:fzf_buffers_jump = 1
let g:gitgutter_terminal_reports_focus = 0
let g:im_select_default = 'com.apple.keylayout.ABC'
let g:im_select_get_im_cmd = ['im-select']
let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ 'active': {'left': [['mode', 'paste'],
  \                     ['readonly', 'fugitive', 'filename', 'modified']],
  \            'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]},
  \ 'inactive': {'left': [['mode', 'paste'],
  \                       ['readonly', 'fugitive', 'filename', 'modified']],
  \              'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]},
  \ 'component': {'lineinfo': '%3l:%-2v'},
  \ 'component_function': {
  \   'readonly': 'LightLineReadonly',
  \   'modified': 'LightLineModified',
  \   'fugitive': 'LightLineFugitive'
  \ },
  \ 'separator': {'left': '', 'right': ''},
  \ 'subseparator': {'left': '', 'right': ''},
  \ 'tabline': {'right': []},
  \ }
let g:loaded_matchparen = 1
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
" let g:lsp_insert_text_enabled = 0
" let g:lsp_text_edit_enabled = 0
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = '/tmp/vim-lsp.log'
let g:netrw_banner=0
" let g:netrw_keepdir=0
let g:netrw_liststyle=1
let g:netrw_maxfilenamelen=48
let g:netrw_nogx = 1
let g:netrw_sizestyle = "h"
let g:netrw_timefmt = "%Y/%m/%d %I:%M:%S"
let g:netrw_winsize = -32
let g:surround_no_insert_mappings = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0

" colorscheme deep-space
colorscheme dracula
filetype plugin indent on
syntax enable

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
    return ' '
  elseif &modifiable
    return ''
  else
    return '-'
  endif
endfunction
function! LightLineFugitive()
  if &filetype == 'help'
    return ''
  elseif exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? '  '.branch : ''
  else
    return ''
  endif
endfunction

inoremap <C-g> <ESC>
cnoremap <C-g> <C-c>
cnoremap <C-y> <C-g>
vnoremap <C-g> <C-c>
nmap yp :<C-u>let @* = expand("%")<CR>
nnoremap <silent> <ESC>u :<C-u>nohlsearch<CR>
nnoremap <silent> <M-u> :<C-u>nohlsearch<CR>
if !exists('g:vscode')
  nnoremap <silent> <Leader>b :<C-u>Buffers<CR>
  nnoremap <silent> <Leader>d :<C-u>Explore<CR>
  nnoremap <silent> <Leader>f :<C-u>FZF<CR>
  nnoremap <silent> <Leader>g :<C-u>GFiles<CR>
  nnoremap <silent> <Leader>G :<C-u>GFiles?<CR>
  nnoremap <silent> <Leader>s :<C-u>Rg! <C-r><C-w><CR>
endif
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

if !exists('g:vscode')
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)
endif
if exists('g:vscode')
  nnoremap [c <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>
  nnoremap ]c <Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>
endif

map <MiddleMouse>   <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <MiddleMouse>   <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd CmdwinEnter [:/?=] setlocal nonumber
autocmd CmdwinEnter * map <buffer> <C-g> <C-c>
autocmd FileType * set formatoptions-=o formatoptions-=r
autocmd InsertLeave * set nopaste
if has("nvim")
  unmap Y
  " autocmd TermOpen * startinsert
  autocmd TermOpen * setlocal nonumber
"   highlight Whitespace guifg=#475C69
else
  nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<CR><C-L>
"   highlight SpecialKey guifg=#475C69
endif
" highlight Normal guibg=NONE
" highlight NonText guifg=#475C69
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
" highlight LineNr ctermbg=NONE guibg=NONE
" highlight Folded ctermbg=NONE guibg=NONE
" highlight EndOfBuffer ctermbg=NONE guibg=NONE

if !exists('g:vscode')
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command T4 set shiftwidth=4 expandtab

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <Leader><Leader>h <plug>(lsp-hover)
  nmap <buffer> <Leader><Leader>r <plug>(lsp-references)
endfunction
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if has("nvim")
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cmake", "cpp", "css", "fish", "html", "javascript", "json", "kotlin", "make", "markdown", "ninja", "python", "typescript"},
  sync_install = false,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}
EOF
endif
endif

" vi:et:sw=2
