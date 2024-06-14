return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- local C = require("catppuccin.palettes").get_palette("frappe")
    -- local O = require("catppuccin").options

    -- local colors = {
    --   blue = "#65D1FF",
    --   green = "#3EFFDC",
    --   violet = "#FF61EF",
    --   yellow = "#FFDA7B",
    --   red = "#FF4A4A",
    --   fg = "#c3ccdc",
    --   bg = "#112638",
    --   inactive_bg = "#2c3043",
    -- }
    --
    -- local my_lualine_theme = {
    --   normal = {
    --     a = { bg = C.blue, fg = C.mantle, gui = "bold" },
    --     b = { bg = C.surface0, fg = C.blue },
    --     c = { bg = transparent_bg, fg = C.text },
    --   },
    --   insert = {
    --     a = { bg = C.green, fg = C.base, gui = "bold" },
    --     b = { bg = C.surface0, fg = C.green },
    --   },
    --   terminal = {
    --     a = { bg = C.green, fg = C.base, gui = "bold" },
    --     b = { bg = C.surface0, fg = C.green },
    --   },
    --   command = {
    --     a = { bg = C.peach, fg = C.base, gui = "bold" },
    --     b = { bg = C.surface0, fg = C.peach },
    --   },
    --   visual = {
    --     a = { bg = C.mauve, fg = C.base, gui = "bold" },
    --     b = { bg = C.surface0, fg = C.mauve },
    --   },
    --   replace = {
    --     a = { bg = C.red, fg = C.base, gui = "bold" },
    --     b = { bg = C.surface0, fg = C.red },
    --   },
    --   inactive = {
    --     a = { bg = transparent_bg, fg = C.blue },
    --     b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
    --     c = { bg = transparent_bg, fg = C.overlay0 },
    --   },
    -- }
    local colors = require("onedarkpro.helpers").get_colors("onedark")
    local config = require("onedarkpro.config").config

    local onedarkpro = {}

    onedarkpro.normal = {
      a = { bg = colors.green, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.green },
      c = { bg = config.options.lualine_transparency and colors.none or colors.bg_statusline, fg = colors.fg },
    }

    onedarkpro.insert = {
      a = { bg = colors.blue, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.blue },
    }

    onedarkpro.command = {
      a = { bg = colors.purple, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.purple },
    }

    onedarkpro.visual = {
      a = { bg = colors.yellow, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.yellow },
    }

    onedarkpro.replace = {
      a = { bg = colors.red, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.red },
    }

    local inactive_bg = config.options.highlight_inactive_windows and colors.color_column or colors.bg
    onedarkpro.inactive = {
      a = { bg = inactive_bg, fg = colors.blue },
      b = { bg = inactive_bg, fg = colors.fg_gutter_inactive, gui = "bold" },
      c = { bg = config.options.lualine_transparency and colors.none or inactive_bg, fg = colors.fg_gutter_inactive },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = onedarkpro,
        section_separators = { left = "", right = "" },
        component_separators = "",
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename", "branch" },
        lualine_c = {
          "%=", --[[ add your center compoentnts here in place of this comment ]]
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        -- lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      },
    })
  end,
}
