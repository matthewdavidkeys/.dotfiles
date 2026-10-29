return {
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('diffview').setup {
        -- You can customize default diffview options here if needed
      }

      -- Keymap: View history of the CURRENT file (% represents current buffer)
      vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', {
        desc = '[G]it File [H]istory',
      })

      vim.keymap.set('v', '<leader>gh', ":'<,'>DiffviewFileHistory<CR>", {
        desc = '[G]it Range/Block [H]istory',
      })

      -- Keymap: Close any active diffview window quickly
      vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<CR>', {
        desc = '[G]it Diffview [C]lose',
      })
    end,
  },
}
