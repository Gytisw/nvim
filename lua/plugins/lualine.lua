return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        theme = 'tokyonight'
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename', 'filetype'},
        lualine_x = {'encoding', 'fileformat', 'filesize'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      }
    })
  end
}
