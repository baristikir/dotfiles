return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      highlight_overrides = {
        frappe = function(frappe)
          return {
            LineNr = { fg = frappe.overlay0 },
          }
        end,
      },
    })
    vim.cmd("colorscheme catppuccin-macchiato")
  end,
}
