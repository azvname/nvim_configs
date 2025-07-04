-- local bufferline = require("bufferline")
-- bufferline.setup {
--   options={
--     mode="tabs",
--
--     -- separator_style = "slant" or "padded_slant",
--     separator_style = "none",
--   }
-- }
local bufferline = require('bufferline')
bufferline.setup({
    options = {
        -- mode = "buffers",
        -- mode = "tabs",
        -- style_preset = bufferline.style_preset.minimal,
        -- indicator = {
        --     icon = ' ', -- '▎', -- this should be omitted if indicator style is not 'icon'
        --     style = 'none'  -- 'icon' -- | 'underline' | 'none',
        -- },
        -- color_icons = false,
        -- show_buffer_icon = false,
        -- buffer_close_icon = '',
        -- numbers = function(opts)
        --   return string.format('%s·%s', opts.raise(opts.raise), opts.lower(opts.ordinal))
        -- end,
        -- separator_style = "thick",
        -- elements = {
        --     {id = 1, name = "hi.txt", path = "/tmp/folder/hi.txt"},
        --     -- and so on for all open buffers
        -- },
        -- or you can combine these e.g.
        style_preset = {
            bufferline.style_preset.no_italic,
            bufferline.style_preset.no_bold
        },
    }
})

vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext <cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev <cr>', {noremap = true, silent = true})
