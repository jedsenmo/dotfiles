-- Install TreeSitter for syntax
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    -- TreeSitter setup
    local configs = require 'nvim-treesitter.configs'
    configs.setup {
      ensure_installed = { 'c', 'lua', 'python', 'java' },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
