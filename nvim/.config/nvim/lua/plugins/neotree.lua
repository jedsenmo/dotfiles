-- Install NeoTree for file management
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- NeoTree setup
    vim.keymap.set('n', '<leader>ee', ':Neotree filesystem reveal left<CR>')
    close_if_last_window = false
  end
}
