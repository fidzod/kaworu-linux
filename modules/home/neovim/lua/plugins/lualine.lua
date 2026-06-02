require("lualine").setup({
  options = {
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "mode",
        fmt = function(mode)
          local icons = {
            NORMAL = "󰋜",
            INSERT = "󰏫",
            VISUAL = "󰈈",
            ["V-LINE"] = "󰈈",
            ["V-BLOCK"] = "󰈈",
            COMMAND = "󰘳",
            REPLACE = "󰏫",
          }
          return icons[mode] or mode
        end
      },
      "filename",
      "branch"
    },
    lualine_x = { "diagnostics", "location", "encoding", "filetype" },
    lualine_y = {},
    lualine_z = {},
  },
})
