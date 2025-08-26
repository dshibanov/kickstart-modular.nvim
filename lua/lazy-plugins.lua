-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- modular approach: using `require 'path.name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'kickstart.plugins.gitsigns',

  require 'kickstart.plugins.which-key',

  require 'kickstart.plugins.telescope',

  require 'kickstart.plugins.lspconfig',

  require 'kickstart.plugins.conform',

  require 'kickstart.plugins.blink-cmp',

  require 'kickstart.plugins.tokyonight',

  require 'kickstart.plugins.todo-comments',

  require 'kickstart.plugins.mini',

  require 'kickstart.plugins.treesitter',

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  {
    'neanias/everforest-nvim',
    version = false, -- Use the latest commit (or you can set a version)
    lazy = false, -- Load immediately (not lazily)
    priority = 1000, -- High priority to ensure late override
    config = function()
      require('everforest').setup {
        -- Optional settings:
        background = 'hard', -- Options: "soft", "medium", "hard"
        -- transparent_background_level = 0,   -- 0 = opaque, higher = more transparent
        -- italics = false,
        -- disable_italic_comments = false,
        -- sign_column_background = "none",    -- or "grey"
        ui_contrast = 'low', -- or "high"
        -- dim_inactive_windows = false,
        -- diagnostic_text_highlight = false,
        -- diagnostic_virtual_text = "coloured",
        -- diagnostic_line_highlight = false,
        -- spell_foreground = false,
        -- show_eob = true,
        -- float_style = "bright",             -- or "dim"
      }
      vim.cmd.colorscheme 'everforest'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { -- optional, for light/dark switching
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = { enabled = false, shade = 'dark', percentage = 0.15 },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        integrations = {}, -- see docs for full list
      }
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        theme = 'wave', -- Options: "wave", "dragon", "lotus"
        background = { dark = 'wave', light = 'lotus' },
      }
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },

  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'medium' -- "soft", "medium", "hard"
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_disable_italic_comment = 0
      vim.g.gruvbox_material_show_eob = 1
      vim.g.gruvbox_material_float_style = 'bright'
      vim.g.gruvbox_material_diagnostic_text_highlight = 0
      vim.g.gruvbox_material_diagnostic_line_highlight = 0
      vim.g.gruvbox_material_diagnostic_virtual_text = 'coloured'
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
      vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
    end,
  },
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
