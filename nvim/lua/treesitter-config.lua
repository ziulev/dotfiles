require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {enable = true},
  indent = {enable = true},
  autotag = {enable = true},
  context_commentstring = {
    enable = true,
    config = {
      -- ['html.handlebars'] = '{{!-- %s --}}'
      -- ['html.handlebars'] = {
      --   element = '{{!-- %s --}}',
      --   text_interpolation = '{{!-- %s --}}',
      -- },
    },
  }
  -- rainbow = {enable = true},
  -- context_commentstring = {enable = true},
}

