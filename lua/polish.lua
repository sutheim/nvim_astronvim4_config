vim.filetype.add({
    pattern = {
      ['.*%.wgsl'] = 'wgsl',
    },
})

vim.cmd([[cab cc CodeCompanion]])

require("notify").setup({
    merge_duplicates = true,
    background_colour = "#1a1b26",
})
