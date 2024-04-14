---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },

  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.wgsl" },

  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.mini-move" },

  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },

  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },

  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.editing-support.true-zen-nvim" },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    init = function()
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("cmp").setup.buffer { sources = { { name = "crates" } } }
          local utils = require "astronvim.utils"
          utils.set_mappings {
            n = {
              ["<leader>r"] = { name = " Rust Tools" },
              ["<leader>rf"] = {
                function()
                  for i = 1, 2, 1 do
                    require("crates").show_features_popup()
                  end
                end,
                desc = "Crate Show Features",
              },
              ["<leader>rv"] = {
                function()
                  for i = 1, 2, 1 do
                    require("crates").show_versions_popup()
                  end
                end,
                desc = "Crate Show Versions",
              },
            },
          }
          require "crates"
        end,
      })
    end,
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
  {
    "gbprod/yanky.nvim",
    event = "UIEnter",
    dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find "Windows" } },
    opts = function()
      local mapping = require "yanky.telescope.mapping"
      local mappings = mapping.get_defaults()
      mappings.i["<c-p>"] = nil
      return {
        highlight = { timer = 200 },
        ring = { storage = jit.os:find "Windows" and "shada" or "sqlite" },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = mappings,
          },
        },
      }
    end,
    keys = {
      {
        "<leader>p",
        function() require("telescope").extensions.yank_history.yank_history {} end,
        desc = "Open Yank History",
      },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "<C-y>", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "<C-p>", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },
}
