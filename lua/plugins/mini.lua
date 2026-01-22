return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        -- Text objects and editing
        require("mini.ai").setup()        -- Better text objects
        require("mini.surround").setup()  -- Surround text
        require("mini.move").setup()      -- Move lines with Alt+hjkl
        require("mini.comment").setup()   -- Commenting
        require("mini.bufremove").setup() -- Better buffer deletion (works with bufferline!)
        require("mini.pairs").setup()
        -- Update your buffer delete keybind to use mini.bufremove
        vim.keymap.set("n", "<leader>bd", function()
            require("mini.bufremove").delete()
        end, { desc = "Delete Buffer" })
    end,
}
