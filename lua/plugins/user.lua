---@type LazySpec
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = false,
  },
  {
    "jvgrootveld/telescope-zoxide",
    config = function() require("telescope").load_extension "zoxide" end,
  },
}
