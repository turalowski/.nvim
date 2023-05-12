vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- General vim.keymaps
--
-- Copy file name and line number properly
vim.keymap.set("n", "<leader>li", '<Cmd>let @+=expand("%")..":L"..line(".")<CR>')
-- Exit from INSERT mode easily
vim.keymap.set("i", "jk", "<ESC>")
-- Clear highlight easily
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
-- Delete character will not copy character to register
vim.keymap.set("n", "x", '"_x')
-- Increase number
vim.keymap.set("n", "<leader>+", "<C-a>")
-- Decrease number
vim.keymap.set("n", "<leader>-", "<C-x>")
-- Replace visual
vim.keymap.set("n", "<leader>rv", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Move line to up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- live moving to up
-- Move line to down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- live moving to down

-- Modify screen navigations to keep the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- keep cursor in the middle
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv") -- keep cursor in the middle
vim.keymap.set("n", "N", "Nzzzv") -- keep cursor in the middle

-- Split shortcuts
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- Close current split window
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Buffer shortcuts
vim.keymap.set("n", "<leader>bx", ":bdelete<CR>")
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")

-- Tab shorcuts
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- restart lsp server
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
