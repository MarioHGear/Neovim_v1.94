local keymap = vim.keymap

-- Guardar
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":w | bd | Alpha<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>qq", ":bd! | Alpha<CR>",
    { noremap = true, silent = true, desc = "Discard buffer and go to Alpha" })
keymap.set("n", "<C-s>", ":w<CR>")

-- Debugger
keymap.set("n", "<leader>bc", function() require("dap").continue() end)
keymap.set("n", "<leader>bn", function() require("dap").step_over() end)
keymap.set("n", "<leader>bi", function() require("dap").step_into() end)
keymap.set("n", "<leader>bo", function() require("dap").step_out() end)
keymap.set("n", "<leader>bb", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

-- Run Python
local function run_python(opts)
    vim.cmd("write")
    if opts.split == "v" then
        vim.cmd("botright vsplit | vertical resize 80")
    else
        vim.cmd("botright split | resize 12")
    end
    local cmd = opts.interactive and "ipython -i" or "python"
    vim.cmd("terminal " .. cmd .. " " .. vim.fn.expand("%"))
    vim.cmd("startinsert")
end

-- Mapeos para Python
keymap.set("n", "<leader>za", function() run_python({ split = "h", interactive = false }) end,
    { desc = "Run Python (split)" })
keymap.set("n", "<leader>zv", function() run_python({ split = "v", interactive = false }) end,
    { desc = "Run Python (vertical)" })
keymap.set("n", "<leader>zs", function() run_python({ split = "h", interactive = true }) end,
    { desc = "Run Python interactive (split)" })
keymap.set("n", "<leader>zc", function() run_python({ split = "v", interactive = true }) end,
    { desc = "Run Python interactive (vertical)" })
