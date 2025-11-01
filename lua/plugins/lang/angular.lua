return {
  {
    "Equilibris/nx.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Required by nx.nvim for picker
      "nvim-lua/plenary.nvim",
    },
    opts = {
      nx_cmd_root = "npx nx",
    },
    keys = {
      { "<leader>na", "<cmd>Telescope nx actions<CR>", desc = "[N]x [A]ctions" },
    },
  },
  -- Angular component/template navigation
  {
    "nvim-lua/plenary.nvim",
    keys = {
      {
        "<leader>at",
        function()
          local current_file = vim.fn.expand("%:p")
          local is_ts = current_file:match("%.ts$")
          local is_html = current_file:match("%.html$")

          if is_ts then
            -- Go to template: replace .ts with .html
            local template_file = current_file:gsub("%.component%.ts$", ".component.html")
                                             :gsub("%.ts$", ".html")
            if vim.fn.filereadable(template_file) == 1 then
              vim.cmd("edit " .. template_file)
            else
              print("Template file not found: " .. vim.fn.fnamemodify(template_file, ":t"))
            end
          elseif is_html then
            -- Go to component: replace .html with .ts
            local component_file = current_file:gsub("%.component%.html$", ".component.ts")
                                               :gsub("%.html$", ".ts")
            if vim.fn.filereadable(component_file) == 1 then
              vim.cmd("edit " .. component_file)
            else
              print("Component file not found: " .. vim.fn.fnamemodify(component_file, ":t"))
            end
          else
            print("Not an Angular component or template file")
          end
        end,
        desc = "[A]ngular [T]oggle Component/Template",
      },
    },
  },
}
