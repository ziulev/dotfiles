"*****************************************************************************
"" Plugins list
"*****************************************************************************
lua require('plugins')


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
" Fix backspace indent
set backspace=indent,eol,start
" Disable backspace for insert mode
" set backspace=indent
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
" set smartcase
set fileformats=unix,dos,mac
set clipboard=unnamed
set noswapfile
" Keep cursor centered vertically on the screen
" let &scrolloff=999-&scrolloff
let &scrolloff=10
syntax on
syntax sync fromstart
set ruler              			            " Show the cursor position all the time
set number
" set relativenumber
set showtabline=2
set background=dark
set list
set listchars=tab:\ \ ┊,extends:…,precedes:…,space:·
let no_buffers_menu=1
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
colorscheme onedark
" let g:onedark_color_overrides = {
" \ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
" \ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
" \}
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif
if (has("termguicolors"))
 set termguicolors
endif
" Better display for messages
set cmdheight=2
set pumheight=10                        " Makes popup menu smaller
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=100                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set ttyfast
set mouse=a
set modifiable
" Hightlight the current line
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#22262b ctermbg=234
" Fix syntax highlight
syntax sync fromstart
" Persistent undo
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif
" Fix for search and replace
" :Ag foo
" if has('nvim')
"   tnoremap <a-a> <esc>a
"   tnoremap <a-b> <esc>b
"   tnoremap <a-d> <esc>d
"   tnoremap <a-f> <esc>f
" endif
"


"*****************************************************************************
"" Basic mappings
"*****************************************************************************
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>
" Split navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" <TAB>: navigate completion
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" Paste in a new line
nmap p :pu<CR>
" 'p' to paste, 'gv' to re-select what was originally selected. 'y' to copy it again
" xnoremap p :pu pgvy


"*****************************************************************************
" Treesitter
"*****************************************************************************
" lua require('treesitter-config')


"*****************************************************************************
" Comment
"*****************************************************************************
lua require('comment-config')


"*****************************************************************************
" Lua language server
"*****************************************************************************
lua require('lua-ls')


"*****************************************************************************
" Git blame
"*****************************************************************************
lua require('git-blame-config')


"*****************************************************************************
" LSP saga
"*****************************************************************************
" definition, references
nnoremap <silent> gr <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" code actions
nnoremap <silent><leader>. <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>. <cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>
" show hover doc
nnoremap <silent> gh <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-n> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-p> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" rename
nnoremap <silent><leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>


"*****************************************************************************
" telescope
"*****************************************************************************
nnoremap <leader>p <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
lua require('telescope-config')


"*****************************************************************************
" Colorizer
"*****************************************************************************
lua require('colorizer-config')


"*****************************************************************************
" lsp signature
"*****************************************************************************
lua require('lsp_signature').on_attach {}


"*****************************************************************************
" lsp FZF
"*****************************************************************************
" lua require('lspfuzzy').setup {}


"*****************************************************************************
" Tree
"*****************************************************************************
nnoremap <leader>e :NvimTreeFindFile<CR>
let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 40
" let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_ignore_ft = ['startify', 'dashboard']
let g:nvim_tree_follow = 1
lua require('tree-config')

"*****************************************************************************
" LSP config
"*****************************************************************************
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" auto-format
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
lua require('compe-config')
lua require('lsp')


"*****************************************************************************
" Context
"***************************************************************************** let g:context_add_mappings = 0 let g:context_nvim_no_redraw = 1 let g:context_ellipsis_char = '·' let g:context_highlight_normal = 'Normal'
let g:context_highlight_border = 'Comment'
let g:context_highlight_tag    = 'Special'


"*****************************************************************************
" Search nvim-hlslens
"*****************************************************************************
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>
nnoremap <silent> <leader>l :nohlsearch<CR>
lua require('hlslens-config')


"*****************************************************************************
" Autopairs
"*****************************************************************************
lua require('autopairs-config')


"*****************************************************************************
" Git signs
"*****************************************************************************
lua require('gitsigns-config')


"*****************************************************************************
" Galaxyline
"*****************************************************************************
function! ConfigStatusLine()
  lua require('galaxyline-config')
endfunction
augroup status_line_init
  autocmd!
  autocmd VimEnter * call ConfigStatusLine()
augroup END


"*****************************************************************************
" Git fugitive, twiggy, neogit
"*****************************************************************************
" noremap <Leader>gc :Git commit<CR>
" noremap <Leader>gP :Git push<CR>
" noremap <Leader>gp :Git pull<CR>
" noremap <Leader>gf :Git fetch<CR>
noremap <silent> gs :Neogit<CR>
noremap <silent> gb :Twiggy<CR>
" noremap <Leader>ga :Gwrite<CR>
" noremap <Leader>gd :Gvdiff<CR>
" noremap <Leader>gr :Gremove<CR>
" noremap gh :diffget //2<CR>
" noremap gl :diffget //3<CR>
" Conflict Resolution
" nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>


"*****************************************************************************
" Barbar
"*****************************************************************************
let bufferline = get(g:, 'bufferline', {})
let bufferline.maximum_padding = 1
let bufferline.animation = v:false
" let bufferline.closable = v:false
" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferPick<CR>
" Move to previous/next
nnoremap <silent> H :BufferPrevious<CR>
nnoremap <silent> L :BufferNext<CR>
" Move to previous/next
nnoremap <silent> <leader>H :BufferMovePrevious<CR>
nnoremap <silent> <leader>L :BufferMoveNext<CR>
" nnoremap <silent> <leader>w :BufferClose<CR>
nnoremap <silent> <leader>kw :BufferCloseAllButCurrent<CR>
noremap <leader>w :BufferClose<CR>


"*****************************************************************************
" Commentary
"*****************************************************************************
" autocmd FileType html.handlebars setlocal commentstring={{!--\ %s\ --}}


"*****************************************************************************
" Comfortable motion
"*****************************************************************************
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 0.0


"*****************************************************************************
" Startify
"*****************************************************************************
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]
let g:startify_bookmarks = [
            \ { 'z': '~/.zshrc' },
            \ { 'v': '~/.vimrc' },
            \ { 't': '~/.tmux.conf' },
            \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0


"*****************************************************************************
" is
"*****************************************************************************
map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)

