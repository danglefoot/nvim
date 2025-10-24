return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        -- Configure linters by filetype (using Mason-managed tools)
        lint.linters_by_ft = {
            -- JavaScript/TypeScript (web dev)
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },

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

                -- For ESLint, only run if config file exists
                if vim.tbl_contains(linters, "eslint_d") then
                    local config_files = {
                        ".eslintrc.js",
                        ".eslintrc.cjs",
                        ".eslintrc.yaml",
                        ".eslintrc.yml",
                        ".eslintrc.json",
                        "eslint.config.js",
                        "eslint.config.mjs",
                        "eslint.config.cjs",
                    }
                    local has_config = false
                    for _, config in ipairs(config_files) do
                        if vim.fn.findfile(config, ".;") ~= "" then
                            has_config = true
                            break
                        end
                    end
                    if not has_config then
                        return -- Don't lint if no ESLint config found
                    end
                end

                lint.try_lint()
            end,
        })

        -- Manual linting command
        vim.keymap.set("n", "<leader>ll", function()
            lint.try_lint()
            vim.notify("Linting...", vim.log.levels.INFO, { title = "nvim-lint" })
        end, { desc = "Trigger linting for current file" })

        -- Show linter status
        vim.keymap.set("n", "<leader>li", function()
            local linters = lint.linters_by_ft[vim.bo.filetype] or {}
            if #linters == 0 then
                print("No linters configured for filetype: " .. vim.bo.filetype)
            else
                print("Linters for " .. vim.bo.filetype .. ": " .. table.concat(linters, ", "))
            end
        end, { desc = "Show available linters for current filetype" })
    end,
}
