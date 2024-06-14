return {
  "stevearc/aerial.nvim", -- Toggled list of classes, methods etc in current file
  opts = {
    attach_mode = "global",
    close_on_select = true,
    layout = {
      min_width = 30,
      default_direction = "prefer_right",
    },
    -- Use nvim-navic icons
    icons = {
      File = "󰈙 ",
      Module = " ",
      Namespace = "󰌗 ",
      Package = " ",
      Class = "󰌗 ",
      Method = "󰆧 ",
      Property = " ",
      Field = " ",
      Constructor = " ",
      Enum = "󰕘",
      Interface = "󰕘",
      Function = "󰊕 ",
      Variable = "󰆧 ",
      Constant = "󰏿 ",
      String = "󰀬 ",
      Number = "󰎠 ",
      Boolean = "◩ ",
      Array = "󰅪 ",
      Object = "󰅩 ",
      Key = "󰌋 ",
      Null = "󰟢 ",
      EnumMember = " ",
      Struct = "󰌗 ",
      Event = " ",
      Operator = "󰆕 ",
      TypeParameter = "󰊄 ",
    },
  },
  init = function()
    require("legendary").keymaps({
      {
        "<C-t>",
        function()
          require("aerial").toggle()
        end,
        mode = { "n", "x", "o" },
        description = "Aerial toggle",
      },
    })
  end,
}
