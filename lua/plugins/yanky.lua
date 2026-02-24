return {
  "gbprod/yanky.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  event = "VeryLazy",
  opts = {
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 200,
    },
    preserve_cursor_position = {
      enabled = true,
    },
    ring = {
      history_length = 100,
      storage = "shada", -- Persist across sessions
      sync_with_numbered_registers = true,
      cancel_event = "update",
    },
  },
  keys = {
    -- Yank ring navigation (cycle through yank history after pasting)
    -- Works in both normal and visual mode - deleted text is saved to history
    {
      "p",
      "<Plug>(YankyPutAfter)",
      mode = { "n", "x" },
      desc = "Put after cursor (yanky)",
    },
    {
      "P",
      "<Plug>(YankyPutBefore)",
      mode = { "n", "x" },
      desc = "Put before cursor (yanky)",
    },
    {
      "<c-p>",
      "<Plug>(YankyCycleForward)",
      desc = "Cycle forward through yank history",
    },
    {
      "<c-n>",
      "<Plug>(YankyCycleBackward)",
      desc = "Cycle backward through yank history",
    },
    -- Yank history picker
    {
      "<leader>sy",
      function()
        require("yanky.picker").pick({
          picker = function(items, opts, on_choice)
            -- Convert yanky items to Snacks picker format
            local snacks_items = {}
            for i, item in ipairs(items) do
              local text = item.regcontents
              -- Join multiline yanks with spaces for preview
              local preview = type(text) == "table" and table.concat(text, " ") or text
              -- Truncate long previews
              if #preview > 100 then
                preview = preview:sub(1, 100) .. "..."
              end
              table.insert(snacks_items, {
                text = preview,
                item = item,
                idx = i,
              })
            end

            -- Use Snacks picker
            Snacks.picker.pick({
              items = snacks_items,
              format = function(item)
                return item.text
              end,
              confirm = function(item)
                on_choice(item.item, item.idx)
              end,
            })
          end,
        })
      end,
      desc = "[S]earch [Y]ank history",
    },
  },
}
