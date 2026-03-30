local M = {}

local function send_osc52(text)
  local encoded = vim.base64.encode(text)
  local seq
  if vim.env.TMUX then
    -- Wrap in DCS passthrough for tmux; inner ESC must be doubled
    seq = '\x1bPtmux;\x1b\x1b]52;c;' .. encoded .. '\x07\x1b\\'
  else
    seq = '\x1b]52;c;' .. encoded .. '\x07'
  end
  local tty = io.open('/dev/tty', 'w')
  if tty then
    tty:write(seq)
    tty:close()
  end
end

-- Yank using `keys` into register z, return the text, then restore register z.
-- Never touches the unnamed register.
local function yank_to_text(keys)
  local save = vim.fn.getreg('z')
  local savetype = vim.fn.getregtype('z')
  local k = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(k, 'nx', false)
  local text = vim.fn.getreg('z')
  vim.fn.setreg('z', save, savetype)
  return text
end

-- Called by operatorfunc after a cp{motion}
function M.operator(type)
  if type == 'char' then
    send_osc52(yank_to_text('`[v`]"zy'))
  elseif type == 'line' then
    send_osc52(yank_to_text('`[V`]"zy'))
  elseif type == 'block' then
    send_osc52(yank_to_text('`[<C-V>`]"zy'))
  end
end

-- cpp: copy [count] lines
function M.copy_line()
  send_osc52(yank_to_text(vim.v.count1 .. '"zyy'))
end

-- Visual cp: copy selection
function M.copy_visual()
  send_osc52(yank_to_text('gv"zy'))
end

function M.setup()
  -- Expose operator so operatorfunc can reference it via v:lua
  _G._system_copy_operator = M.operator

  -- cp{motion}: e.g. cpiw, cpi', cp5j
  vim.keymap.set('n', 'cp', function()
    vim.opt.operatorfunc = 'v:lua._system_copy_operator'
    return 'g@'
  end, { expr = true, desc = 'Copy to system clipboard' })

  -- cpp / 5cpp: copy [count] lines
  vim.keymap.set('n', 'cpp', M.copy_line, { desc = 'Copy line(s) to system clipboard' })

  -- Visual cp
  vim.keymap.set('x', 'cp', M.copy_visual, { desc = 'Copy selection to system clipboard' })
end

return M
