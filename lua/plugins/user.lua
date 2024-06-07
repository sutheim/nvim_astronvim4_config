---@type LazySpec
return {
  {
    "jvgrootveld/telescope-zoxide",
    config = function() require("telescope").load_extension "zoxide" end,
  },
  {
    "LhKipp/nvim-nu",
    lazy = false,
    config = function() require'nu'.setup{} end,
  }
}
