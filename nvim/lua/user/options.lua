local options = {
  -- [[ context ]]
  cmdheight = 1,                           -- keep status bar position close to bottom
  colorcolumn = '80',                      -- show col for max line length
  cursorline = true,                       -- highlight the current line
  cursorcolumn = false,                    -- cursor column.
  number = true,                           -- set numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  pumheight = 10,                          -- pop up menu height
  relativenumber = false,                  -- set relative numbered lines
  scrolloff = 4,                           -- keep 8 height offset from above and bottom
  sidescrolloff = 4,                       -- keep 8 width offset from left and right
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line

  -- [[ File ]]
  backup = false,                          -- creates a backup file
  conceallevel = 0,                        -- so that `` is visible in markdown files
  encoding = "utf-8",                      -- string encoding to use
  fileencoding = "utf-8",                  -- the encoding written to a file
  swapfile = false,                        -- creates a swapfile
  undofile = true,                         -- enable persistent undo
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

  -- [[ Theme ]]
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  syntax = "ON",                           -- allow syntax highlighting
  termguicolors = true,                    -- set term gui colors (most terminals support this)

  -- [[ Search ]]
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  incsearch = true,                        -- use incremental search
  smartcase = true,                        -- smart case

  -- [[ Whitespace ]]
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  showtabline = 4,                         -- always show tabs
  smartindent = true,                      -- make indenting smarter again
  softtabstop = 4,                         -- number of spaces a tab counts for in insert mode
  tabstop = 4,                             -- number of spaces a tab counts for

  -- [[ Splits ]]
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  diffopt="vertical,filler,internal,context:4",  -- vertical diff split view

  -- [[ System ]]
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  mouse = "a",                             -- allow the mouse to be used in neovim
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  spell = false,                           -- add spell support
  spelllang = { 'en_us' },                 -- support which languages?

  -- [[ Fold ]]
  foldmethod = "indent",                   -- fold with nvim_treesitter
  foldenable = false,                      -- no fold to be applied when open a file
  foldlevel = 99,                          -- if not set this, fold will be everywhere

  -- [[ Plugins ]]
  cscopequickfix="s-,c-,d-,i-,t-,e-",      -- cscope output to quickfix window
  -- foldexpr = "nvim_treesitter#foldexpr()",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work


-- WSL yank support
vim.cmd [[
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
]]
