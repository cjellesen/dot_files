-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[T]ab: [O]pen" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[T]ab: e[X]it" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[T]ab: [N]ext" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[T]ab: [P]revious" })
vim.keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "[T]ab: Open current [B]uffer in new tab" })

-- Window mangement
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "[W]indow mangement" })

-- Navigating windows
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to left hand window" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to right hand window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to upper window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navitgate to lower window" })

vim.keymap.set("v", "<leader>t", "+y", { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>yy", "+yy", { desc = "Copy to line clipboard" })

-- Diagnostics
vim.keymap.set(
	"n",
	"<leader>e",
	vim.diagnostic.open_float,
	{ desc = "Expands the diagnostic information in case of length issues" }
)

vim.keymap.set("n", "\\", "<cmd>Oil --float<CR>", { desc = "Launch Oil Explorer" })
