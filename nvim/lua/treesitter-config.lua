-- npm install -g tree-sitter-cli
require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },

  -- refactor = {
  --   navigation = {
  --     enable = true,
  --     keymaps = {
  --       goto_definition = "<leader>nd",
  --       list_definitions = "gnD",
  --       list_definitions_toc = "gO",
  --       goto_next_usage = "<a-*>",
  --       goto_previous_usage = "<a-#>",
  --     },
  --   },
  -- },
    -- indent = {
    --   enable = true
    -- }
    -- playground = {
    --     enable = true,
    --     disable = {},
    --     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    --     persist_queries = false -- Whether the query persists across vim sessions
    -- },
    -- autotag = {enable = true},
    -- rainbow = {enable = true}
    -- refactor = {highlight_definitions = {enable = true}} }

