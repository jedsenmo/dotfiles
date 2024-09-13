return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  config = function()
    vim.fn['mkdp#util#install']()

    -- vim.keymap.set('n', '<leader>', ':MarkdownPreview<CR>', {})
    -- vim.keymap.set('n', '<leader>', ':MarkdownPreviewStop<CR>', {})
  end,
}
