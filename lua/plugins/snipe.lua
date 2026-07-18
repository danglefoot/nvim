return {
  "leath-dub/snipe.nvim",
  keys = {
    { "gb", function() require("snipe").open_buffer_menu() end, desc = "[B]uffer menu (snipe)" },
  },
  opts = {
    ui = { position = "cursor" },
  },
}
