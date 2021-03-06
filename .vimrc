execute pathogen#infect()

" Syntex highlighting
syntax on
filetype plugin indent on
autocmd BufRead,BufNewFile *.inc,*.tasklist set filetype=c
autocmd BufRead,BufNewFile *.vhd,*.vhdl set filetype=vhdl

" Highlight trailing whitespace
let c_space_errors = 1

" Remove command compatibility with old vim version
set nocompatible

" Required for airline
let g:airline_powerline_fonts = 1

" Turn on line numbers
set number

" Color stuff
set termguicolors

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': {
  \       'override' : {
  \         'linenumber_fg' : ['#878787', '232'],
  \         'linenumber_bg' : ['#e4e4e4', '232'],
  \         'vertsplit_bg' : ['#e4e4e4', '255'],
  \         'cursorcolumn' : ['#e4e4e4', '254'],
  \       }
  \     }
  \   },
  \   'cpp': {
  \     'highlight_standard_library': 1,
  \   },
  \   'c': {
  \     'highlight_builtins' : 1,
  \   }
  \ }
set background=light
colorscheme PaperColor
let g:airline_papercolor_alt_modes=0
let g:airline_theme='papercolor'
"let g:airline_solarized_dark_inactive_border=1
"let g:airline_solarized_normal_green=1

" Vertical Columns
let &colorcolumn=join(range(120,299),",")
" Remove separater character between split views (windows)
:set fillchars+=vert:\ 

" Buffergator settings
let g:buffergator_sort_regime='basename'
let g:buffergator_show_full_directory_path=0
let g:buffergator_vsplit_size=50

" Use tabs not spaces with width 4:
:set expandtab
:set copyindent
:set preserveindent
:set softtabstop=4
:set shiftwidth=4
:set tabstop=4

" VHDL uses width 4
autocmd Filetype vhdl setlocal ts=3 sw=3
