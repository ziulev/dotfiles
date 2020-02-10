 "*****************************************************************************
 "" Vim-PLug core
 "*****************************************************************************
 let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

 if !filereadable(vimplug_exists)
   if !executable("curl")
     echoerr "You have to install curl or first install vim-plug yourself!"
     execute "q!"
   endif
   echo "Installing Vim-Plug..."
   echo ""
   silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
   let g:not_finish_vimplug = "yes"

   autocmd VimEnter * PlugInstall
 endif

 " Required:
 call plug#begin(expand('~/.config/nvim/plugged'))

 "*****************************************************************************
 "" Plug install packages
 "*****************************************************************************
 Plug 'scrooloose/nerdtree'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 Plug 'vim-scripts/grep.vim'
 Plug 'w0rp/ale'
 Plug 'sheerun/vim-polyglot'
 Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
 Plug 'yuttie/comfortable-motion.vim'
 Plug 'Asheq/close-buffers.vim'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
 Plug 'junegunn/fzf.vim'
 Plug 'Shougo/vimproc.vim', {'do' : 'make'}
 Plug 'tpope/vim-surround'
 Plug 'mileszs/ack.vim'
 Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'itchyny/lightline.vim'
 Plug 'niklaas/lightline-gitdiff'
 Plug 'mengelbrecht/lightline-bufferline'
 Plug 'christoomey/vim-conflicted'
 Plug 'idanarye/vim-merginal'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
 Plug 'joshdick/onedark.vim'

 call plug#end()

 " Required:
 filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set softtabstop=0
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Map leader to ,
let mapleader=' '

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac
set clipboard=unnamed
set noswapfile

syntax on
set ruler
set number
set relativenumber

set guifont=Inconsolata-g\ for\ Powerline:h14

let no_buffers_menu=1

set showtabline=2

set background=dark
colorscheme onedark

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
set termguicolors


"*****************************************************************************
"" Mappings
"*****************************************************************************

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Git fugitive
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gl :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" TS fix problems
nnoremap <silent> <Leader>f :<C-u>CocCommand tsserver.executeAutofix<CR>

" Clap
nnoremap <silent> <space>p :<C-u>Clap files<CR>
nnoremap <silent> <space>b :<C-u>Clap buffers<CR>

" Global find
vnoremap <leader>f :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader>f :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
 let saved_unnamed_register = @@
 if a:type ==# 'v'
   normal! `<v`>y
 elseif a:type ==# 'char'
   normal! `[v`]y
 else
   return
 endif
 let word = substitute(@@, '\n$', '', 'g')
 let word = escape(word, '| ')
 let @@ = saved_unnamed_register
 execute 'CocList grep '.word
endfunction

" Buffer nav
noremap <leader>w :CloseThisBuffer<CR>
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Better exit instert mode jj
inoremap jj <ESC>

" Go to Definition
nnoremap <silent> <leader>d :ALEGoToDefinitionInTab<CR>

" TSU import
nnoremap <silent> <leader>i :TsuImport<CR>

" Autocomplete navigation
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" NERDTree configuration
let g:NERDTreeWinSize = 60
let g:NERDTreeWinPos = "right"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" Current file NERDtree
function! NerdTreeToggleFind()
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
      NERDTreeClose
  elseif bufexists(expand('%'))
      NERDTreeFind
  else
      NERDTree
  endif
endfunction
nnoremap <silent>\ :call NerdTreeToggleFind()<CR>
nnoremap <D-b> :call NerdTreeToggleFind()<CR>

let g:NERDTreeQuitOnOpen = 1

nmap <D-B> :NERDTreeToggle<CR>
let g:NERDTreeMapActivateNode='l'
autocmd FileType nerdtree nmap <buffer> l o


" Lightline
let g:lightline                         = {}
let g:lightline.colorscheme             = 'onedark'
let g:lightline.active                  = {'left': [ [ 'mode', 'paste' ], [ 'readonly', 'modified' ], [ 'gitdiff' ] ]}
let g:lightline.tabline                 = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand        = {'buffers': 'lightline#bufferline#buffers', 'gitdiff': 'lightline#gitdiff#get'}
let g:lightline.component_type          = {'buffers': 'tabsel', 'gitdiff': 'middle'}
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
