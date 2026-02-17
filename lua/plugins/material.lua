return {
  'marko-cerovac/material.nvim',
  config = function()
    vim.g.material_style = "deep ocean"
    
    require('material').setup({
      contrast = {
        terminal = false,
        sidebars = true,
        floating_windows = true,
        cursor_line = false,
        non_current_windows = false,
      },
      
      styles = {
        comments = { italic = true },
        keywords = { bold = false },
        functions = {},
        variables = {},
      },
      
      plugins = {
        "telescope",
        "nvim-cmp",
        "nvim-tree",
        "which-key",
      },
    })
  end
}
