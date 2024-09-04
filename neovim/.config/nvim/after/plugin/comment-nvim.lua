require('Comment').setup()
local ft = require('Comment.ft')

--tackling the antlr problem
vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  pattern = "*.g",
  command = "set filetype=antlr"
})

ft.antlr = '//%s'
