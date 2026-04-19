return {
  "neovim/nvim-lspconfig",
  opts = {
    -- 1. Disable inlay hints as you wanted
    inlay_hints = { enabled = false },
    -- 2. Force the border in the global defaults
    defaults = {
      border = "rounded",
    },
  },
}
