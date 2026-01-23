-- Catppuccin theme
require('catppuccin').setup({
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  transparent_background = false,
  term_colors = true,
  integrations = {
    cmp = true,
    mason = true,
    fzf = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
  }
})

vim.cmd.colorscheme "catppuccin"

require('dashboard').setup()
require('lualine').setup()
require('nvim-tree').setup()

require('nvim-treesitter').setup {
  ensure_installed = {
    "c",
    "cpp",
    "lua",
    "vim",
    "vimdoc",
    "query",
  },
  sync_install = true,
  auto_install = true,

  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 200 * 1024 -- 200 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false, -- safer; indent can be buggy / expensive
  },
  incremental_selection = {
    enable = false,
  },
  matchup = {
    enable = false,
  },
}

require('mason').setup()
require('mason-lspconfig').setup({
ensure_installed = { 'clangd' }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, 
require('cmp_nvim_lsp').default_capabilities())

local keymaps = function(client, bufnr)
local opts = { buffer = bufnr, noremap = true, silent = true }

vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
end

vim.lsp.config('clangd', {
capabilities = capabilities,
on_attach = keymaps,
cmd = {
  "clangd",
  "--background-index",
  "--header-insertion=never",
  "--completion-style=detailed",
  "--limit-results=500",
  "--limit-references=1000",
  "--clang-tidy=false",
},
filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
})

vim.lsp.enable('clangd')

vim.diagnostic.config({
virtual_text = { prefix = '?' },
signs = true,
update_in_insert = true,
})

local cmp = require('cmp')

cmp.setup({
mapping = cmp.mapping.preset.insert({
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping.select_next_item(),
  ['<S-Tab>'] = cmp.mapping.select_prev_item(),
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'buffer' },
  { name = 'path' },
})
})

vim.keymap.set('n', '<leader>ff', ':Files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', ':Rg<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { noremap = true, silent = true })
