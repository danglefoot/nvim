return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        -- Configure linters by filetype (using Mason-managed tools)
        lint.linters_by_ft = {
            -- Lua (for Neovim config editing)
            lua = { "luacheck" },

            -- Markdown (for documentation)
            markdown = { "markdownlint-cli2" },
        }

        -- Shell script linting (only on Unix-like systems)
        if vim.fn.has("win32") == 0 then
            lint.linters_by_ft.sh = { "shellcheck" }
            lint.linters_by_ft.bash = { "shellcheck" }
            lint.linters_by_ft.zsh = { "shellcheck" }
        end

        -- Auto-lint on save and text changes
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                -- Only lint if linters are available for this filetype
                local linters = lint.linters_by_ft[vim.bo.filetype]
                if not linters or #linters == 0 then
                    return
                end

                lint.try_lint()
            end,
        })

        -- Manual linting command
        vim.keymap.set("n", "<leader>cl", function()
            lint.try_lint()
            vim.notify("Linting...", vim.log.levels.INFO, { title = "nvim-lint" })
        end, { desc = "[C]ode [L]int" })

        -- Show linter status
        vim.keymap.set("n", "<leader>cli", function()
            local linters = lint.linters_by_ft[vim.bo.filetype] or {}
            if #linters == 0 then
                print("No linters configured for filetype: " .. vim.bo.filetype)
            else
                print("Linters for " .. vim.bo.filetype .. ": " .. table.concat(linters, ", "))
            end
        end, { desc = "[C]ode [L]int [I]nfo" })
    end,
}
