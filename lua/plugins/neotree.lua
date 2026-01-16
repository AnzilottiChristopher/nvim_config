return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
        {"<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer"},
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                follow_current_file = true,
                hijack_netrw_behavior = "open_default",
            },
            window = {
                position = "right",
                width = 30,
            }
        })
    end,
}
