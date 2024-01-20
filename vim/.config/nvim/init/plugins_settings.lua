vim.opt.runtimepath:append(',~/.cache/dein/repos/github.com/neovim/lspconfig/')
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup{}
lspconfig.ccls.setup{}

vim.opt.runtimepath:append(',~/.cache/dein/repos/github.com/ms-jpq/coq_nvim/')
local coq = require "coq"

local servers = { 'ccls', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(coq.lsp_ensure_capabilities({
    -- on_attach = my_custom_on_attach,
  }))
end
