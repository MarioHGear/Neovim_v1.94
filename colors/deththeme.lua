-- deththeme.lua - Tema personalizado para Neovim
-- Con soporte completo para treesitter y LSP

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background  = "dark"
vim.g.colors_name = "deththeme"

-- Paleta de colores
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

-- Asignación de roles semánticos
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

------------------------------------------------------------------------
-- 1. Grupos básicos de Vim
------------------------------------------------------------------------
local groups      = {
    Normal       = { fg = fg, bg = bg },
    LineNr       = { fg = gray },
    CursorLine   = { bg = gray3 },
    CursorLineNr = { fg = yellow, bold = true },
    Comment      = { fg = gray2, italic = true },
    String       = { fg = blue },
    Keyword      = { fg = red, bold = true },
    Function     = { fg = green },
    Type         = { fg = gray4 },
    Identifier   = { fg = fg },
    Operator     = { fg = orange },
    Variable     = { fg = green },
    Constant     = { fg = blue },
    PreProc      = { fg = red },
    Statement    = { fg = red },
    Delimiter    = { fg = orange },
    Special      = { fg = blue },
    ModeMsg      = { fg = "#d4d4d4", bold = false },
}

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end

------------------------------------------------------------------------
-- 2. Enlaces para grupos de Treesitter (esencial para Python)
------------------------------------------------------------------------
local treesitter_links = {
    -- Comentarios
    ["@comment"]               = "Comment",
    ["@comment.documentation"] = "SpecialComment",

    -- Constantes
    ["@constant"]              = "Constant",
    ["@constant.builtin"]      = "Special",
    ["@constant.macro"]        = "Define",

    -- Cadenas
    ["@string"]                = "String",
    ["@string.regex"]          = "String",
    ["@string.escape"]         = "SpecialChar",

    -- Caracteres
    ["@character"]             = "Character",
    ["@character.special"]     = "SpecialChar",

    -- Números
    ["@number"]                = "Number",
    ["@number.float"]          = "Float",

    -- Tipos
    ["@type"]                  = "Type",
    ["@type.builtin"]          = "Type",
    ["@type.definition"]       = "Typedef",

    -- Atributos / Propiedades
    ["@attribute"]             = "PreProc",
    ["@property"]              = "Identifier",

    -- Funciones
    ["@function"]              = "Function",
    ["@function.builtin"]      = "Special",
    ["@function.macro"]        = "Macro",
    ["@method"]                = "Function",
    ["@method.call"]           = "Function",

    -- Parámetros
    ["@parameter"]             = "Identifier",
    ["@parameter.reference"]   = "Identifier",

    -- Variables
    ["@variable"]              = "Normal",
    ["@variable.builtin"]      = "Special",

    -- Palabras clave
    ["@keyword"]               = "Keyword",
    ["@keyword.function"]      = "Keyword",
    ["@keyword.operator"]      = "Operator",
    ["@keyword.return"]        = "Keyword",
    ["@keyword.conditional"]   = "Conditional",
    ["@keyword.repeat"]        = "Repeat",
    ["@keyword.exception"]     = "Exception",

    -- Operadores
    ["@operator"]              = "Operator",

    -- Puntuación
    ["@punctuation.delimiter"] = "Delimiter",
    ["@punctuation.bracket"]   = "Delimiter",
    ["@punctuation.special"]   = "Special",

    -- Anotaciones (Python type hints)
    ["@annotation"]            = "PreProc",

    -- Módulos / imports
    ["@include"]               = "Include",
    ["@namespace"]             = "Structure",
}

for newgroup, linkto in pairs(treesitter_links) do
    vim.api.nvim_set_hl(0, newgroup, { link = linkto })
end

------------------------------------------------------------------------
-- 3. Grupos de diagnóstico del LSP
------------------------------------------------------------------------
local diagnostic_groups = {
    DiagnosticError          = { fg = red },
    DiagnosticWarn           = { fg = orange },
    DiagnosticInfo           = { fg = blue },
    DiagnosticHint           = { fg = gray2 },
    DiagnosticUnderlineError = { undercurl = true, sp = red },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = orange },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = blue },
    DiagnosticUnderlineHint  = { undercurl = true, sp = gray2 },
}

for group, opts in pairs(diagnostic_groups) do
    vim.api.nvim_set_hl(0, group, opts)
end

------------------------------------------------------------------------
-- 4. Grupos adicionales (LSP references, etc.)
------------------------------------------------------------------------
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = gray3 })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = gray3 })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = gray3 })

-- Operadores matemáticos de Python (sintaxis antigua, pero se mantiene)
vim.cmd([[
syntax match pythonMathOperator "[+\-*/%]"
syntax match pythonCompareOperator "[<>!=]=\?"
highlight link pythonMathOperator Operator
highlight link pythonCompareOperator Operator
]])

-- Mensaje final (opcional)
print("deththeme cargado con soporte para treesitter")
