local lspconfig = require'lspconfig'
local completion = require'completion'
local configs = require'lspconfig/configs'
local util = require'lspconfig/util'

lspconfig.flow.setup{
  on_attach=completion.on_attach,
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach=completion.on_attach,
}

-- require'lspconfig'.tsserver.setup{}
lspconfig.tsserver.setup{
  on_attach=completion.on_attach,
}

lspconfig.cssls.setup{
  on_attach=completion.on_attach,
}

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

lspconfig.vimls.setup{
  on_attach=completion.on_attach,
}

-- Add custom entry for Ember Language Server
configs.els = {
  default_config = {
    cmd = {'ember-language-server', '--stdio'},
    filetypes = {'handlebars', 'html.handlebars'},
    root_dir = util.root_pattern('package.json', '.git')
  }
}
-- Ember Language Server
lspconfig.els.setup {
  on_attach = completion.on_attach,
}

