return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local db = require("dashboard")

    -- Load a quote from a local JSON file and return one per day
    local function daily_quote()
      local path = vim.fn.stdpath("data") .. "/misc/quotes.json"

      local file = io.open(path, "r")
      if not file then
        return "Stay sharp. (No quotes.json found)"
      end

      local content = file:read("*a")
      file:close()

      local ok, data = pcall(vim.json.decode, content)
      if not ok or type(data) ~= "table" then
        return "Stay sharp. (Invalid quotes.json)"
      end

      if #data == 0 then
        return "Stay sharp. (Empty quotes.json)"
      end

      -- deterministic daily selection
      local day = tonumber(os.date("%j"))
      local entry = data[(day % #data) + 1]

      if not entry or not entry.text then
        return "Stay sharp. (Malformed quote entry)"
      end

      local author = entry.from or "Unknown"
      return entry.text .. " — " .. author
    end
    
    ----------------------------------------------------------------------------
    -- Setup
    ----------------------------------------------------------------------------
    db.setup({
      theme = "hyper",

      config = {
        week_header = { enable = true },
        -- Projects

        -- Quick shortcuts
        shortcut = {
          {
            icon = "󰈞 ",
            desc = " Find File",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            icon = " ",
            desc = " Live Grep",
            group = "Label",
            action = "Telescope live_grep",
            key = "g",
          },
          {
            icon = " ",
            desc = " New File",
            group = "Label",
            action = "enew",
            key = "n",
          },
          {
            icon = "󰒲 ",
            desc = " Plugins",
            group = "Label",
            action = "Lazy",
            key = "l",
          },
          {
            icon = " ",
            desc = " Quit",
            group = "DiagnosticError",
            action = "qa",
            key = "q",
          },
        },
                
        -- Footer with daily quote
        footer = {
          "",
          daily_quote(),
          "",
        }
      },
    })
        local c = {
            title = "#cc6a00",
            alt = "#ffa248",
        }
        local hue = vim.api.nvim_set_hl
        -- Hopefully DashboardHeader color override
        hue(0, "DashboardHeader", { fg = c.alt, bold = true })
        hue(0, "DashboardProjectTitle", { fg = c.alt, bold = true })
        hue(0, "DashboardMRUTitle", { fg = c.alt, bold = true })
  end,
}

