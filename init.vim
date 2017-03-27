" General Settings
  " base
  filetype plugin indent on
  syntax on

"
  " Remap C-w-h/C-w-j/C-w-k/C-w-l to C-h/C-j/C-k/C-l
  nmap <silent> <C-k> :wincmd k<CR>
  nmap <silent> <C-j> :wincmd j<CR>
  nmap <silent> <C-h> :wincmd h<CR>
  nmap <silent> <C-l> :wincmd l<CR>

  " Share clipboard between multiple vim sessions
  autocmd CursorHold,FocusGained,FocusLost * rshada|wshada

  " Search for text selected in visual mode
  vnoremap // y/<C-R>"<CR>

  set splitbelow
  set splitright

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
  Plug 'sebastianmarkow/deoplete-rust'
  Plug 'alvan/vim-closetag'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'jiangmiao/auto-pairs'
  Plug 'matze/vim-move'
  Plug 'sheerun/vim-polyglot'
  Plug 'valloric/matchtagalways'
  Plug 'tpope/vim-sleuth'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'Glench/Vim-Jinja2-Syntax'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  Plug 'majutsushi/tagbar'

  " ui related
  Plug 'airblade/vim-gitgutter'
  Plug 'dietsche/vim-lastplace'
  Plug 'chriskempson/base16-vim'
  Plug 'yggdroot/indentline'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " background related
  Plug 'w0rp/ale'
  Plug 'craigemery/vim-autotag'
  Plug 'vim-scripts/cscope.vim'

  " other
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'easymotion/vim-easymotion'
  call plug#end()

" Plugin settings
  " airline
  let g:airline_powerline_fonts = 1
  let g:airline_theme='base16'

  " close-tag
  let g:closetag_filenames = "*.html,*.jsx"

  " deoplete
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    " deoplete-rust
    let g:deoplete#sources#rust#racer_binary='~/.cargo/bin/racer'
    let g:deoplete#sources#rust#rust_source_path='~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

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
  autocmd FileType rust let g:ale_lint_on_text_changed = 0
  autocmd FileType rust let g:ale_lint_on_save = 1

  " Nerdtree
  map <C-i> :NERDTreeToggle<CR>

  " matchtagalways
  let g:mta_filetypes = {
    \ 'javascript.jsx': 1,
    \ 'html' : 1,
    \ 'xml' : 1,
    \ }

  " theme settings
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
  colorscheme base16-mexico-light

  " ale
  let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ }

  " cscope.vim
  nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
  nnoremap <leader>l :call ToggleLocationList()<CR>

  " interface
  set background=light
  set colorcolumn=81
  set cursorline
  set laststatus=2
  set noshowmode
  set number
  set ruler
  set showcmd
  set sidescroll=1

" Webpack recommended stuff
set backupcopy=yes

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
