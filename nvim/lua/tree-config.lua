local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.g.nvim_tree_side = "right"
vim.g.nvim_tree_ignore = { '.git', '.cache' }
vim.g.nvim_tree_disable_netrw = 0 --"1 by default, disables netrw
vim.g.nvim_tree_indent_markers = 1 --"0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_follow = 1 --"0 by default, this option allows the cursor to be updated when entering a buffer
-- vim.g.nvim_tree_auto_close = 1 --0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = 'startify' --"empty by default, don't auto open tree on specific filetypes.
-- vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.cmd('highlight default NvimTreeIndentMarker guibg=NONE guifg=#333842')
vim.cmd('highlight default NvimTreeFolderName guibg=NONE guifg=#abb2bf')
vim.cmd('highlight default NvimTreeRootFolder guibg=NONE guifg=#282c34')
-- Git files colors
vim.cmd('highlight default NvimTreeFileDirty guibg=NONE guifg=#ff9800')
vim.cmd('highlight default NvimTreeFileStaged guibg=NONE guifg=#ffffff')
vim.cmd('highlight default NvimTreeFileMerge guibg=NONE guifg=#9c27b0')
vim.cmd('highlight default NvimTreeFileNew guibg=NONE guifg=#4caf50')
vim.cmd('highlight default NvimTreeFileRenamed guibg=NONE guifg=#fff000')
-- Git folters colors
vim.cmd('highlight default NvimTreeGitDirty guibg=NONE guifg=#ff9800')
vim.cmd('highlight default NvimTreeGitStaged guibg=NONE guifg=#ffffff')
vim.cmd('highlight default NvimTreeGitMerge guibg=NONE guifg=#9c27b0')
vim.cmd('highlight default NvimTreeGitNew guibg=NONE guifg=#4caf50')
vim.cmd('highlight default NvimTreeGitRenamed guibg=NONE guifg=#fff000')

-- Theme changes
vim.cmd('highlight default EndOfBuffer guibg=NONE guifg=#282c34')
vim.cmd('highlight default CursorLine guibg=#000000 guifg=#fff000')
vim.cmd('highlight default Directory guibg=#000000 guifg=#fff000')

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "✗"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}
vim.g.nvim_tree_bindings = {
  ["<CR>"] = ":YourVimFunction()<cr>",
  ["u"] = ":lua require'some_module'.some_function()<cr>",

  -- default mappings
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("edit"),
  ["l"]              = tree_cb("edit"),
  ["h"]              = tree_cb("edit"),
  ["<2-LeftMouse>"]  = tree_cb("edit"),
  ["<2-RightMouse>"] = tree_cb("cd"),
  ["<C-]>"]          = tree_cb("cd"),
  ["<C-v>"]          = tree_cb("vsplit"),
  ["<C-x>"]          = tree_cb("split"),
  ["<C-t>"]          = tree_cb("tabnew"),
  ["<BS>"]           = tree_cb("close_node"),
  ["<S-CR>"]         = tree_cb("close_node"),
  ["<Tab>"]          = tree_cb("preview"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["<C-r>"]          = tree_cb("full_rename"),
  ["x"]              = tree_cb("cut"),
  ["c"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["[c"]             = tree_cb("prev_git_item"),
  ["]c"]             = tree_cb("next_git_item"),
  ["-"]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
  ["<esc>"]              = tree_cb("close"),
}
