require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {enable = true},
  indent = {enable = true},
  autotag = {enable = true},
  -- rainbow = {enable = true},
  -- context_commentstring = {enable = true},
}

