local lspconfig = require'lspconfig'
local completion = require'completion'
local configs = require'lspconfig/configs'
local util = require'lspconfig/util'

DATA_PATH = vim.fn.stdpath('data')

local custom_on_attach = function()
  require'lsp_signature'.on_attach() -- TODO: Check. Looks like doesn't work
  completion.on_attach()
end

require'lspinstall'.setup()


-------------------------------------------------------------------
-- LSP install
-------------------------------------------------------------------
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
      on_attach=custom_on_attach,
    }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


-------------------------------------------------------------------
-- GENERAL
-------------------------------------------------------------------
local eslint = {
  lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}
local shellcheck = {
  LintCommand = 'shellcheck -f gcc -x',
  lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}
lspconfig.efm.setup {
  on_attach=custom_on_attach,
  filetypes = {"lua", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
  settings = {
    rootMakers = {".git/"},
    languages = {
      javascriptreact = {eslint},
      javascript = {eslint},
      typescript = {eslint},
      sh = {shellcheck},
    }
  }
}


-------------------------------------------------------------------
-- Ember
-------------------------------------------------------------------
configs.ember = {
  default_config = {
    cmd = {'/usr/local/lib/node_modules/@lifeart/ember-language-server/bin/ember-language-server.js', '--stdio'},
    filetypes = {'handlebars', 'html.handlebars'},
    root_dir = util.root_pattern('package.json', '.git')
  }
}
lspconfig.ember.setup {
  on_attach=custom_on_attach,
}

