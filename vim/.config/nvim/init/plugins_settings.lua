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

vim.opt.runtimepath:append(',~/.cache/dein/repos/github.com/nvim-treesitter/nvim-treesitter/')
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "rust" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = false,
  },
}
