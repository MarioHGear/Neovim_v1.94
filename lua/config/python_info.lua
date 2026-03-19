-- lua/config/python_info.lua
local M = {}

-- Devuelve la ruta completa del intérprete Python en uso
function M.get_current_python()
    -- 1. Prioridad: variable VIRTUAL_ENV (la forma más fiable)
    local venv = os.getenv('VIRTUAL_ENV')
    if venv then
        local python_in_venv = venv .. '/bin/python'
        if vim.fn.filereadable(python_in_venv) == 1 then
            return python_in_venv
        end
    end
    -- 2. Buscar en el PATH usando exepath (hereda de la terminal)
    local python = vim.fn.exepath('python') or vim.fn.exepath('python3')
    if python and python ~= '' then
        return python
    end
    -- 3. Fallback genérico
    return 'python'
end

-- Devuelve el nombre del entorno virtual (o "system" si es global)
function M.get_virtualenv_name()
    -- 1. Si existe VIRTUAL_ENV, lo usamos directamente
    local venv = os.getenv('VIRTUAL_ENV')
    if venv then
        return vim.fn.fnamemodify(venv, ":t")
    end
    -- 2. Si no, extraemos el nombre del directorio padre de 'bin' en la ruta del intérprete
    local python_path = M.get_current_python()
    -- Busca el patrón: cualquier directorio seguido de /bin/python
    local match = python_path:match("/([^/]+)/bin/python$")
    if match then
        return match
    end
    -- 3. Si no se encuentra, es el sistema
    return "system"
end

return M
