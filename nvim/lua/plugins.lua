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

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'mfussenegger/nvim-jdtls'
  use 'ray-x/lsp_signature.nvim'
  use 'kabouzeid/nvim-lspinstall'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Completion
  use 'nvim-lua/completion-nvim'
  use 'steelsojka/completion-buffers'
  use 'kristijanhusak/completion-tags'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  -- use {
  --   'yamatsum/nvim-web-nonicons',
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- Status Line and Bufferline
  use 'glepnir/galaxyline.nvim'
  use 'romgrk/barbar.nvim'

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"}
    }
  }

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Colors
  use 'norcalli/nvim-colorizer.lua'

  -- Colorscheme
  use 'Th3Whit3Wolf/one-nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = {
      'tpope/vim-commentary'
    }
  }
  use 'windwp/nvim-ts-autotag'
  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  -- use 'nvim-treesitter/playground'
  -- use 'p00f/nvim-ts-rainbow'

  -- Git
  use 'sodapopcan/vim-twiggy'
  use 'TimUntersberger/neogit'
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    }
  }
  use 'f-person/git-blame.nvim'

  -- General Plugins
  -- use 'chaoren/vim-wordmotion'
  use 'justinmk/vim-sneak'
  use 'yuttie/comfortable-motion.vim'
  use 'airblade/vim-rooter'
  use 'tpope/vim-surround'
  use 'haya14busa/is.vim'
  use 'osyo-manga/vim-anzu'
  use 'rmagatti/auto-session'
	use 'editorconfig/editorconfig-vim'
	use 'christoomey/vim-tmux-navigator'
	use 'mustache/vim-mustache-handlebars'
	use 'windwp/nvim-autopairs'
	use 'kevinhwang91/nvim-hlslens'
	use 'tpope/vim-sleuth'

end)

