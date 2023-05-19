syntax enable
" colorscheme bubblegum-256-light
set antialias
set background=dark
" set blurradius=3
set cmdheight=1
" set columns=180
" set fillchars=vert:\│
" set guifontwide=YuGo-Medium:h15
set guifont=FiraCodeNerdFontMono-Medium:h13
" set guifont=FiraCodeNerdFontCompleteM-Medium:h13
" set guifont=JetBrainsMonoNerdFontCompleteM-Regular:h13
" set guifontwide=ToppanBunkyuGothicPr6N-Regular:h15
set guioptions-=rL
set noimdisable
" set lines=75
set linespace=-1
set macligatures
set macmeta
set transparency=5

noremap <silent> <D-`> :macaction _cycleWindows:<CR>
noremap! <silent> <D-`> <C-o>:macaction _cycleWindows:<CR>
