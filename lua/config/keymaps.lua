local keymap = vim.keymap

-- Guardar
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":w | bd | Alpha<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-s>", ":w<CR>")

-- Debugger

keymap.set("n", "<leader>bc", function() require("dap").continue() end)
keymap.set("n", "<leader>bn", function() require("dap").step_over() end)
keymap.set("n", "<leader>bi", function() require("dap").step_into() end)
keymap.set("n", "<leader>bo", function() require("dap").step_out() end)
keymap.set("n", "<leader>bb", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

-- Run Python
keymap.set("n", "<leader>za", function()
    vim.cmd("write")
    vim.cmd("botright split")
    vim.cmd("resize 12")
    vim.cmd("terminal /home/deth/Desktop/01001101/Python_code/Python_exercice/engine/bin/python " .. vim.fn.expand("%"))
    vim.cmd("startinsert")
end, { desc = "Run Python in terminal split" })

keymap.set("n", "<leader>zv", function()
    vim.cmd("write")
    vim.cmd("botright vsplit")
    vim.cmd("vertical resize 80")
    vim.cmd("terminal /home/deth/Desktop/01001101/Python_code/Python_exercice/engine/bin/python " .. vim.fn.expand("%"))
    vim.cmd("startinsert")
end, { desc = "Run Python in vertical split" })


-- Run Python en modo interactivo (con -i)
keymap.set("n", "<leader>zs", function()
    vim.cmd("write")
    vim.cmd("botright split")
    vim.cmd("resize 12")
    -- Usamos el mismo intérprete pero con el flag -i
    vim.cmd("terminal /home/deth/Desktop/01001101/Python_code/Python_exercice/engine/bin/ipython -i " ..
    vim.fn.expand("%"))
    vim.cmd("startinsert")
end, { desc = "Run Python interactively in terminal split (with -i)" })

keymap.set("n", "<leader>zc", function()
    vim.cmd("write")
    vim.cmd("botright vsplit")
    vim.cmd("vertical resize 80")
    vim.cmd("terminal /home/deth/Desktop/01001101/Python_code/Python_exercice/engine/bin/ipython -i " ..
    vim.fn.expand("%"))
    vim.cmd("startinsert")
end, { desc = "Run Python interactively in vertical split (with -i)" })
