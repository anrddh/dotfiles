" General Settings
  " base
  filetype plugin indent on
  syntax on

  " interface
  set background=dark
  set colorcolumn=81
  set cursorline
  set laststatus=2
  set noshowmode
  set number
  set ruler
  set showcmd
  set sidescroll=1

  " Remap C-w-h/C-w-j/C-w-k/C-w-l to C-h/C-j/C-k/C-l
  nmap <silent> <C-k> :wincmd k<CR>
  nmap <silent> <C-j> :wincmd j<CR>
  nmap <silent> <C-h> :wincmd h<CR>
  nmap <silent> <C-l> :wincmd l<CR>

  " toggle relative numbering
  function! NumberToggle()
    if(&relativenumber == 1)
      set number
      set nornu
    else
      set relativenumber
    endif
  endfunc
  nnoremap <C-n> :call NumberToggle()<cr>

  " whitespace
  set expandtab
  set nojoinspaces
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2

  " searching
  set hlsearch
  set ignorecase
  set incsearch
  set smartcase

  " background processes
  set autoread
  set autoindent
  set clipboard=unnamed
  set lazyredraw
  set noswapfile
  set ttyfast

" Plugins
  call plug#begin('~/.local/share/nvim/plugged')

  " syntax related
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'alvan/vim-closetag'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'jiangmiao/auto-pairs'
  Plug 'matze/vim-move'
  Plug 'sheerun/vim-polyglot'
  Plug 'valloric/matchtagalways'
  Plug 'tpope/vim-sleuth'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/vim-js-pretty-template'

  " ui related
  Plug 'airblade/vim-gitgutter'
  Plug 'dietsche/vim-lastplace'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'yggdroot/indentline'
  Plug 'christoomey/vim-tmux-navigator'

  " background related
  Plug 'w0rp/ale'
  Plug 'craigemery/vim-autotag'
  Plug 'vim-scripts/cscope.vim'

  " other
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  call plug#end()

" Plugin settings
  " airline
  let g:airline_powerline_fonts = 1
  let g:airline_theme='gruvbox'

  " close-tag
  let g:closetag_filenames = "*.html,*.jsx"

  " deoplete
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " gitgutter
  let g:gitgutter_sign_column_always = 1
  let g:gitgutter_sign_added = '++'
  let g:gitgutter_sign_modified = '~~'
  let g:gitgutter_sign_removed = '__'
  let g:gitgutter_sign_removed_first_line = '¯¯'
  let g:gitgutter_sign_modified_removed = '~_'

  "vim-js-pretty-tempalte
  autocmd FileType typescript JsPreTmpl html
  autocmd FileType typescript syn clear foldBraces

  " matchtagalways
  let g:mta_filetypes = {
    \ 'javascript.jsx': 1,
    \ 'html' : 1,
    \ 'xml' : 1,
    \ }

  " theme settings
  let g:gruvbox_italic = 1
  colorscheme gruvbox

  " ale
  let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ }

  " cscope.vim
  nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
  nnoremap <leader>l :call ToggleLocationList()<CR>

" Webpack recommended stuff
:set backupcopy=yes

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
