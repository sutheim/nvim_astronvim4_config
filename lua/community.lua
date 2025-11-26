-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  -- { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.pack.wgsl" },
  -- { import = "astrocommunity.pack.zig" },

  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.mini-move" },

  { import = "astrocommunity.code-runner.compiler-nvim" },

  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },

  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },

  -- { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },

  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
  -- { import = "astrocommunity.lsp.delimited-nvim" },

  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },

  -- { import = "astrocommunity.editing-support.true-zen-nvim" },
  -- { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },
  -- { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  -- { import = "astrocommunity.editing-support.copilotchat-nvim" },
  { import = "astrocommunity.editing-support.codecompanion-nvim" },

  -- { import = "astrocommunity.file-explorer.oil-nvim" },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   opts = {
  --     overrides = {
  --       ContextVt = { fg = "#555555" },
  --     },
  --   },
  -- },
}
