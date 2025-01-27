local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- keymap(mode, sequence, command, options)
local keymap = vim.api.nvim_set_keymap

-- reload config
keymap("n", "<leader>R", ":luafile %<CR>", {})
-- use jk instead of ESCAPE to return from insert mode to normal mode
keymap("i", "jk", "<Esc>", {})
-- use space as leader key
keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- NOTE: require winshit plugin
keymap("n", "<C-W>m", ":WinShift<cr>", opts)

-- i j remap to gi gj to get the consistent behaviour in wrap content mode (i.e. set wrap)
-- keymap("n", "j", "<Plug>(accelerated_jk_gj)", opts)
-- keymap("n", "k", "<Plug>(accelerated_jk_gk)", opts)


-- FileExpoler
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap('v', '<leader>f', "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
-- no highlight
keymap("n", "<leader>l", ":nohl<cr>", opts)
-- save buffer
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("i", "<C-s>", "<Esc>:w<cr>", opts)
-- exit cur window
keymap("n", "<leader>q", ":q<cr>", opts)
-- delete cur buffer
keymap("n", "<leader>d", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
keymap("n", "<leader>D", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
-- exit whole program
keymap("n", "ZZ", ":lua require('user.utils').SaveAndExit()<cr>", opts)
-- remap macro record key
keymap("n", "Q", "q", opts)
-- cancel q
keymap("n", "q", "<Nop>", opts)

-- center cursor
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)
-- keymap("n", "j", "jzz", opts)
-- keymap("n", "k", "kzz", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "R", ":bnext<CR>", opts)
-- keymap("n", "E", ":bprevious<CR>", opts)
-- NOTE: E/R navigation needs  'bufferline' plugin
keymap("n", "R", ":BufferLineCycleNext<CR>", opts)
keymap("n", "E", ":BufferLineCyclePrev<CR>", opts)

-- Navigate line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jl fast to enter
keymap("i", "jl", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<Space>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<Space>f", "<cmd>lua require('telescope').extensions.frecency.frecency(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<Space>F", "<cmd>Telescope live_grep<cr>", opts)

-- bookmarks
keymap("n", "ma", "<cmd>Telescope vim_bookmarks current_file<cr>", opts)
keymap("n", "mA", "<cmd>Telescope vim_bookmarks all<cr>", opts)


keymap("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
keymap("n", "<leader>u", "<cmd>Trouble lsp_references<cr>", opts)

-- calltree
keymap("n", "<leader>in", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opts)

-- debug
keymap("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint(); require'user.dap.dap-util'.store_breakpoints(true)<cr>", opts)
keymap("n", "<CS-F9>", "<cmd>lua require'dap'.clear_breakpoints(); require'user.dap.dap-util'.store_breakpoints(true)<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.list_breakpoints()<cr>", opts)

keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<C-F5>", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<S-F5>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap('n', "<CS-F5>", "<cmd>lua require'user.dap.dap-util'.reload_continue()<cr>", opts)

keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<C-F10>", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
keymap("n", "<S-F10>", "<cmd>lua require'dap'.step_back()<cr>", opts)
keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<C-F11>", "<cmd>lua require'dap'.step_out()<cr>", opts)

keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dT", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)

-- git diff view
keymap('n', '<leader>j', ']c', opts)
keymap('n', '<leader>k', '[c', opts)

-- unit test
-- keymap("n", "<leader>rr", "<cmd>UltestNearest<cr>", opts)
-- keymap("n", "<leader>rd", "<cmd>UltestDebugNearest<cr>", opts)
keymap("n", "<leader>Tn", ":GTestRunNewTest", opts)
keymap("n", "<leader>Tr", ":GTestRunUnderCursor", opts)
keymap("n", "<leader>Tt", ":GTestToggleEnabled", opts)
keymap("n", "<leader>Tp", ":GTestPrev", opts)
keymap("n", "<leader>Tn", ":GTestNext", opts)

-- comment
keymap("n", "gcf", "<cmd>Dox<cr>", opts)

-- sniprun
keymap("n", "<leader>rf", ":%SnipRun<cr>", opts)
keymap("v", "<leader>rs", ":%SnipRun<cr>", opts)

-- spell check
vim.cmd(
[[
  nnoremap <leader>s :call search('\w\>', 'c')<CR>a<C-X><C-S>
]])

-- gtags
-- find functions calling this function
-- keymap("n", "<leader>U", ":lua require('user.utils').GtagsRefernce()<cr>", opts)
-- find definition
-- keymap("n", "<leader>T", ":lua require('user.utils').GtagsText()<cr>", opts)

-- floaterm
keymap("n", "<C-f>", ":FloatermNew<CR>zsh<CR>", opts)
keymap("t", "<C-t>", "<C-\\><C-n>:FloatermToggle<CR>", opts)
keymap("t", "<C-k>", "<C-\\><C-n>:FloatermKill<CR>", opts)
keymap("t", "<C-K>", "<C-\\><C-n>:FloatermKill!<CR>", opts)
keymap("t", "<C-p>", "<C-\\><C-n>:FloatermPrev<CR>", opts)
keymap("t", "<C-n>", "<C-\\><C-n>:FloatermNext<CR>", opts)

-- undotree
keymap("n", "<space>uu", ":UndotreeToggle<CR>", opts)
