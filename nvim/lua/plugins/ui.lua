return {
  -- This tells Noice (the UI manager) to use rounded borders for LSP docs
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
