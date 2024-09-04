 require('ibl').setup({
    exclude = {
      filetypes = {
        'lspinfo',
        'packer',
        'checkhealth',
        'help',
        'man',
        'dashboard',
        '',
      },
      -- filetypes = vim.g.exclude_filetypes,
    },
    indent = { char = "┊" },
  })
