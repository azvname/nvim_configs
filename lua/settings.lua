local opt = vim.opt

-----------------------------------------------------------
-- ОБЩИЕ ОПЦИИ
-----------------------------------------------------------
opt.mouse = 'a'        --Включить мышь
opt.encoding = 'utf-8' --Кодировка
opt.showcmd = true     --Отображение команд
vim.cmd([[
filetype indent plugin on
syntax enable
]])
opt.swapfile = false --Не создаем свап файлы

-----------------------------------------------------------
-- ВИЗУАЛЬНЫЕ ОПЦИИ
-----------------------------------------------------------
opt.number = true --Номер строк сбоку
opt.wrap = true       --Длинные линии будет видно
opt.expandtab = true --???
opt.tabstop = 2       --1 tab = 4 пробела
opt.smartindent = true
opt.shiftwidth = 2    --Смещаем на 4 пробела

-- 2 spaces for selected filetypes
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]

opt.so = 0               --Отступ курсора от края экрана

opt.foldcolumn = '2'     --Ширина колонки для фолдов
-- opt.colorcolumn = '119'  --Расположение цветной колонки

-- remove line lenght marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

opt.cursorline = true -- Подсветка строки с курсором


-- vim.api.nvim_create_autocmd('ColorScheme', {
--   -- command = [[highlight CursorLine guibg=NONE cterm=underline]]
--   command = [[highlight CursorLine guibg=F8F8F0 cterm=F8F8F0]]
-- })

-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
vim.g.tagbar_compact = 0
vim.g.tagbar_sort = 0

-----------------------------------------------------------
-- НАСТРОЙКИ ПОИСКА
-----------------------------------------------------------
-- Будет игнорировать размер букв при поиске
opt.ignorecase = true --Игнорировать размер букв
opt.smartcase = true  --Игнор прописных букв

-----------------------------------------------------------
-- ПОЛЕЗНЫЕ ФИШКИ
-----------------------------------------------------------
-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
augroup end
]], false)

-----------------------------------------------------------
-- НАСТРОЙКИ ПЛАГИНОВ
-----------------------------------------------------------
-- LSP settings
-- LSP settings
-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
--     if server.name == "sumneko_lua" then
--         -- only apply these settings for the "sumneko_lua" server
--         opts.settings = {
--             Lua = {
--                 diagnostics = {
--                     -- Get the language server to recognize the 'vim', 'use' global
--                     globals = {'vim', 'use'},
--                 },
--                 workspace = {
--                     -- Make the server aware of Neovim runtime files
--                     library = vim.api.nvim_get_runtime_file("", true),
--                 },
--                 -- Do not send telemetry data containing a randomized but unique identifier
--                 telemetry = {
--                     enable = false,
--                 },
--             },
--         }
--     end
--     server:setup(opts)
-- end)




---- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'

local luasnip = require 'luasnip'

local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'luasnip' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
              -- path = 'p',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})










-- -- The following example advertise capabilities to `clangd`.
-- require'lspconfig'.clangd.setup {
--   capabilities = capabilities,
-- }
--




-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- 
-- luasnip setup
-- nvim-cmp setup
-- local cmp = require 'cmp'
-- cmp.setup {
--     snippet = {
--         expand = function(args)
--             luasnip.lsp_expand(args.body)
--         end,
--     },
--     sources = {
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--         { name = 'path' },
--         { name = 'buffer', option = {
--             get_bufnrs = function()
--                 return vim.api.nvim_list_bufs()
--             end
--         },
--         },
--     },
-- }






require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- vim.opt.termguicolors = false


-- require('hardline').setup {}








-- require('nvim-cursorline').setup {
--   cursorline = {
--     enable = true,
--     timeout = 500,
--     number = false,
--   },
--   cursorword = {
--     enable = true,
--     min_length = 3,
--     hl = { underline = true },
--   }
-- }




-- local luasnip = require("luasnip")
-- local cmp = require("cmp")

-- opts.mapping = vim.tbl_extend("force", opts.mapping, {
-- 	["<CR>"] = cmp.config.disable,
-- 	["<Tab>"] = cmp.mapping.confirm({ select = true }),
-- 	["<Ctr-n>"] = cmp.mapping(function(fallback)
-- 		if cmp.visible() then
-- 			cmp.select_next_item()
-- 			-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
-- 			-- this way you will only jump inside the snippet region
-- 		elseif luasnip.expand_or_jumpable() then
-- 			luasnip.expand_or_jump()
-- 		elseif has_words_before() then
-- 			cmp.complete()
-- 		else
-- 			fallback()
-- 		end
-- 	end, { "i", "s" }),
-- 	["<Ctr-p>"] = cmp.mapping(function(fallback)
-- 		if cmp.visible() then
-- 			cmp.select_prev_item()
-- 		elseif luasnip.jumpable(-1) then
-- 			luasnip.jump(-1)
-- 		else
-- 			fallback()
-- 		end
-- 	end, { "i", "s" }),
-- })





