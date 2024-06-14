return {
  "kevinhwang91/nvim-ufo", -- Better folds in Neovim
  dependencies = "kevinhwang91/promise-async",
  init = function()
    require("legendary").keymaps({
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        description = "Open all folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        description = "Close all folds",
      },
    })
  end,
}
