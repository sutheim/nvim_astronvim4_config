---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },

  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.wgsl" },
  { import = "astrocommunity.pack.zig" },

  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.mini-move" },

  { import = "astrocommunity.code-runner.compiler-nvim" },

  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },

  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },

  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },

  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
  { import = "astrocommunity.lsp.delimited-nvim" },

  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },

  { import = "astrocommunity.editing-support.true-zen-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },
  -- { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.undotree" },

  { import = "astrocommunity.file-explorer.oil-nvim" },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      overrides = {
        ContextVt = { fg = "#555555" },
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
        "<leader>P",
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
