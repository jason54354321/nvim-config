return {
  "ThePrimeagen/harpoon",
  dependencies = {
      "nvim-lua/plenary.nvim"
  },
  keys = {
    {"<leader>a", function() require('harpoon.mark').add_file() end, desc = "Harpoon Add"},
    {"<leader>e", function() require('harpoon.ui').toggle_quick_menu() end, desc = "Harpoon Menu"},
    {"<c-j>", function() require('harpoon.ui').nav_file(1) end, desc = "Harpoon Go File1"},
    {"<c-k>", function() require('harpoon.ui').nav_file(2) end, desc = "Harpoon Go File2"},
    {"<c-l>", function() require('harpoon.ui').nav_file(3) end, desc = "Harpoon Go File3"},
    {"<c-h>", function() require('harpoon.ui').nav_file(4) end, desc = "Harpoon Go File4"}
  },

  config = function()
    require('harpoon').setup({})
  end
}
