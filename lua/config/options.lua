local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
  signs = false,
  float = {
      border = "rounded",
  },
})
