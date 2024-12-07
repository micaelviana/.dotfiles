return{
    -- define a theme: {user/repo, lazy=false, priority=1000, config=function()vim.cmd.colorscheme('name')end}
    { "EdenEast/nightfox.nvim",     lazy = true }, -- lazy
    { "bluz71/vim-nightfly-colors", name = "nightfly",   lazy = true },
    { 'sainnhe/sonokai',            lazy = true },
    { "rose-pine/neovim",           name = "rose-pine",  lazy = true },
    {'sainnhe/everforest',lazy = true,},
    { "rebelot/kanagawa.nvim", lazy = false , priority=1000, config=function()vim.cmd.colorscheme('kanagawa') end},
}
