# package manager
packer.nvim
## Cannot check out github
1. change the line in file ~\AppData\Local\nvim-data\site\pack\packer\start\packer.nvim\lua\packer.lua: 
    default_url_format = 'git@github.com:%s.git'
2. :PackerCompile
3. check the outfile at compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
4. :PackerSync or :PackerInstall [your-plugin]

#nerd font

## installation
### windows
need to install your favourite nerd font
https://github.com/ryanoasis/nerd-fonts#option-3-install-script
1. git clone git@github.com:ryanoasis/nerd-fonts.git
2. ./install.ps1 JetBrainsMono
3. select JetBrainsMono nerd font on windows terminal settings


# nvim-tree

## quick keys
a: create file or folder
x: cut file
y: copy filename
gy: copy filename with full path
Y: copy filename with relative


# telescope

telescope is used to fast navigation, fuzzy search etc.

## intallation
### windows
choco install ripgrep
choco install fd
### mac
brew install ripgrep
brew install fd
### ubuntu
0. install rust cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustc --version
1. install ripgrep
cargo install ripgrep
2 install fd
git clone https://github.com/sharkdp/fd
cd fd
cargo build
cargo install --path .

### :checkhealth telescope
1. Error: rg is not found. Refer to https://github.com/BurntSushi/ripgrep#installation.
2. WANING: fd not found. Install sharkdp/fd for extended capabilities. Check https://github.com/sharkdp/fd#installation.

## search

* search file
<space>f
* search string
<space>F

support grep args
1. search live_grep in lua files:
-g *lua live_grep
2. search live_grep in files other than lua:
-g !*.lua live_grep


## bookmarks
1. mm to toggle a bookmark
2. ma to show bookmarks in current file
3. mA to show all bookmarks in whole project

## breakpoints
1. <Leader>db to set a breakpoint
2. :Telescope dap list_breakpoints

## symbols
1. <space>s to search symbols in current file
2. <space>S to search symbols in project


# nvim treesitter
language parser for highlight and so on.

:checkhealth nvim-treesitter

# Trouble Shooting
Error executing lua callback: Failed to load parser: uv_dlopen: C:\Users\kiran\AppData\Local\nvim-d
ata\site\pack\packer\start\nvim-treesitter\parser\cpp.so is not a valid Win32 application.

If the start folder were copied from linux/mac, then delete nvim-treesitter under start and it will be compiled again.

Make sure GNU toolchain is available on Windows.
Mingw toolchain
(https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)
Install git (not required on newer versions of Windows 10, tar is installed and curl is bundled with Neovim)
Install MinGW toolchain
Via chocolatey: choco install mingw (in admin powershell)
Start Neovim in a refreshed environment: refreshenv
Install parsers in Neovim via :TSInstall c, :TSInstall cpp


# sniprun

## installation
### ubuntu
cd /home/yingly/.local/share/nvim/site/pack/packer/start/sniprun
./install


# dap
debug adapter.

## installation
### mac
1. brew install llvm, lldb-vscode is under /usr/local/Cellar/llvm/14.0.6_1/bin
2. config cppdbg in /Users/luyaoying/github-repos/dotfiles/nvim/lua/user/dap/dap-cpp.lua


# tmux

## quick keys
ctrl + a, " to split horizontal
ctrl + a, % to split vertical
ctrl + h/j/k/l to move betweem nvim and tmux

