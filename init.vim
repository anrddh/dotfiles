call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'benjie/neomake-local-eslint.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-sleuth'
Plug 'ajh17/Spacegray.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'sheerun/vim-polyglot'
call plug#end()

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Set eslint as the only valid JS linter
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Some sane defaults
set number
filetype plugin indent on

" Set color scheme to spacegray
colorscheme spacegray

" Set font to Source Code Pro
set guifont=Source\ Code\ Pro\ 11

" Webpack recommended stuff
:set backupcopy=yes

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
