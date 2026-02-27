return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>*", function() Snacks.picker.grep_word() end, desc = "Grep word under cursor" },
    },
  },
}
