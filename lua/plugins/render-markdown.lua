return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.icons",
    },
    opts = {
        -- No latex treesitter parser or utftex/latex2text on this machine.
        latex = { enabled = false },

        -- Recreate the custom checkbox states previously rendered by
        -- obsidian.nvim's ui module (now disabled in obsidian.lua).
        checkbox = {
            unchecked = { icon = "󰄱 " },
            checked = { icon = " " },
            custom = {
                forwarded = { raw = "[>]", rendered = " ", highlight = "RenderMarkdownInfo" },
                cancelled = { raw = "[~]", rendered = "󰰱 ", highlight = "RenderMarkdownWarn" },
                important = { raw = "[!]", rendered = " ", highlight = "RenderMarkdownError" },
            },
        },
    },
}
