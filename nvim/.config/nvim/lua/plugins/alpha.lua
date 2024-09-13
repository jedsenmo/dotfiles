return {
  'goolord/alpha-nvim',
  event = 'VimEnter', -- load plugin after all configuration is set
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local fortune = require 'alpha.fortune'

    vim.api.nvim_set_hl(0, 'HeaderColor', { fg = '#99D5FB', bg = 'NONE' }) -- Example color

    local header = {
      [[                                                                   ]],
      [[      ████ ██████           █████      ██                    ]],
      [[     ███████████             █████                            ]],
      [[     █████████ ███████████████████ ███   ███████████  ]],
      [[    █████████  ███    █████████████ █████ ██████████████  ]],
      [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
      [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
      [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
    }

    -- Make the header a bit more fun with some color!
    local function colorize_header()
      local lines = {}

      for i, chars in pairs(header) do
        local line = {
          type = 'text',
          val = chars,
          opts = {
            hl = 'HeaderColor',
            shrink_margin = false,
            position = 'center',
          },
        }

        table.insert(lines, line)
      end

      return lines
    end

    -- Alpha configuration
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '󱞁   New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('p', '   Projects', ':execute "Neotree dir=~/Documents/projects" <BAR> execute "FileInDirectory" <CR>'),
      dashboard.button('f', '   Find file', ':Telescope find_files <CR>'),
      dashboard.button('r', '   Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('c', '   Config', ':e $MYVIMRC <CR>'),
      dashboard.button('m', '󱌣   Mason', ':Mason<CR>'),
      dashboard.button('l', '󰒲   Lazy', ':Lazy<CR>'),
      dashboard.button('u', '󰂖   Update plugins', "<cmd>lua require('lazy').sync()<CR>"),
      dashboard.button('q', '   Quit NVIM', ':qa<CR>'),
    }

    dashboard.section.footer.val = fortune()

    local group = vim.api.nvim_create_augroup('CleanDashboard', {})

    alpha.setup {
      layout = {
        { type = 'padding', val = 5 },
        { type = 'group',   val = colorize_header() },
        { type = 'padding', val = 2 },
        dashboard.section.buttons,
        dashboard.section.footer,
      },
      opts = { margin = 5 },
    }
  end,
}
