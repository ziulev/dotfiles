
"*****************************************************************************
"" Plugins list
"*****************************************************************************
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'yuttie/comfortable-motion.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'stsewd/fzf-checkout.vim'
Plug 'airblade/vim-rooter'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'niklaas/lightline-gitdiff'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'christoomey/vim-conflicted'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'cohama/lexima.vim'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'alvan/vim-closetag'
Plug 'haya14busa/is.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'eugen0329/vim-esearch' "<leader>ff
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'leafgarland/typescript-vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'ojroques/vim-scrollstatus'
Plug 'mustache/vim-mustache-handlebars'

Plug 'takac/vim-hardtime'

call plug#end()
filetype plugin indent on



"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
" set backspace=indent,eol,start

" Disable backspace for insert mode
set backspace=indent

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
set relativenumber
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

" Fix for search and replace
" :Ag foo
" if has('nvim')
"   tnoremap <a-a> <esc>a
"   tnoremap <a-b> <esc>b
"   tnoremap <a-d> <esc>d
"   tnoremap <a-f> <esc>f
" endif



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
" Buffers
"*****************************************************************************
noremap <leader>w :Bdelete this<CR>
noremap <leader>W :Bdelete other<CR>
noremap L :bn<CR>
noremap H :bp<CR>



"*****************************************************************************
" Git fugitive, twiggy
"*****************************************************************************
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gu :Gpull<CR>
noremap <Leader>gf :Gfetch<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Twiggy<CR>

" noremap <Leader>ga :Gwrite<CR>
" noremap <Leader>gd :Gvdiff<CR>
" noremap <Leader>gr :Gremove<CR>

noremap gh :diffget //2<CR>
noremap gl :diffget //3<CR>

" Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>



"*****************************************************************************
" Commentary
"*****************************************************************************
autocmd FileType html.handlebars setlocal commentstring={{!--\ %s\ --}}




"*****************************************************************************
" Hardtime
"*****************************************************************************
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_ignore_buffer_patterns = [ "COC.*", "NERD.*" ]



"*****************************************************************************
" Comfortable motion
"*****************************************************************************
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 0.0



"*****************************************************************************
" ScrollStatus
"*****************************************************************************
let g:scrollstatus_size = 10
let g:scrollstatus_symbol_track = '░'
let g:scrollstatus_symbol_bar = '█'



"*****************************************************************************
" Lightline
"*****************************************************************************
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

let g:lightline                              = {}
let g:lightline.colorscheme                  = 'onedark'
let g:lightline.active                       = {'left': [['mode', 'paste'],['gitbranch', 'readonly', 'modified'],['gitdiff']],'right': [['relativepath'],['blame'],['percent']]}
let g:lightline.tabline                      = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand             = {'buffers': 'lightline#bufferline#buffers', 'gitdiff': 'lightline#gitdiff#get'}
let g:lightline.component_type               = {'buffers': 'tabsel', 'gitdiff': 'middle'}
let g:lightline#bufferline#shorten_path      = 0
" let g:lightline#bufferline#smart_path      = 0
let g:lightline#bufferline#unnamed           = '[No Name]'
let g:lightline#bufferline#show_number       = 2
let g:lightline#bufferline#enable_devicons   = 1
" let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#clickable         = 1
let g:lightline.component_raw                = {'buffers': 1}
let g:lightline.component_function           = {'blame': 'LightlineGitBlame', 'percent': 'ScrollStatus', 'gitbranch': 'fugitive#head'}

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

"*****************************************************************************
" FZF
"*****************************************************************************
" This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
" let g:fzf_history_dir = '~/.local/share/fzf-history'

" map <C-f> :Files<CR>
" nnoremap <silent> <leader>p :Files<CR>

" nnoremap <silent> <leader>h :History<CR>
" nnoremap <silent> <leader>b :GCheckout<CR>
" nnoremap <silent> <leader>gf :GF?<CR>
" nnoremap <silent> <leader>F :Ag<CR>
" map <leader>b :Buffers<CR>
" nnoremap <leader>g :Rg<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap <leader>m :Marks<CR>


" let g:fzf_tags_command = 'ctags -R'
" Border color
" let g:fzf_layout = {
" \  'up':'~50%',
" \  'window':
" \    {
" \      'width': 0.85,
" \      'height': 0.85,
" \      'yoffset': 0.5,
" \      'xoffset': 0.5,
" \      'highlight': 'Todo',
" \      'border': 'rounded'
" \    }
" \}

" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-s:toggle-up'
" let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

"Get Files
" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
" command! -bang -nargs=* GGrep
"   \ call fzf#vim#grep(
"   \   'git grep --line-number '.shellescape(<q-args>), 0,
"   \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)




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
" Coc
"*****************************************************************************
let g:coc_global_extensions = [
\  "coc-eslint",
\  "coc-spell-checker",
\  "coc-json",
\  "coc-git",
\  "coc-explorer",
\  "coc-markdownlint",
\  "coc-yank",
\  "coc-pairs",
\  "coc-actions",
\  "coc-style-helper",
\  "coc-smartf",
\  "coc-yaml",
\  "coc-tsserver",
\  "coc-css",
\  "coc-html",
\  "coc-vimlsp",
\  "coc-highlight",
\  "coc-ember",
\  "coc-svg",
\]

let g:coc_global_config="$HOME/coc-settings.json"

" TS fix problems
nnoremap <silent> <Leader>fi :<C-u>CocCommand tsserver.executeAutofix<CR>

" Show autocomplete when Tab is pressed
" inoremap <silent><expr> <Tab> coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()



"*****************************************************************************
" Coc fzf preview
"*****************************************************************************
" fzf preview
nnoremap <silent> <leader>p :<C-u>FzfPreviewFromResourcesRpc project_mru git<CR>
" nnoremap <silent> <leader>gs :<C-u>FzfPreviewGitStatusRpc<CR>
nnoremap <silent> <leader>ga :<C-u>FzfPreviewGitActionsRpc<CR>



"*****************************************************************************
" Coc git
"*****************************************************************************
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

" Show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" Reset current chunk
nmap gU :CocCommand git.chunkUndo<CR>
" nnoremap <silent> gd :<C-u>Git diff<CR>



"*****************************************************************************
" Coc code action
"*****************************************************************************
nmap <leader>. <Plug>(coc-codeaction)



"*****************************************************************************
" Coc fix current
"*****************************************************************************
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)



"*****************************************************************************
" Coc definition, implementation, references
"*****************************************************************************
" Remap keys for gotos
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <silent> gr <Plug>(coc-references)



"*****************************************************************************
" Coc rename
"*****************************************************************************
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)



"*****************************************************************************
" Coc SmartF
"*****************************************************************************
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
" nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#3897f0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end



"*****************************************************************************
" Coc explorer
"*****************************************************************************
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.vim',
\   },
\   'floating': {
\      'position': 'right',
\      'width': 50,
\   },
\ }
nmap <space>e :CocCommand explorer --preset floating<CR>
nmap <space>\ :CocCommand explorer --open-action-strategy previousWindow --position right<CR>

hi! DiffAdd ctermbg=green ctermfg=green guibg=NONE guifg=#2e7d32
hi! DiffChange ctermbg=yellow ctermfg=yellow guibg=NONE guifg=#ff8f00
hi! DiffDelete ctermbg=red ctermfg=red guibg=NONE guifg=#e57373

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@



"*****************************************************************************
" is
"*****************************************************************************
map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)

" nmap * <Plug>(anzu-star-with-echo)
" nmap # <Plug>(anzu-sharp-with-echo)

" clear status
" nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

" statusline
" set statusline=%{anzu#search_status()}

