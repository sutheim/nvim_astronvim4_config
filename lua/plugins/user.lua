---@type LazySpec
return {
  {
    "LhKipp/nvim-nu",
    lazy = false,
    config = function() require'nu'.setup{} end,
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {},
  }
}
