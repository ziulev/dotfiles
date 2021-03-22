local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Lua
    use 'nanotee/nvim-lua-guide'
    use 'tjdevries/nlua.nvim'

    -- Quality of life improvements
    -- use 'norcalli/nvim_utils'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'mfussenegger/nvim-jdtls'
    use 'ray-x/lsp_signature.nvim'

    -- Debugging
    -- use 'mfussenegger/nvim-dap'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    -- use 'honza/vim-snippets'
	
	-- Completion
	use 'nvim-lua/completion-nvim'
	use 'steelsojka/completion-buffers'
	use 'kristijanhusak/completion-tags'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    -- use 'ryanoasis/vim-devicons'

    -- Status Line and Bufferline
    use 'glepnir/galaxyline.nvim'
    use 'romgrk/barbar.nvim'
    -- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Colors
    use 'norcalli/nvim-colorizer.lua'

    -- Colorscheme
    -- use 'tjdevries/colorbuddy.vim'
    -- use 'Th3Whit3Wolf/onebuddy'
    use 'joshdick/onedark.vim'

    -- Ember
    -- use 'joukevandermaas/vim-ember-hbs'

    -- Git
    use 'sodapopcan/vim-twiggy'
    use 'TimUntersberger/neogit'
    use 'lewis6991/gitsigns.nvim'
    use 'f-person/git-blame.nvim'

    -- General Plugins
    -- use 'b3nj5m1n/kommentary'
    use 'terrortylor/nvim-comment'
    use 'yuttie/comfortable-motion.vim'
    use 'airblade/vim-rooter'
    use 'tpope/vim-surround'
--    use 'mhinz/vim-startify'
    
    use 'haya14busa/is.vim'
    use 'osyo-manga/vim-anzu'

    use 'rmagatti/auto-session'

	use 'editorconfig/editorconfig-vim'
	use 'christoomey/vim-tmux-navigator'
	use 'mustache/vim-mustache-handlebars'
	use 'windwp/nvim-autopairs'
	use 'kevinhwang91/nvim-hlslens'
	use 'tpope/vim-sleuth'

    -- use 'windwp/nvim-autopairs'
    -- use 'kevinhwang91/nvim-bqf'
    -- use 'unblevable/quick-scope'
    -- use 'airblade/vim-rooter'
    -- use 'kevinhwang91/rnvimr'
    -- use 'mhinz/vim-startify'
    -- use 'metakirby5/codi.vim'
    -- use 'psliwka/vim-smoothie'
    -- use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
    -- use 'moll/vim-bbye'
    -- use 'turbio/bracey.vim'
    -- use 'AndrewRadev/tagalong.vim'
    -- use 'alvan/vim-closetag'
    -- use 'liuchengxu/vim-which-key'
    -- use 'voldikss/vim-floaterm'
    -- use 'liuchengxu/vista.vim'
    -- use 'terrortylor/nvim-comment'
    -- use 'bfredl/nvim-miniyank'
    -- use 'junegunn/goyo.vim'
    -- use 'andymass/vim-matchup'
    -- use 'phaazon/hop.nvim'
    -- use 'gennaro-tedesco/nvim-jqx'


    -- use 'RRethy/vim-illuminate'
    -- use 'b3nj5m1n/kommentary'
    -- use 'tpope/vim-sleuth'
    -- use {
    --     'glacambre/firenvim',
    --     run = function()
    --         vim.fn['firenvim#install'](1)
    --     end
    -- }
end)


--*****************************************************************************
-- Barbar
--*****************************************************************************
-- bufferline.maximum_padding = 1
-- let bufferline = get(g:, 'bufferline', {})
-- let bufferline.maximum_padding = 1
-- let bufferline.animation = v:false
-- nnoremap <silent> <C-s> :BufferPick<CR>
-- nnoremap <silent> H :BufferPrevious<CR>
-- nnoremap <silent> L :BufferNext<CR>
-- nnoremap <silent> <leader>H :BufferMovePrevious<CR>
-- nnoremap <silent> <leader>L :BufferMoveNext<CR>
-- nnoremap <silent> <leader>kw :BufferCloseAllButCurrent<CR>

