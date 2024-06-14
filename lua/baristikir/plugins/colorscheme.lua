return {
  "olimorris/onedarkpro.nvim",
  -- name = "catppuccin",
  priority = 1000,
  -- config = function()
  --   require("catppuccin").setup({
  --     transparent_background = true,
  --     highlight_overrides = {
  --       frappe = function(frappe)
  --         return {
  --           LineNr = { fg = frappe.overlay0 },
  --         }
  --       end,
  --     },
  --   })
  --   vim.cmd("colorscheme catppuccin-macchiato")
  -- end,
  config = function()
    require("onedarkpro").setup({
      styles = {
        methods = "bold",
      },
      colors = {
        dark = {
          codeblock = "require('onedarkpro.helpers').lighten('bg', 2, 'onedark')",
          statusline_bg = "#2e323b", -- gray
          statuscolumn_border = "#4b5160", -- gray
          ellipsis = "#808080", -- gray
          telescope_prompt = "require('onedarkpro.helpers').darken('bg', 1, 'onedark')",
          telescope_results = "require('onedarkpro.helpers').darken('bg', 4, 'onedark')",
          telescope_preview = "require('onedarkpro.helpers').darken('bg', 6, 'onedark')",
          telescope_selection = "require('onedarkpro.helpers').darken('bg', 8, 'onedark')",
          copilot = "require('onedarkpro.helpers').darken('gray', 8, 'onedark')",
          breadcrumbs = "require('onedarkpro.helpers').darken('gray', 10, 'onedark')",
          local_highlight = "require('onedarkpro.helpers').lighten('bg', 4, 'onedark')",
          light_gray = "require('onedarkpro.helpers').darken('gray', 7, 'onedark')",
        },
      },
      highlights = {
        CodeCompanionTokens = { fg = "${gray}", italic = true },
        CodeCompanionVirtualText = { fg = "${gray}", italic = true },

        ["@markup.raw.block.markdown"] = { bg = "${codeblock}" },
        ["@markup.quote.markdown"] = { italic = true, extend = true },

        EdgyNormal = { bg = "${bg}" },
        EdgyTitle = { fg = "${purple}", bold = true },

        EyelinerPrimary = { fg = "${green}" },
        EyelinerSecondary = { fg = "${blue}" },

        NormalFloat = { bg = "${bg}" }, -- Set the terminal background to be the same as the editor
        FloatBorder = { fg = "${gray}", bg = "${bg}" },

        CursorLineNr = { bg = "${bg}", fg = "${fg}", italic = true },
        DiffChange = { underline = true }, -- diff mode: Changed line |diff.txt|
        LocalHighlight = { bg = "${local_highlight}" },
        MatchParen = { fg = "${cyan}" },
        ModeMsg = { fg = "${gray}" }, -- Make command line text lighter
        Search = { bg = "${selection}", fg = "${yellow}", underline = true },
        VimLogo = { fg = { dark = "#81b766", light = "#029632" } },

        -- Alpha
        AlphaHeader = {
          fg = { dark = "${green}", light = "${red}" },
        },
        AlphaButtonText = {
          fg = "${blue}",
          bold = true,
        },
        AlphaButtonShortcut = {
          fg = { dark = "${green}", light = "${yellow}" },
          italic = true,
        },
        AlphaFooter = { fg = "${gray}", italic = true },

        -- Cmp
        CmpItemAbbrMatch = { fg = "${blue}", bold = true },
        CmpItemAbbrMatchFuzzy = { fg = "${blue}", underline = true },

        -- Telescope
        TelescopeBorder = {
          fg = "${telescope_results}",
          bg = "${telescope_results}",
        },
        TelescopePromptBorder = {
          fg = "${telescope_prompt}",
          bg = "${telescope_prompt}",
        },
        TelescopePromptCounter = { fg = "${fg}" },
        TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
        TelescopePromptPrefix = {
          fg = "${purple}",
          bg = "${telescope_prompt}",
        },
        TelescopePromptTitle = {
          fg = "${telescope_prompt}",
          bg = "${purple}",
        },
        TelescopePreviewTitle = {
          fg = "${telescope_results}",
          bg = "${green}",
        },
        TelescopeResultsTitle = {
          fg = "${telescope_results}",
          bg = "${telescope_results}",
        },
        TelescopeMatching = { fg = "${blue}" },
        TelescopeNormal = { bg = "${telescope_results}" },
        TelescopeSelection = { bg = "${telescope_selection}" },
        TelescopePreviewNormal = { bg = "${telescope_preview}" },
        TelescopePreviewBorder = { fg = "${telescope_preview}", bg = "${telescope_preview}" },
      },
      plugins = {
        treesitter = false,
        trouble = false,
        which_key = false,
        nvim_tree = false,
        gitsigns = false,
      },
      options = {
        lualine_transparency = true,
        transparency = true,
        cursourline = true,
      },
    })
    vim.cmd("colorscheme onedark")
  end,
}
