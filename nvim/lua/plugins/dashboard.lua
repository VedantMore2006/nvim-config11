local M = {}

M.setup = function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  -- 🎨 Custom Arch Linux ASCII Art
  dashboard.section.header.val = {

    "                  -`                   ",
    "                 .o+`                  ",
    "                `ooo/                  ",
    "               `+oooo:                 ",
    "              `+oooooo:                ",
    "              -+oooooo+:               ",
    "            `/:-:++oooo+:              ",
    "           `/++++/+++++++:             ",
    "          `/++++++++++++++:            ",
    "         `/+++ooooooooooooo/`          ",
    "        ./ooosssso++osssssso+`         ",
    "       .oossssso-````/ossssss+`        ",
    "     :osssssss/        osssso+++.      ",
    "    /ossssssss/        +ssssooo/-      ",
    "  `/ossssso+/:-        -:/+osssso+-    ",
    " `+sso+:-`                 `.-/+oso:   ",
    "`++:.                           `-/+/  ",
    ".`                                 `/  ",
    "                                       ",
    "             GARUDA LINUX              ",
  }

  -- 🔥 Quick Action Buttons
  dashboard.section.buttons.val = {
    dashboard.button("e", "📜  New File", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),
    dashboard.button("r", "🕰  Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("p", "📁  Projects", ":Telescope projects<CR>"), -- New
    dashboard.button("g", "🔗  Git Status", ":Gitsigns diffthis<CR>"), -- New
    dashboard.button("s", "⚙️  Settings", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "🚪  Quit", ":qa<CR>"),
  }

  -- 🖥 Display System Info (Arch Linux, Kernel, Uptime)
  local handle = io.popen("uname -r")
  local kernel = handle:read("*a") or "Unknown"
  handle:close()

  local handle2 = io.popen("uptime -p")
  local uptime = handle2:read("*a") or "Unknown"
  handle2:close()

  dashboard.section.footer.val = {
    "󰍹 Kernel: " .. kernel:gsub("\n", ""),
    "󰄉 Uptime: " .. uptime:gsub("\n", ""),
    "🚀 Ready to Code!",
  }

  -- 🎨 Set Colors & Layout
  dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.opts)
end

return M
