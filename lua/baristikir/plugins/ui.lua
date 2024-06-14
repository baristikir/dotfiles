return {
  "nvim-tree/nvim-web-devicons",
  {
    "folke/edgy.nvim", -- Create predefined window layouts
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = {
      animate = { enabled = false },
      options = {
        top = { size = 10 },
      },
      bottom = {
        {
          ft = "terminal",
          title = "Terminal",
          size = { height = om.on_big_screen() and 20 or 0.2 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
      },
      right = {
        { ft = "aerial", title = "Symbols", size = { width = 0.3 } },
        { ft = "codecompanion", title = "Code Companion Chat", size = { width = 0.45 } },
        { ft = "neotest-summary", title = "Neotest Summary", size = { width = 0.3 } },
        { ft = "oil", title = "File Explorer", size = { width = 0.3 } },
      },
    },
  },
  {
    "lukas-reineke/virt-column.nvim", -- Use characters in the color column
    opts = {
      char = "│",
      highlight = "VirtColumn",
    },
  },
  {
    "tzachar/local-highlight.nvim", -- Highlight word under cursor throughout the visible buffer
    opts = {
      file_types = { "lua", "javascript", "python", "ruby" },
    },
  },
  {
    "stevearc/dressing.nvim", -- Utilises Neovim UI hooks to manage inputs, selects etc
    opts = {
      input = {
        default_prompt = "> ",
        relative = "editor",
        prefer_width = 50,
        prompt_align = "center",
        win_options = { winblend = 0 },
      },
      select = {
        get_config = function(opts)
          opts = opts or {}
          local config = {
            telescope = {
              layout_config = {
                width = 0.8,
              },
            },
          }
          if opts.kind == "legendary.nvim" then
            config.telescope.sorter = require("telescope.sorters").fuzzy_with_index_bias({})
          end
          return config
        end,
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim", -- Git signs in the statuscolumn
    opts = {
      signs = {
        add = { hl = "GitSignsAdd", text = "│" },
        change = { hl = "GitSignsChange", text = "│" },
        delete = { hl = "GitSignsDelete", text = "│" },
        topdelete = { hl = "GitSignsDelete", text = "│" },
        changedelete = { hl = "GitSignsChange", text = "│" },
        untracked = { hl = "GitSignsUntracked", text = "│" },
      },
      numhl = false,
      linehl = false,
    },
  },
  {
    "NvChad/nvim-colorizer.lua", -- Highlight hex and rgb colors within Neovim
    cmd = "ColorizerToggle",
    init = function()
      require("legendary").commands({
        {
          ":ColorizerToggle",
          description = "Colorizer toggle",
        },
      })
    end,
    opts = {
      filetypes = {
        "css",
        eruby = { mode = "foreground" },
        html = { mode = "foreground" },
        "lua",
        "javascript",
        "vue",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim", -- Show indentation lines
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
        },
        scope = {
          highlight = "IblIndent",
          show_end = false,
          show_start = false,
        },
      })

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    end,
  },
}
