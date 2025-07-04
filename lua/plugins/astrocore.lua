---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      undodir = vim.fn.expand "$HOME/.vim.undodir",
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes:1", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        undotree_DiffAutoOpen = 0,
        undotree_SetFocusWhenToggle = 1,
      },
    },

    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<leader>hf"] = {  "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd', '--no-ignore', '--follow' }})<cr>" },

        ["<C-f>"] = { "<cmd>Telescope fd<CR>", desc = "Activates Telescope find files" },
        ["<C-g>"] = {
          function() require("telescope").extensions.live_grep_args.live_grep_args() end,
          desc = "Activates Telescope live grep args",
        },
        ["<C-c>"] = {
          function() require("telescope-live-grep-args.shortcuts").grep_word_under_cursor() end,
          desc = "Activates Telescope live grep args under cursor",
        },
        ["<C-t>"] = { "<cmd>TodoTelescope<CR>", desc = "Activates Telescope Todo" },

        ["<leader>u"] = { vim.cmd.UndotreeToggle, desc = "Toggle UndoTree Window" },

        ["N"] = { "Nzz", desc = "Next and center" },
        ["n"] = { "nzz", desc = "Next and center" },

        ["<C-u>"] = { "<C-u>zz", desc = "Half page up and center" },
        ["<C-d>"] = { "<C-d>zz", desc = "Half page down and center" },

        ["gd"] = { "gdzz", desc = "Show definition and center" },

        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader>b"] = { desc = "Buffers" },

        ["<leader>r"] = { name = " Rust Tools" },
        ["<leader>rf"] = {
          function()
            for _ = 1, 2, 1 do
              require("crates").show_features_popup()
            end
          end,
          desc = "Crate Show Features",
        },
        ["<leader>rv"] = {
          function()
            for _ = 1, 2, 1 do
              require("crates").show_versions_popup()
            end
          end,
          desc = "Crate Show Versions",
        },
        ["<leader>rd"] = {
          function()
            vim.cmd.RustLsp('relatedDiagnostics')
          end,
          desc = "Show related diagnostics",
        },
        ["<leader>rc"] = {
          function()
            vim.cmd.RustLsp('openCargo')
          end,
          desc = "Open Cargo.toml for current crate",
        },
        ["<leader>rp"] = {
          function()
            vim.cmd.RustLsp('parentModule')
          end,
          desc = "Open parent module",
        },
        ["<C-Q>"] = false,
      },
      v = {
        ["<C-g>"] = {
          function() require("telescope-live-grep-args.shortcuts").grep_visual_selection() end,
          desc = "Activates Telescope live grep visual selection args",
        },
      },
      i = {
        ["<C-k>"] = { vim.lsp.buf.signature_help },
        ["<C-Q>"] = false,
      },
      t = {
        -- setting a mapping to false will disable it
        ["<C-Q>"] = false,
      },
    },
    o = {
      shell = "nu",
      shellcmdflag = "-c",
      shellquote = "",
      shellxquote = "",
    },
  },
}
