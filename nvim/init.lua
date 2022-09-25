local gon = require("get_os_name")
is_windows_os = gon.get_os_name() == "Windows"

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.utils"

require "user.conf"
require "user.lsp"
require "user.dap"
