
require("codecompanion").setup({
  adapters = {
    anthropic = function()
      return require("codecompanion.adapters").extend("anthropic", {
        env = { api_key = "cmd:echo $ANTHROPIC_API_KEY" },
      })
    end,
  },
})


vim.keymap.set({"n", "v"}, "<leader>a", "<cmd>CodeCompanionActions<cr>")
vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>")
