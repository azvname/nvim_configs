-----------------------------------------------------------
-- Импорт модулей Lua
-----------------------------------------------------------
require('plugins')
require('settings') 
require('keymaps')
require('treesitter')
require('bufferline-config') -- tabline




-- nmap <leader>j :NERDTreeToggle<CR>
-- nmap <leader>k :NERDTreeFocus<CR>

vim.api.nvim_set_keymap('n', '<leader>j', ':NvimTreeToggle<cr>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader>j', ':NvimTreeFocus<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('', '&', 'O<esc>', {noremap = true, silent = true })


-- vim.diagnostic.config({ virtual_text = false })







-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--     vim.diagnostic.config({ virtual_text = false })
--   end,
-- })


vim.defer_fn(function()
  -- vim.diagnostic.config({ virtual_text = false })
  vim.cmd(":NvimTreeFocus");
end, 1000) 

-- vim.defer_fn(function()
--   -- vim.diagnostic.config({ virtual_text = false })
--   vim.cmd("source ~/learn_cilang.session");
-- end, 3000) 

vim.diagnostic.config({
	signs=false,
	underline=false,
	virtual_text=false,
	update_in_insert=false,
	severity_sort=false
})

-- disable the diagnostic message bitch
vim.g.ale_virtualtext_cursor = 'disabled' -- || 0 - disabled, 1 - current, 2 - all




-- autocmd BufEnter * lua vim.diagnostic.config({virtual_text=false})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--     vim.diagnostic.config({ virtual_text = false })
--   end,
-- })


-- vim.diagnostic.set(ns, 0, diagnostics, { virtual_text = false })





-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = "*",
--   callback = function()
--     vim.diagnostic.config({ virtual_text = false })
--   end,
-- })







--
--
--
--
-- vim.diagnostic.config({
--   virtual_text=false,
--   float={
--     source="always",
--   },
--   severity_sort=true,
--
-- })
--
--
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
-- })

-- vim.diagnostic.config {
--   virtual_text = false,
--   signs = false,
--   underline = false,
-- }



vim.opt.termguicolors = true



vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
-- vim.cmd [[ colorscheme tender ]]
-- vim.cmd [[ colorscheme PaperColor ]]
-- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd.colorscheme "catppuccin"
-- vim.cmd([[colorscheme catppuccin]])




-- vim.cmd('set keymap=russian-jcukenwin')
-- vim.cmd('set iminsert=0')
-- vim.cmd('set imsearch=0')

vim.cmd [[ set keymap=russian-jcukenwin ]]
vim.cmd [[ set iminsert=0 ]]
vim.cmd [[ set imsearch=0 ]]

vim.cmd [[ set foldenable ]]


-- " Устанавливаем ширину табуляции в 2 пробела
vim.cmd [[ set tabstop=2 ]]

-- " Устанавливаем ширину отступа в 2 пробела
vim.cmd [[ set shiftwidth=2 ]]

-- " Преобразуем табуляции в пробелы
vim.cmd [[ set expandtab ]]

-- " Автоматически делаем отступ при создании новой строки
vim.cmd [[ set autoindent ]]


vim.cmd [[ set nu rnu ]]

-- require'lspconfig'.clangd.setup{}


-- vim.diagnostic.config({virtual_text=false})
-- vim.cmd [[ mksession file.session ]]
-- vim.cmd [[ source ~/file.session ]]
-- vim.cmd [[ set foldenable=syntax ]]

-- require'lspconfig'.pyright.setup{}
-- local clangd = require('lspconfig')






--vim.lsp.inlay_hint.enable(false)












-- require'lspconfig'.lua_ls.setup {}




-- local nvim_lsp = require('lspconfig')
-- local servers = {
--   'clangd'
-- }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     handlers = {['textDocument/publishDiagnostics'] = function(...) end  }
-- }
-- end

-- local nvim_lsp = require('lspconfig')
-- local servers = {
--     'clangd'
-- }
-- for _, lsp in ipairs(servers) do
--     nvim_lsp[lsp].setup {
--         handlers = {['textdocument/publishdiagnostics'] = function(...) end  }
--     }
-- end




-- initializationOptions.clangd["clang-tidy"] = false

-- vim.diagnostic.hide();
--
--
-- vim.diagnostic.config()
--
--
-- vim.diagnostic.hide(namespace, bufrn)
--
-- vim.diagnostic.show()
-- vim.diagnostic.disable(0)

-- vim.diagnostic.config({
--
--
-- })



-- Lua.diagnostics.disable



-- Define local variables
-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd
-- local user_cmd = vim.api.nvim_create_user_command
--
-- augroup('lsp_disable_diagnostic', { clear = true })
--
-- autocmd('BufEnter', {
--   group = 'lsp_disable_diagnostic',
--   pattern = '*',
--   command = 'lua vim.diagnostic.disable()',
--   desc = 'Disable diagnostic for a while',
-- })
--

-- autocmd CursorHold * lua vim.diagnostic.open_float({focusable=false, scope="cursor"})











--vim.diagnostic.severity.HINT



-- vim.diagnostic.set()
-- vim.api.diagnostic.disable()

-- vim.cmd [[ vim.diagnostic.disable() ]]




-- require'lspconfig'.emmet_ls.setup{}
-- require'lspconfig'.html.setup{}
-- require'lspconfig'.volar.setup{}
-- require 'lspconfig'.quick_lint_js.setup{}
-- require'lspconfig'.eslint.setup{}
--require'lspconfig'.tsserver.setup{}
-- require('hardline').setup {}

-- local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- local rt = require("rust-tools")
-- rt.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
-- })
-- require'lspconfig'.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }





-- require('lspconfig').arduino_language_server.setup {}
-- Mason Setup
-- require("mason").setup({
--     ui = {
--         icons = {
--             package_installed = "",
--             package_pending = "",
--             package_uninstalled = "",
--         },
--     }
-- })
-- require("mason-lspconfig").setup()











-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
-- 
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<space>f', function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
--   end,
-- })





--require'lspconfig'.html.setup{}
--require'lspconfig'.pylsp.setup{}














