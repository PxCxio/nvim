-- filetype plugin on is default in Neovim
vim.opt.omnifunc = 'syntaxcomplete#Complete'
vim.opt.encoding = 'utf-8'
vim.opt.tabstop = 4
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.mouse = 'a'
-- vim.opt.foldmethod = 'manual' -- Not directly supported in Neovim


-- Consider using a plugin like nvim-fold-manual for custom folding

vim.opt.paste = true



-- caoSED.vim equivalent
vim.api.nvim_set_keymap('n', '<leader>cao', ':%s/<C-r>a/<C-r>b/g<left><left><left><CR>', { noremap = true })

-- daf_vaf.vim equivalent
vim.api.nvim_set_keymap('n', 'daf', '$%v%0x<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'vaf', '$%v%0h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'dif', '$wvb%bx<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'cif', '$wvb%bxi<CR>', { noremap = true })

-- Vim Freeze 



g = {
    split_opened = false,
    frozen_line = 0,
    frozen_line_top = 0,
    frozen_line_bottom = 0,
    is_frozen_active = false,
}

function ToggleSplit()
    if g.split_opened then
        if vim.fn.winnr('$') == 1 then
            return
        end
        vim.cmd('wincmd o')
        g.split_opened = false
        g.frozen_line_top = 0
        g.frozen_line_bottom = 0
        g.is_frozen_active = false
    else
        if not g.is_frozen_active then
            g.is_frozen_active = true
        end

        local target_line = vim.fn.line('.')
        g.frozen_line = target_line
        g.frozen_line_top = target_line - 2
        g.frozen_line_bottom = target_line + 18

        vim.cmd('split')
        vim.fn.cursor(target_line, 0)
        vim.cmd('normal! mz')
		vim.cmd('set scrollbind')
			

        local winheight = vim.fn.winheight(0)
        local resize_count = winheight / 5
        vim.fn.win_execute(0, 'resize -' .. resize_count)

        vim.cmd('wincmd p')
        vim.fn.cursor(target_line, 0)

        g.split_opened = true
    end
end

function AutoToggleSplit()
    if g.split_opened and vim.fn.line('.') < g.frozen_line_top then
        if vim.fn.winnr('$') == 1 then
            return
        end
        vim.cmd('wincmd o')
        g.split_opened = 0
    elseif not g.split_opened and vim.fn.line('.') >= g.frozen_line_bottom
        and vim.fn.line('.') <= vim.fn.line('$') - 14 and g.frozen_line ~= 0 and g.is_frozen_active then
        local target_line = vim.fn.line('.') - g.frozen_line_bottom + g.frozen_line

        vim.cmd('normal! mz')
        vim.cmd('split')
        vim.fn.cursor(target_line, 0)

        local winheight = vim.fn.winheight(0)
        local resize_count = winheight / 5
		vim.fn.win_execute(0, 'resize -' .. resize_count)

        vim.cmd('wincmd p')
        vim.fn.cursor(g.frozen_line, 0)

        g.split_opened = 1
    end
end

vim.api.nvim_command('autocmd CursorMoved,WinScrolled * lua AutoToggleSplit()')
vim.keymap.set('n', '<leader>fr',ToggleSplit, { noremap = true })

--[[
"ctrlp ext
let g:ctrlp_extensions = get(g:, 'ctrlp_extensions', []) + ['spelunker']
let g:matchup_matchparen_insert_mode = 0

let g:matchup_surround_enabled = 1

:hi SpellBad ctermfg=green guifg=blue
]]--

-- Configure matchup (replace with actual plugin-specific configuration if needed)
vim.g.matchup_matchparen_insert_mode = 0
vim.g.matchup_surround_enabled = 1

-- Configure spell checking
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.cmd('hi SpellBad ctermfg=green guifg=blue')

-- Dynamic relative line numbers
vim.cmd [[syntax on]]
vim.opt.number = true
vim.opt.relativenumber = true

-- Set relativenumber on BufEnter and FocusGained
vim.api.nvim_exec([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
]], false)


 vim.wo.relativenumber = true

-- Set Vim Undo
USER = os.getenv("USERNAME")
local curr_group = "users"  -- No direct equivalent to Unix groups in Windows

SWAPDIR = vim.fn.stdpath("data") .. "\\swap\\"
BACKUPDIR = vim.fn.stdpath("data") .. "\\backup\\"
UNDODIR = vim.fn.stdpath("data") .. "\\undo\\"

if vim.fn.isdirectory(SWAPDIR) == 0 then
    vim.fn.mkdir(SWAPDIR, "p", "700")
end

if vim.fn.isdirectory(BACKUPDIR) == 0 then
    vim.fn.mkdir(BACKUPDIR, "p", "700")
end

if vim.fn.isdirectory(UNDODIR) == 0 then
    vim.fn.mkdir(UNDODIR, "p", "700")
end

vim.opt.directory = SWAPDIR
vim.opt.backupdir = BACKUPDIR
vim.opt.undodir = UNDODIR
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
        vim.o.backupext = extension
    end,
})



-- vim.opt.undodir = os.getenv("HOME") .. "\\AppData\\Local\\nvim\\undo"

