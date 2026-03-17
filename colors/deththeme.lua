vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background  = "dark"
vim.g.colors_name = "deththeme"

-- Paleta (igual que antes)
local colors      = {
    black0    = "#181818",
    black1    = "#1E222A",
    gray0     = "#ABABAB",
    gray1     = "#242424",
    white_alt = "#C0C8D8",
    white0    = "#DEDDDA",
    white1    = "#D8DEE9",
    white2    = "#E5E9F0",
    white3    = "#ECFFF4",
    gray2     = "#80868B",
    gray4     = "#4C566A",
    blue0     = "#5E81AC",
    cyan      = "#8FBCBB",
    red       = "#EA6962",
    orange    = "#D08770",
    yellow    = "#ebcb8b",
    green     = "#7DAEA3",
    magenta   = "#B48EAD",
    blue1     = "#83AFF0",
    cyan_b    = "#9FC6C5",
    red_b     = "#C5727A",
    orange_b  = "#D79784",
    green_b   = "#B1C89D",
    magenta_b = "#BE9DB8",
    cyan_d    = "#80B3B2",
    orange_d  = "#CB775D",
    green_d   = "#97B67C",
    magenta_d = "#A97EA1",
}

-- Asignación de roles
local fg          = colors.white0
local bg          = colors.black0
local gray        = colors.gray4
local blue        = colors.blue1
local green       = colors.green
local yellow      = colors.yellow
local red         = colors.red
local gray2       = colors.gray2
local gray3       = colors.gray1
local gray4       = colors.gray0
local orange      = colors.orange

-- Definir grupos en una tabla (solo los que necesitas)
local groups      = {
    Normal       = { fg = fg, bg = bg },
    LineNr       = { fg = gray },                 --DONE
    CursorLine   = { bg = gray3 },                --DONE
    CursorLineNr = { fg = yellow, bold = true },  --DONE
    Comment      = { fg = gray2, italic = true }, --DONE
    String       = { fg = blue },                 --DONE
    Keyword      = { fg = red, bold = true },     --DONE
    Function     = { fg = green },                --DONE
    Type         = { fg = gray4 },
    Identifier   = { fg = fg },
    Operator     = { fg = orange },
    Variable     = { fg = green },
    Constant     = { fg = blue }, --DONE
    PreProc      = { fg = red },  --DONE
    Statement    = { fg = red }   --DONE

    -- Puedes añadir más grupos aquí (por ejemplo, para Treesitter)
}

-- Aplicar todos los grupos
for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end

-- operadores matemáticos de python
vim.cmd([[
syntax match pythonMathOperator "[+\-*/%]"
syntax match pythonCompareOperator "[<>!=]=\?"
highlight link pythonMathOperator Operator
highlight link pythonCompareOperator Operator
]])

-- otros grupos útiles
vim.api.nvim_set_hl(0, "Delimiter", { fg = orange })
vim.api.nvim_set_hl(0, "Special", { fg = blue })
vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#d4d4d4", bold = false })
