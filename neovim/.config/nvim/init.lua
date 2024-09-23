-- ~~~~~load plugins
require('config.lazy')

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

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'win32yank-wsl',
        copy = {
            ['+'] =  'win32yank.exe -i --crlf',
            ['*'] =  'win32yank.exe -i --crlf',
        },
        paste = {
            ['+'] = 'win32yank.exe -o --lf',
            ['*'] = 'win32yank.exe -o --lf',
        },
        cache_enabled = true,
    }
end


vim.api.nvim_create_user_command('WindowsCleaning','%s/\r/' , {})

-- source remaning vim configuration
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
