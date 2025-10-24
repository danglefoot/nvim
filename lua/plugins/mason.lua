return {
    {
        "williamboman/mason.nvim",
        lazy = false, -- Load immediately to ensure PATH is set
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts = function()
            local tools = {
                -- ========================================
                -- TypeScript/JavaScript/Angular Stack
                -- ========================================
                "vtsls",                        -- TypeScript/JavaScript LSP (modern, replaces ts_ls)
                "angular-language-server",      -- Angular Language Server
                "nxls",                         -- Nx monorepo LSP
                "eslint-lsp",                   -- ESLint LSP integration
                "eslint_d",                     -- Fast ESLint daemon
                "prettier",                     -- Code formatter (JS/TS/HTML/CSS/JSON)

                -- ========================================
                -- C# .NET Stack
                -- ========================================
                "netcoredbg",                   -- .NET debugger
                "csharpier",                    -- C# formatter
                -- Note: Roslyn LSP is handled by easy-dotnet.nvim plugin

                -- ========================================
                -- Web Fundamentals
                -- ========================================
                "html-lsp",                     -- HTML Language Server
                "css-lsp",                      -- CSS/SCSS Language Server
                "tailwindcss-language-server",  -- Tailwind CSS LSP
                "emmet-ls",                     -- Emmet abbreviations

                -- ========================================
                -- Config/Tooling/DevOps
                -- ========================================
                "lua-language-server",          -- Lua LSP (for editing Neovim config)
                "stylua",                       -- Lua formatter
                -- "luacheck",                  -- Lua linter (requires luarocks, often fails - install via brew/system package manager)
                "markdownlint-cli2",            -- Markdown linter (for READMEs/docs)
                "yaml-language-server",         -- YAML LSP (includes linting, for Docker/CI/CD)
            }

            -- Shell tools only on Unix-like systems (macOS/Linux)
            if vim.fn.has("win32") == 0 then
                table.insert(tools, "shfmt")        -- Shell script formatter
                table.insert(tools, "shellcheck")   -- Shell script linter
            end

            return { ensure_installed = tools }
        end,
        config = function(_, opts)
            -- PATH is handled by core.mason-path for consistency
            require("mason").setup(opts)

            -- Auto-install ensure_installed tools with better error handling
            local mr = require("mason-registry")
            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    if mr.has_package(tool) then
                        local p = mr.get_package(tool)
                        if not p:is_installed() then
                            vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)
                            p:install():once("closed", function()
                                if p:is_installed() then
                                    vim.notify("Mason: Successfully installed " .. tool, vim.log.levels.INFO)
                                else
                                    vim.notify("Mason: Failed to install " .. tool, vim.log.levels.ERROR)
                                end
                            end)
                        end
                    else
                        vim.notify("Mason: Package '" .. tool .. "' not found", vim.log.levels.WARN)
                    end
                end
            end

            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },
}
