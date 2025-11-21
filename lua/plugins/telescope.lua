return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.1.9",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {
            -- Native fuzzy-finder for faster C searching.
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

    telescope.setup({
        defaults = {
            sorting_strategy = "ascending",
            layout_strategy = "flex",

            find_command = {
                "fd",
                "--type", "f",
                "--hidden",
                "--follow",
                "--exclude", ".git"
            },

            layout_config = {
                prompt_position = "top",
            },

            file_ignore_patterns = {
                "node_modules",
                "%.git/",
                "target/",
                "dist/",
                "build/",
                "__pycache__",
                "^Applications/",
                "^Movies/",
                "^Music/",
                "^Pictures/",
                "^Library/",
                "%.DS_Store",
                "^Games/",
                -- Allow these
                "!^%.config/",
            },
            
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!node_modules/*",
                "--glob=!.git/*",
                "--glob=!target/*",
            },
        },

        pickers = {
                find_files = {
                    hidden = false,
                    no_ignore = false,
                    follow = true,
                    theme = "dropdown",
                    previewer = false,
                },
            },

        extensions = {
            ["ui-select"] = themes.get_dropdown({}),
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            },
        },

    })

    -- Keymaps here so telescope is guaranteed loaded
    local map = vim.keymap.set
    map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
    map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    map("n", "<leader>fc", builtin.commands, { desc = "Commands" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
    
    -- Git stuff
    map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
    map("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
    map("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
    
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")
  end,
}

