return {
  "asvetliakov/vim-easymotion",
  enabled = vim.g.vscode ~= nil, -- Only load in VS Code
  config = function()
    -- EasyMotion using gj prefix (consistent with flash.nvim in regular Neovim)
    -- Usage: gjs (search), gjf (find char), gjw (word)
    vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings

    -- Two character search (similar to vim-sneak)
    vim.keymap.set("n", "gjs", "<Plug>(easymotion-s2)")
    vim.keymap.set("n", "gjf", "<Plug>(easymotion-f)")
    vim.keymap.set("n", "gjw", "<Plug>(easymotion-w)")
  end,
}
