-- Install Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true

vim.keymap.set('n', '<leader>]', ':tabnext<CR>', {})

-- Options
local opts = {}

-- vim requirements
require("vim-options")

-- Lazy requirements
require("lazy").setup("plugins")
