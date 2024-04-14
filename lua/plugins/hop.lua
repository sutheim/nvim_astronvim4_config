return {
  {
    "smoka7/hop.nvim",
    opts = {
      multi_windows = true,
    },
    keys = {
      {
        "f",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            current_line_only = true,
          }
        end,
        mode = { "n" },
        desc = { "Hint character forward" },
        remap = true,
      },
      {
        "F",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            current_line_only = true,
          }
        end,
        mode = { "n" },
        desc = { "Hint character back" },
        remap = true,
      },
      {
        "t",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            current_line_only = true,
            hint_offset = -1,
          }
        end,
        mode = { "n" },
        desc = { "Hint character forward" },
        remap = true,
      },
      {
        "T",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            current_line_only = true,
            hint_offset = 1,
          }
        end,
        mode = { "n" },
        desc = { "Hint character back" },
        remap = true,
      },
      {
        "s",
        function() require("hop").hint_words() end,
        mode = { "n" },
        desc = "Hop hint words",
      },
      {
        "<S-j>",
        function() require("hop").hint_lines() end,
        mode = { "n" },
        desc = "Hop hint lines",
      },
      {
        "s",
        function() require("hop").hint_words { extend_visual = true } end,
        mode = { "v" },
        desc = "Hop hint words",
      },
      {
        "<S-j>",
        function() require("hop").hint_lines { extend_visual = true } end,
        mode = { "v" },
        desc = "Hop hint lines",
      },
    },
  },
}
