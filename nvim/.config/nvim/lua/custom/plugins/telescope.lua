return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",

        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },

      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      vim.keymap.set("n", "<leader>fd", builtin.find_files)
      vim.keymap.set("n", "<leader>gw", builtin.grep_string)
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
      vim.keymap.set("n", "<leader>f.", builtin.oldfiles)
      vim.keymap.set("n", "<leader><leader>", builtin.buffers)
      vim.keymap.set("n", "<space>ft", function()
        return builtin.git_files({ cwd = vim.fn.expand("%:h") })
      end)
      vim.keymap.set("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end)

      vim.keymap.set("n", "<leader>en", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end)

      vim.keymap.set("n", "<space>ep", function()
        print(tostring(vim.fn.stdpath("data")))
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(tostring(vim.fn.stdpath("data")), "lazy"),
        })
      end)

      require("custom.telescope.multigrep").setup()
    end,
  },
}
