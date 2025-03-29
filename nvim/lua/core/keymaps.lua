-- Key mappings
local opts = { noremap = true, silent = true }

-- Git mappings
vim.keymap.set("n", "<Leader>gs", ":Gitsigns stage_hunk<CR>", opts)  -- Stage current change
vim.keymap.set("n", "<Leader>gr", ":Gitsigns reset_hunk<CR>", opts)  -- Reset current change
vim.keymap.set("n", "<Leader>gb", ":Gitsigns blame_line<CR>", opts)  -- Show blame
vim.keymap.set("n", "<Leader>gc", ":Git commit<CR>", opts)           -- Git commit
vim.keymap.set("n", "<Leader>gd", ":Gitsigns diffthis<CR>", opts)    -- Show file diff

-- Folding
vim.keymap.set("n", "<Leader>zf", "zM", opts)                       -- Fold all
vim.keymap.set("n", "<Leader>zo", "zR", opts)                       -- Unfold all
vim.keymap.set("n", "<Leader>zt", "za", opts)                       -- Toggle current fold

-- Commenting
vim.keymap.set("n", "<Leader>cl", "<Plug>(comment_toggle_linewise)", opts)  -- Toggle line comment
vim.keymap.set("n", "<Leader>cb", "<Plug>(comment_toggle_blockwise)", opts) -- Toggle block comment

-- Basic mappings
vim.keymap.set("n", "<Leader>s", ":w<CR>", opts)       -- Save file
vim.keymap.set("n", "<Leader>q", ":q<CR>", opts)       -- Quit
vim.keymap.set("n", "<Leader>wq", ":wq<CR>", opts)     -- Save and quit
vim.keymap.set("i", "jk", "<Esc>", opts)               -- Exit insert mode

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)           -- Left window
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)           -- Down window
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)           -- Up window
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)           -- Right window

-- Window resizing
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)         -- Increase height
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)       -- Decrease height
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- Decrease width
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Increase width

-- Buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)       -- Next buffer
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)   -- Previous buffer
vim.keymap.set("n", "<Leader>bd", ":bdelete<CR>", opts) -- Delete buffer
vim.keymap.set("n", "<Leader>ba", ":%bd|e#<CR>", opts) -- Close all buffers except current
for i = 1, 9 do
    vim.keymap.set("n", "<Leader>" .. i, ":buffer " .. i .. "<CR>", opts) -- Jump to buffer 1-9
    end

    -- Telescope mappings
    vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", opts) -- Find files
    vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)  -- Grep in files
    vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", opts)    -- List buffers
    vim.keymap.set("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)  -- Search help
    vim.keymap.set("n", "<Leader>fp", ":Telescope projects<CR>", opts)   -- List projects
    vim.keymap.set("n", "<Leader>fr", ":Telescope oldfiles<CR>", opts)   -- Recent files

    -- Search and Replace
    vim.keymap.set("n", "<Leader>rr", ":&&<CR>", opts)  -- Repeat last substitution
    vim.keymap.set("n", "<Leader>/", ":noh<CR>", opts)  -- Clear search highlight

    -- Text Object Manipulation
    vim.keymap.set("n", "<Leader>df", "dif", opts)  -- Delete inside function
    vim.keymap.set("n", "<Leader>cf", "cif", opts)  -- Change inside function (reassign formatting below)

    -- Plugin-specific mappings
    vim.keymap.set("n", "<Leader>F", ":lua require('conform').format()<CR>", opts) -- Format code (moved from <Leader>cf)
    vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)                  -- Toggle NvimTree
    vim.keymap.set("n", "<Leader>xx", ":TroubleToggle<CR>", opts)                  -- Toggle Trouble
    vim.keymap.set("n", "<Leader>xw", ":TroubleToggle workspace_diagnostics<CR>", opts) -- Workspace diagnostics
    vim.keymap.set("n", "<Leader>xd", ":TroubleToggle document_diagnostics<CR>", opts)  -- Document diagnostics

    -- Debugging shortcuts
    vim.keymap.set("n", "<Leader>dt", ":lua require'dap'.toggle_breakpoint()<CR>", opts) -- Toggle breakpoint (moved from <Leader>db)
    vim.keymap.set("n", "<Leader>dc", ":lua require'dap'.continue()<CR>", opts)          -- Continue
    vim.keymap.set("n", "<Leader>do", ":lua require'dap'.step_over()<CR>", opts)         -- Step over
    vim.keymap.set("n", "<Leader>di", ":lua require'dap'.step_into()<CR>", opts)         -- Step into
    vim.keymap.set("n", "<Leader>dO", ":lua require'dap'.step_out()<CR>", opts)          -- Step out
    vim.keymap.set("n", "<Leader>dr", ":lua require'dap'.run_to_cursor()<CR>", opts)     -- Run to cursor
    vim.keymap.set("n", "<Leader>du", ":lua require'dapui'.toggle()<CR>", opts)          -- Toggle DAP UI

    -- Macros
    vim.keymap.set("n", "<Leader>qm", "q", opts)  -- Start/stop macro recording
    vim.keymap.set("n", "<Leader>@", "@@", opts)  -- Replay last macro

    -- Language-specific (Python)
    vim.keymap.set("n", "<Leader>rp", ":TermExec cmd='python3 %'<CR>", opts)  -- Run Python file