local digraph_map = {
  ks = "ₖ",
  as = "\u{2090}",
  es = "\u{2091}",
  hs = "\u{2095}",
  is = "\u{1D62}",
  js = "\u{2C7C}",
  ls = "\u{2097}",
  ms = "\u{2098}",
  ns = "\u{2099}",
  os = "\u{2092}",
  ps = "\u{209A}",
  rs = "\u{1D63}",
  ss = "\u{209B}",
  ts = "\u{209C}",
  s = "\u{1D64}",
  vs = "\u{1D65}",
  xs = "\u{2093}",
  aS = "\u{1d43}",
  bS = "\u{1d47}",
  cS = "\u{1d9c}",
  dS = "\u{1d48}",
  eS = "\u{1d49}",
  fS = "\u{1da0}",
  gS = "\u{1d4d}",
  hS = "\u{02b0}",
  iS = "\u{2071}",
  jS = "\u{02b2}",
  kS = "\u{1d4f}",
  lS = "\u{02e1}",
  mS = "\u{1d50}",
  nS = "\u{207f}",
  oS = "\u{1d52}",
  pS = "\u{1d56}",
  rS = "\u{02b3}",
  sS = "\u{02e2}",
  tS = "\u{1d57}",
  S = "\u{1d58}",
  vS = "\u{1d5b}",
  wS = "\u{02b7}",
  xS = "\u{02e3}",
  yS = "\u{02b8}",
  zS = "\u{1dbb}",
  AS = "\u{1D2C}",
  BS = "\u{1D2E}",
  DS = "\u{1D30}",
  ES = "\u{1D31}",
  GS = "\u{1D33}",
  HS = "\u{1D34}",
  IS = "\u{1D35}",
  JS = "\u{1D36}",
  KS = "\u{1D37}",
  LS = "\u{1D38}",
  MS = "\u{1D39}",
  NS = "\u{1D3A}",
  OS = "\u{1D3C}",
  PS = "\u{1D3E}",
  RS = "\u{1D3F}",
  TS = "\u{1D40}",
  US = "\u{1D41}",
  VS = "\u{2C7D}",
  WS = "\u{1D42}"
}


local function handle_digraph()
  -- Get the current mode
  local mode = vim.api.nvim_get_mode().mode

  if mode ~= "i" then
    return
  end

-- Get the next two characters
    local char1 = vim.fn.nr2char(vim.fn.getchar())
    local char2 = vim.fn.nr2char(vim.fn.getchar())

  -- Construct the digraph key
  local digraph_key = char1 .. char2

  -- Check if the digraph is defined
  local unicode_char = digraph_map[digraph_key]
  if unicode_char then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(unicode_char, true, true, true), "i", false)
  end
end

vim.api.nvim_set_keymap('i', '<C-k>', '<Cmd>lua handle_digraph()<CR>', { noremap = true })


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set Leader Key
vim.api.nvim_set_keymap('n', '\\v', '<c-v>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader><space>', '<c-space>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>e', '<c-E>', { noremap = true })



require('lazy').setup({
'neovim/nvim-lspconfig',
dependencies = {
'williambowman/mason.nvim',
'williambowman/mason-lspconfig.nvim',
'WhoIsSethDaniel/mason-tool-installer.nvim',

-- Useful Status updates for LSP
-- NOTE `opts = {}` is the same as calling `require('fidget').setup({})`
   { 'j-hui/fidget.nvim', opts = {} },

},
"mipmip/vim-scimark" ,
"junegunn/vim-easy-align" , 
"rstacruz/sparkup" ,
"tpope/vim-surround" ,
"kamykn/spelunker.vim" ,
"kamykn/popup-menu.nvim" ,
"ctrlpvim/ctrlp.vim" ,
"tomlion/vim-solidity" ,
"andymass/vim-matchup" ,
"mbbill/undotree" ,
"dhruvasagar/vim-table-mode" ,
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },


})
--[[ Initialize packer.nvim
require("packer").startup({
  -- Use the specified directory for plugins
  config = {
    -- Avoid loading plugins from standard Vim directories
    disable_installed = true,
    -- Consider adding a file watcher for automatic updates (optional)
    -- auto_clean = true,
    -- Install missing plugins on startup (optional)
    -- install_upon_startup = true,
  },
  -- Plugins
  plugins = {
    -- Replace placeholders with actual plugin names from your vimrc
    { "mipmip/vim-scimark" },
    { "junegunn/vim-easy-align" }, -- Shorthand notation fetches from GitHub
    { "rstacruz/sparkup" },
    { "tpope/vim-surround" },
    { "kamykn/spelunker.vim" },
    { "kamykn/popup-menu.nvim" },
    { "ctrlpvim/ctrlp.vim" },
    { "tomlion/vim-solidity" },
    { "andymass/vim-matchup" },
    { "mbbill/undotree" },
    { "dhruvasagar/vim-table-mode" },
    -- Add other plugins from your vimrc here
  },
  -- Set the install directory (adjust if necessary)
  -- This should be the same directory defined in `plugin_dir`
  compile = {
    dir = plugin_dir,
  },
})

-- Use packer.nvim's init.lua function to install and configure plugins
packager.compile()
]]--
