call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'benjie/neomake-local-eslint.vim'
Plug 'Neomake/Neomake'
Plug 'tpope/vim-sleuth'
Plug 'altercation/vim-colors-solarized'
call plug#end()

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Auto-start Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_verbose = 3

" Some sane defaults
set number
filetype plugin indent on

" Set color scheme to Solarized Dark
set background=dark
colorscheme solarized

" Set font to Source Code Pro
set guifont=Source\ Code\ Pro\ 11

" Webpack recommended stuff
:set backupcopy=yes
