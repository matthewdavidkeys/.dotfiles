return {
  -- Visual sign indicators in the gutter (added, modified, deleted)
  -- {
  --   'lewis6991/gitsigns.nvim',
  --   config = function()
  --     require('gitsigns').setup()
  --   end,
  -- },
  -- VS Code style Git control center panel
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - for diff visualization
      'nvim-telescope/telescope.nvim', -- optional
      'sindrets/diffview.nvim',
    },
    opts = {
      integrations = {
        diffview = true,
      }
    },
    config = true,
  },
}
