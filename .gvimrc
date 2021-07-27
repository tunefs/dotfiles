syntax enable
colorscheme PaperColor
set antialias
set background=light
" set blurradius=3
set cmdheight=1
set columns=210
set guifont=FiraCodeNerdFontCompleteM-Retina:h13
set guifontwide=FiraCodeNerdFontCompleteM-Retina:h13,YuGo-Medium:h13
set guioptions-=rL
set noimdisable
set lines=50
" set linespace=1
set macligatures
set macmeta
" set transparency=8

noremap <silent> <D-`> :macaction _cycleWindows:<CR>
noremap! <silent> <D-`> <C-o>:macaction _cycleWindows:<CR>
