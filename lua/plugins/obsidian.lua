return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release instead of latest commit
    ft = "markdown",
    -- Also load when opening a file inside the vault (so it works even if
    -- markdown was already loaded by another plugin).
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/My Drive/Obsidian/Personal/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/My Drive/Obsidian/Personal/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/My Drive/Obsidian/Personal",
            },
        },

        -- Use only the new `Obsidian <subcommand>` command style (silences the
        -- legacy_commands deprecation warning). Completion is now provided
        -- automatically by the built-in obsidian-ls LSP server, so no
        -- `completion` block is needed anymore.
        legacy_commands = false,

        -- Where new notes go when created from e.g. a wiki link.
        new_notes_location = "current_dir",

        -- Use the note's title (or a slug of it) as the filename.
        note_id_func = function(title)
            if title ~= nil then
                return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            end
            return tostring(os.time())
        end,

        -- Optional: keep the daily notes in a dedicated folder.
        daily_notes = {
            folder = "daily",
            date_format = "%Y-%m-%d",
        },

        -- In-buffer rendering (checkboxes, bullets, concealed links, etc.) is
        -- handled by render-markdown.nvim for ALL markdown files, so the
        -- built-in ui module stays off to avoid the two plugins drawing
        -- duplicate decorations. render-markdown also manages conceallevel
        -- per-window itself, so no conceal autocmd is needed here anymore.
        ui = { enable = false },
    },
    keys = {
        { "<leader>Oo", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian: quick switch note" },
        { "<leader>On", "<cmd>Obsidian new<cr>",          desc = "Obsidian: new note" },
        { "<leader>Os", "<cmd>Obsidian search<cr>",       desc = "Obsidian: search notes" },
        { "<leader>Ot", "<cmd>Obsidian today<cr>",        desc = "Obsidian: today's daily note" },
        { "<leader>Oy", "<cmd>Obsidian yesterday<cr>",    desc = "Obsidian: yesterday's daily note" },
        { "<leader>Ob", "<cmd>Obsidian backlinks<cr>",    desc = "Obsidian: show backlinks" },
        { "<leader>Og", "<cmd>Obsidian follow_link<cr>",  desc = "Obsidian: follow link under cursor" },
        { "<leader>Ol", "<cmd>Obsidian link<cr>",         desc = "Obsidian: link to note",           mode = "v" },
    },
}
