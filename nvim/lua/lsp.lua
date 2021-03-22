local lspconfig = require'lspconfig'
local completion = require'completion'
local configs = require'lspconfig/configs'
local util = require'lspconfig/util'

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
  on_attach=completion.on_attach,
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
-- Flow
-------------------------------------------------------------------
lspconfig.flow.setup {
  on_attach=completion.on_attach,
}

-------------------------------------------------------------------
-- HTML
-------------------------------------------------------------------
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach=completion.on_attach,
}

-------------------------------------------------------------------
-- javascript, typescript
-------------------------------------------------------------------
lspconfig.tsserver.setup {
  on_attach=completion.on_attach,
  settings = {documentFormatting = false}
}

-------------------------------------------------------------------
-- CSS
-------------------------------------------------------------------
lspconfig.cssls.setup {
  on_attach=completion.on_attach,
}

-------------------------------------------------------------------
-- JSON
-------------------------------------------------------------------
-- npm install -g vscode-json-languageserver
lspconfig.jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  },
  on_attach=completion.on_attach,
}

-------------------------------------------------------------------
-- VIM
-------------------------------------------------------------------
-- npm install -g vim-language-server
lspconfig.vimls.setup {
  on_attach=completion.on_attach,
}

-------------------------------------------------------------------
-- Ember
-------------------------------------------------------------------
configs.els = {
  default_config = {
    cmd = {'ember-language-server', '--stdio'},
    filetypes = {'handlebars', 'html.handlebars'},
    root_dir = util.root_pattern('package.json', '.git')
  }
}
lspconfig.els.setup {
  on_attach = completion.on_attach,
}


-------------------------------------------------------------------
-- Ember
-------------------------------------------------------------------
-- npm install -g yaml-language-server
lspconfig.yamlls.setup{
  -- on_attach = require'lsp'.common_on_attach,
}

