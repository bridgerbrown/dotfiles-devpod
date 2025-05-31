local set = vim.keymap.set
set('n', '<leader>w', ':w<CR>') -- write
set('n', '<C-q>', ':q<CR>') -- quit
set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear search

-- Next/prev buffer (honestly not the best)
set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer'})
set('n', '<leader>bp', ':bprev<CR>', { desc = 'Prev buffer'})

-- Diagnostic keymaps
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic [E]rror floating window' })

-- Exit terminal mode in the builtin terminal
set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Open a terminal at the bottom of the screen with a fixed height.
-- set("n", ",st", function()
--   vim.cmd.new()
--   vim.cmd.wincmd "J"
--   vim.api.nvim_win_set_height(0, 12)
--   vim.wo.winfixheight = true
--   vim.cmd.term()
-- end)

-- Window management
set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
set("n", "<leader>wv", "<C-w>v") -- split window vertically
set("n", "<leader>wm", "<C-w>s") -- split window horizontally
set("n", "<leader>we", "<C-w>=") -- make split windows equal width
set("n", "<leader>wx", ":close<CR>") -- close current split window

-- Resize windows
-- set("n", "<A-,>", "<C-w>5<", { desc = 'Window: shrink decrease by 5 cols to the left'})
-- set("n", "<A-.>", "<C-w>5>", { desc = 'Window: expand by 5 cols to the right'})
-- set("n", "<A-t>", "<C-W>+", { desc = 'Window: increase height by one line'})
-- set("n", "<A-s>", "<C-W>-", { desc = 'Window: decrease height by one line'})

-- Tabs
set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close current tab' })
set('n', '<leader>to', ':tabonly<CR>', { desc = 'Close all other tabs' })
set('n', '<leader>tl', ':tabnext<CR>', { desc = 'Next tab' })
set('n', '<leader>th', ':tabprevious<CR>', { desc = 'Previous tab' })
set('n', '<leader>t1', ':tabnext 1<CR>', { desc = 'Go to tab 1' })
set('n', '<leader>t2', ':tabnext 2<CR>', { desc = 'Go to tab 2' })
set('n', '<leader>t3', ':tabnext 3<CR>', { desc = 'Go to tab 3' })
set('n', '<leader>t4', ':tabnext 4<CR>', { desc = 'Go to tab 4' })
set('n', '<leader>t5', ':tabnext 5<CR>', { desc = 'Go to tab 5' })

