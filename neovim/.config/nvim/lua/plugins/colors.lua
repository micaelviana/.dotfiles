local repo = "bluz71/vim-nightfly-colors"
local name = "nightfly"
return{
    { "EdenEast/nightfox.nvim",     lazy = true }, 
    { "bluz71/vim-nightfly-colors", name = "nightfly",   lazy = true },
    { 'sainnhe/sonokai',            lazy = true },
    { "rose-pine/neovim",           name = "rose-pine",  lazy = true },
    {'sainnhe/everforest',lazy = true,},
    { "rebelot/kanagawa.nvim", lazy = true },
    -- selected theme
    {repo, lazy = false , priority=1000, config=function()vim.cmd.colorscheme(name) end},
}
