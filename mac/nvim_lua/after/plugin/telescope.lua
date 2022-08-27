local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        emoji = {
            action = function(emoji)
                -- argument emoji is a table.
                -- {name="", value="", cagegory="", description=""}

                vim.fn.setreg("*", emoji.value)
                print([[Press p or "*p to paste this emoji]] .. emoji.value)

                -- insert emoji when picked
                vim.api.nvim_put({ emoji.value }, "c", false, true)
            end,
        },
        bookmarks = {
            -- Available: "brave", "buku", "chrome", "chrome_beta", "edge", "safari", "firefox", "vivaldi"
            selected_browser = "brave",

            -- Either provide a shell command to open the URL
            url_open_command = [[ open -a "Brave Browser" ]],

            -- Or provide the plugin name which is already installed
            -- Available: "vim_external", "open_browser"
            url_open_plugin = nil,

            -- Show the full path to the bookmark instead of just the bookmark name
            full_path = false,

            -- Provide a custom profile name for Firefox
            firefox_profile_name = nil,

            -- Add a column which contains the tags for each bookmark for buku
            buku_include_tags = false,

            -- Provide debug messages
            debug = false,
        },
        command_palette = {
            {"LSP Pickers",
                { "lsp incoming calls", ":lua require(\"telescope.builtin\").lsp_incoming_calls()" },
                { "diagnostics", ":lua require(\"telescope.builtin\").diagnostics()" },
                { "lsp outgoing calls", ":lua require(\"telescope.builtin\").lsp_outgoing_calls()" },
                { "lsp document symbols", ":lua require(\"telescope.builtin\").lsp_document_symbols()" },
                { "lsp workspace symbols", ":lua require(\"telescope.builtin\").lsp_workspace_symbols()" },
                { "lsp dynamic workspace symbols", ":lua require(\"telescope.builtin\").lsp_dynamic_workspace_symbols()" },
                { "treesitter", ":lua require(\"telescope.builtin\").treesitter()" },
                { "references", ":lua require(\"telescope.builtin\").lsp_references()" },
                { "lsp implementation", ":lua require(\"telescope.builtin\").lsp_implementations()" },
                { "lsp type definitions", ":lua require(\"telescope.builtin\").lsp_type_definitions()" },
                { "lsp definitions", ":lua require(\"telescope.builtin\").lsp_definitions()" },
            },
            {"Telescope",
                { "jumps", ":lua require(\"telescope.builtin\").jumplist()" },
                { "commands", ":lua require(\"telescope.builtin\").commands()" },
                { "command history", ":lua require(\"telescope.builtin\").command_history()" },
                { "registers", ":lua require(\"telescope.builtin\").registers()" },
                { "colorshceme", ":lua require(\"telescope.builtin\").colorscheme()", 1 },
                { "vim options", ":lua require(\"telescope.builtin\").vim_options()" },
                { "keymaps", ":lua require(\"telescope.builtin\").keymaps()" },
                { "buffers", ":Telescope buffers" },
                { "search history", ":lua require(\"telescope.builtin\").search_history()" },
                { "file browser", ":lua require\'telescope\'.extensions.file_browser.file_browser()", 1 },
                { "search word", ":lua require(\"telescope.builtin\").live_grep()", 1 },
                { "git files", ":lua require(\"telescope.builtin\").git_files()", 1 },
                { "files", ":lua require(\"telescope.builtin\").find_files()", 1 },
                { "man pages", ":lua require(\"telescope.builtin\").man_pages()" },
                { "marks", ":lua require(\"telescope.builtin\").marks()" },
                { "quickfix", ":lua require(\"telescope.builtin\").quickfix()" },
                { "quickfix history", ":lua require(\"telescope.builtin\").quickfixhistory()" },
                { "loclist", ":lua require(\"telescope.builtin\").loclist()" },
                { "spell suggest", ":lua require(\"telescope.builtin\").spell_suggest()" },
                { "filetypes", ":lua require(\"telescope.builtin\").filetypes()" },
                { "highlights", ":lua require(\"telescope.builtin\").highlights()" },
                { "pickers", ":lua require(\"telescope.builtin\").pickers()" },
                { "planets", ":lua require(\"telescope.builtin\").planets()" },
                { "builtin", ":lua require(\"telescope.builtin\").builtin()" },
                { "reloader", ":lua require(\"telescope.builtin\").reloader()" },
                { "symbols", ":lua require(\"telescope.builtin\").symbols()" },
            },
            {"git", 
                { "git commits", ":lua require(\"telescope.builtin\").git_commits()" },
                { "git branches", ":lua require(\"telescope.builtin\").git_branches()" },
                { "git status", ":lua require(\"telescope.builtin\").git_status()" },
                { "git stash", ":lua require(\"telescope.builtin\").git_stash()" },
            },
            {"Misc",
                { "paste mode", ":set paste!" },
                { "cursor line", ":set cursorline!" },
                { "cursor column", ":set cursorcolumn!" },
                { "spell checker", ":set spell!" },
                { "relative number", ":set relativenumber!"},
                { "search highlighting (F12)", ":set hlsearch!" },
                { "reload vimrc", ":source $MYVIMRC" },
                { "check health", ":checkhealth" },
                { "tips", ":help tips" },
                { "cheatsheet", ":help index" },
                { "tutorial", ":help tutor" },
                { "summary", ":help summary" },
                { "quick reference", ":help quickref" },
                { "search help(F1)", ":lua require(\"telescope.builtin\").help_tags()", 1 },
                { "entire selection (C-a)", ":call feedkeys(\"GVgg\")" },
                { "save current file (C-s)", ":w" },
                { "save all files (C-A-s)", ":wa" },
                { "quit (C-q)", ":qa" },
            },
        },
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
}

telescope.load_extension("fzf")
telescope.load_extension("emoji")
telescope.load_extension("bookmarks")
telescope.load_extension("command_palette")
telescope.load_extension("file_browser")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", opts)
vim.keymap.set("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", opts)
vim.keymap.set("n", "<leader>fk", "<Cmd>Telescope keymaps<CR>", opts)
vim.keymap.set("n", "<leader>fs", "<Cmd>Telescope colorscheme<CR>", opts)
vim.keymap.set("n", "<leader>fe", "<Cmd>Telescope emoji<CR>", opts)
vim.keymap.set("n", "<leader>fm", "<Cmd>Telescope bookmarks<CR>", opts)
vim.keymap.set("n", "<leader>fc", "<Cmd>Telescope command_palette<CR>", opts)
vim.keymap.set("n", "<leader>fx", "<Cmd>Telescope file_browser<CR>", opts)

