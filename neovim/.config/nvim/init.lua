-- =====LOAD PLUGINS
require('config.lazy')

-- ========GENERAL OPTIONS
local opt=vim.opt
opt.hidden=true
opt.confirm=true
opt.number=true
opt.relativenumber=true
opt.cursorline=true
opt.mouse="a"
opt.ignorecase=true
opt.splitright = true
opt.splitbelow = true
opt.inccommand = 'split'
opt.smartindent=true
opt.expandtab=true
opt.tabstop=4
opt.softtabstop=4
opt.shiftwidth=4
opt.signcolumn='yes'
opt.backspace="indent,eol,start"
opt.updatetime=300
opt.scrolloff=8
opt.termguicolors=true
opt.backup=false
opt.writebackup=false
opt.swapfile=false

--enable transparency in Vim if the terminal support it
--with Wezterm I can toggle transparency with a shortcut
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

--no longer need, install wl-clipboard
-- if vim.fn.has('wsl') == 1 then
--     vim.g.clipboard = {
--         name = 'win32yank-wsl',
--         copy = {
--             ['+'] =  'win32yank.exe -i --crlf',
--             ['*'] =  'win32yank.exe -i --crlf',
--         },
--         paste = {
--             ['+'] = 'win32yank.exe -o --lf',
--             ['*'] = 'win32yank.exe -o --lf',
--         },
--         cache_enabled = true,
--     }
-- end
--
-- COMMANDS
vim.api.nvim_create_user_command('WindowsCleaning','%s/\r/' , {})

-- ==========KEYMAPS
local keyset = vim.keymap.set

-- Set mapleader
vim.g.mapleader = " "

-- New lines
keyset('n', '<return>', 'o<esc>', { noremap = true })

-- Save and close
keyset('n', '<leader>w', ':w<cr>', { silent = true, noremap = true })
keyset('n', '<leader>q', ':xa<cr>', { silent = true, noremap = true })
keyset('n', '\\w', ':w<cr>', { silent = true, noremap = true })
keyset('n', '\\q', ':xa<cr>', { silent = true, noremap = true })
keyset('n', '\\z', ':xa<cr>', { silent = true, noremap = true })

-- Close without save
keyset('n', 'Q', ':qa!<cr>', { silent = true, noremap = true })

-- Make executable
keyset('n', '<space>x', ':!chmod +x %<cr>', { silent = true, noremap = true })

-- Paste in insert mode using Ctrl+V
keyset('i', '<c-v>', '<esc>pa', { noremap = true })

-- Go to normal mode
keyset('n', 's', ':', { noremap = true })
keyset('v', 's', ':', { noremap = true })

-- Select all
keyset('n', '\\a', 'ggVG', { noremap = true })

-- Increment/decrement
keyset('n', '+', '<c-a>', { noremap = true })
keyset('n', '-', '<c-x>', { noremap = true })

-- Replace selected content faster
keyset('n', '(', ':%s///g<left><left>', { noremap = true })

-- Map Ctrl-Backspace to delete the previous word in insert mode
keyset('i', '<c-bs>', '<c-w>', { noremap = true })
keyset('i', '<c-h>', '<c-w>', { noremap = true })

-- Prevent x from overriding what's in the clipboard
keyset('n', 'x', '"_x', { noremap = true })
keyset('n', 'X', '"_x', { noremap = true })
keyset('n', '<del>', '"_x', { noremap = true })

-- =================AUTOCOMMANDS
-- Highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch' }
  end,
})

-- FUNCTIONS
-- Function to change the working directory to the directory of the current file
local function ChangeCurrentDirectory()
  vim.cmd('lcd %:p:h')
  vim.cmd('pwd')
end

-- Keymap to call the function
vim.keymap.set('n', '<space>z', ChangeCurrentDirectory, { noremap = true })
