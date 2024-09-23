return{
    -- define a theme: {user/repo, lazy=false, priority=1000, vim.cmd.colorscheme('name')}
    { "EdenEast/nightfox.nvim",     lazy = true }, -- lazy
    { "bluz71/vim-nightfly-colors", name = "nightfly",   lazy = true },
    { 'sainnhe/sonokai',            lazy = true },
    { "rebelot/kanagawa.nvim",      lazy = true },
    { "rose-pine/neovim",           name = "rose-pine",  lazy = true },
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.everforest_enable_italic = true
            vim.cmd.colorscheme('everforest')
        end
    },
}
