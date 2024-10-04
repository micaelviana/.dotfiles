return{
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    opts = {
        theme = 'doom',
        config = {
            -- Set header
            header = {
                "                                                     ",
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            },
            center = {
                {
                    icon = '  ',
                    desc = 'New File',
                    key = 'n',
                    keymap = ':enew',
                    action = 'enew'
                },
                {
                    icon = ' 󰁯 ',
                    desc = 'Recent Files',
                    key = 'r',
                    keymap = 'Ctrl r',
                    action = 'FzfLua oldfiles'
                },
                {
                    icon = '  ',
                    desc = 'Find Files',
                    key = 'f',
                    keymap = 'Ctrl p',
                    action = 'FzfLua files'
                },
                {
                    icon = ' 󰗊 ',
                    desc = 'Grep term',
                    key = 'g',
                    keymap = 'tg',
                    action = 'FzfLua live_grep'
                },
                {
                    icon = ' 󰜎 ',
                    desc = 'Quit neovim',
                    key = 'q',
                    keymap = '<space>q',
                    action = 'quit'
                }
            },
            footer = {}
        }
    }--end opts

} -- end table
