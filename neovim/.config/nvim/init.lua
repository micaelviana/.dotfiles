local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    change_detection = { notify = false },
    checker = {
        enabled = false, -- automatically check for plugin updates
        notify = false, -- get a notification when new updates are found
    },

    spec = {
        -- add your plugins here
        {
            'neoclide/coc.nvim',
            branch = 'release',
        },
        {
            'numToStr/Comment.nvim',
            opts = {

            },
        },
        { "EdenEast/nightfox.nvim" }, -- lazy
        { "bluz71/vim-nightfly-colors", name = "nightfly" },
        {
            'sainnhe/sonokai',
            config = function()
                -- Optionally configure and load the colorscheme
                -- directly inside the plugin declaration.
                vim.g.sonokai_enable_italic = true
            end
        },
        { "rebelot/kanagawa.nvim", lazy = false,      priority = 1000 }, -- actual theme
        { "rose-pine/neovim",      name = "rose-pine" },
        {
            'sainnhe/everforest',
            config = function()
                -- Optionally configure and load the colorscheme
                -- directly inside the plugin declaration.
                vim.g.everforest_enable_italic = true
            end
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },

        {
            'smoka7/hop.nvim',
            version = "*",
            opts = {
                keys = 'etovxqpdygfblzhckisuran'
            }
        },
        {
            "ibhagwan/fzf-lua",
            -- optional for icon support
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                -- calling `setup` is optional for customization
                require("fzf-lua").setup({})
            end
        },

        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup {}
            end,
        },

        'https://github.com/nvim-pack/nvim-spectre',

        -- install with yarn or npm
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            build = "cd app && yarn install",
            init = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
            ft = { "markdown" },
        },
        'nvim-lua/plenary.nvim',
        "nvim-treesitter/nvim-treesitter",

        {
            'mg979/vim-visual-multi',
            branch = 'master',
        },
        'psliwka/vim-smoothie',
        'https://github.com/tpope/vim-fugitive',
        'https://github.com/haya14busa/is.vim',
        'https://github.com/honza/vim-snippets',
        'https://github.com/lambdalisue/vim-suda',
        {
            'nvimdev/dashboard-nvim',
            event = 'VimEnter',
            config = function()
                require('dashboard').setup {
                    -- config
                }
            end,
            dependencies = { { 'nvim-tree/nvim-web-devicons' } }
        },

        {
            "christoomey/vim-tmux-navigator",
            cmd = {
                "TmuxNavigateLeft",
                "TmuxNavigateDown",
                "TmuxNavigateUp",
                "TmuxNavigateRight",
                "TmuxNavigatePrevious",
            },
            keys = {
                { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
                { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
                { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
                { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
                { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
            },
        },


    }, --end mica
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "kanagawa" } },
    -- automatically check for plugin updates
})


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

vim.cmd('colorscheme kanagawa')
