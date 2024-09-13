-- Install obscure Theme
return {
  'killitar/obscure.nvim',
  priority = 1000,
  config = function()
    require('obscure').setup({
      transparent = true,
    })
    -- Set Color Scheme
    vim.cmd.colorscheme('obscure')
  end
}

