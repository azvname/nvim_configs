local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
-----------------------------------------------------------
-- НАВИГАЦИЯ
-----------------------------------------------------------


-- Отключаем стрелочки в Нормальном Режиме. Хардкор!
--map('', '<up>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
--map('', '<down>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
--map('', '<left>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
--map('', '<right>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
--map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
--map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
-- <F5> разные вариации нумераций строк, можно переключаться на ходу
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)

-- Выход
map('n', '<leader>q', ':q!<cr>', default_opts)
-- Сохранить
map('n', '<leader>w', ':w<cr>', default_opts)
-----------------------------------------------------------
-- РЕЖИМЫ
-----------------------------------------------------------
-- Выходим в нормальный режим через <jk>, чтобы не тянуться
-- map('i', 'jk', '<Esc>', {noremap = true})
-----------------------------------------------------------
-- ПОИСК
-----------------------------------------------------------
-- Выключить подсветку поиска через комбинацию ,+<space>
map('n', ',<space>', ':nohlsearch<CR>', {noremap = true})
-- Fuzzy Search. CTRL+a для поиска по файлам, CTRL+p для поиска по буфферам
--map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
--map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)
-- <S-F5> Греповский поиск слова под курсором
--map('n', '<S-F5>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Греповский поиск слова в модальном окошке
--map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-----------------------------------------------------------
-- ФАЙЛЫ
-----------------------------------------------------------
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)
-- <F4> Дерево файлов. Для иконок следует установить Nerd Font
map('n', '<F4>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)


-- inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})

-- Функция для переключения на русскую раскладку
function SetRussianKeymap()
  vim.cmd('set keymap=russian-jcukenwin')
  vim.cmd('set iminsert=1')
  vim.cmd('set imsearch=1')
  print("Switched to language keymap")
end

-- Функция для переключения на английскую раскладку
function ToggleKeymap()
	-- print(vim.o.keymap)
	if vim.o.keymap == "" then
		vim.cmd('set keymap=russian-jcukenwin')
		vim.cmd('set iminsert=1')
		vim.cmd('set imsearch=1')
		print("Switched to Russian keymap")
	else

		vim.cmd('set keymap=')
		vim.cmd('set iminsert=0')
		vim.cmd('set imsearch=0')
		print("Switched to English keymap")
	end
	-- print(vim.o.keymap)
end




local mytmp = 0
function ToggleDiagnostics() 
  if mytmp == 1 then
    -- vim.cmd('mytmp=0')
    mytmp = 0
    vim.g.ale_virtualtext_cursor = 'disabled' -- || 0 - disabled, 1 - current, 2 - all
    -- vim.diagnostic.config({ virtual_text = false })
    vim.diagnostic.config({
      signs=false,
      underline=false,
      virtual_text=false,
      update_in_insert=false,
      severity_sort=false
    })

    print("Diagnostc is disabled")
  else
    mytmp = 1
    vim.g.ale_virtualtext_cursor = 'current' 
    -- vim.diagnostic.config({ virtual_text = true })
    vim.diagnostic.config({
      signs=true,
      underline=false,
      virtual_text=true,
      update_in_insert=false,
      severity_sort=false
    })

    print("Diagnostc is active in the current line")
  end
  

end


vim.api.nvim_set_keymap('n', '<leader>k', ':lua ToggleDiagnostics()<CR>', { noremap = true, silent = true })


-- Сочетание клавиш для переключения на русскую раскладку
-- vim.api.nvim_set_keymap('n', '<leader>kr', ':lua SetRussianKeymap()<CR>', { noremap = true, silent = true })

-- Сочетание клавиш для переключения на английскую раскладку
-- vim.api.nvim_set_keymap('n', '<leader>ke', ':lua SetEnglishKeymap()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':lua ToggleKeymap()<CR>', { noremap = true, silent = true } )


vim.api.nvim_set_keymap('n', '<leader>1', ':source ~/settings.sessings<CR>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('n', '<leader>2', ':source ~/learn_cilang.session<CR>', { noremap = true, silent = true } )
-- vim.api.nvim_set_keymap('n', '<leader>3', ':source ~/code/.session<CR>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('n', '<leader>4', ':source ~/ccpp.session<CR>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('n', '<leader>5', ':source ~/fasm.session|set filetype=fasm<CR>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('n', '<leader>6', ':source ~/tasm.session<CR>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('n', '<leader>c', ':%bd<CR>', { noremap = true, silent = true } )



-- Откроем заголовочный файл под курсором
function open_header_file()
    local word = vim.fn.expand("<cfile>")
    if vim.fn.filereadable(word) == 1 then
        vim.cmd("edit " .. word)
    else
        -- Попробуем найти файл в системных директориях заголовков
        local paths = vim.split(vim.o.path, ',')
        for _, path in ipairs(paths) do
            local fullpath = path .. '/' .. word
            if vim.fn.filereadable(fullpath) == 1 then
                vim.cmd("edit " .. fullpath)
                return
            end
        end
        print("File not found: " .. word)
    end
end

-- function open_header_file()
--     local word = vim.fn.expand("<cfile>")
--     if vim.fn.filereadable(word) == 1 then
--         vim.cmd("edit " .. word)
--     else
--         print("File not found: " .. word)
--     end
-- end

-- Настройка пользовательского хоткея (например, Ctrl-h)
vim.api.nvim_set_keymap('n', '<C-h>', ':lua open_header_file()<CR>', { noremap = true, silent = true })
