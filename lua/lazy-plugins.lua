-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info

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
  require 'plugins.autopairs',
  require 'plugins.blink',
  require 'plugins.conform',
  require 'plugins.copilot',
  require 'plugins.debug',
  require 'plugins.gitsigns',
  require 'plugins.guess-indent',
  require 'plugins.indent_line',
  require 'plugins.lazydevl',
  require 'plugins.lint',
  require 'plugins.mini',
  require 'plugins.neo-tree',
  require 'plugins.nvim-lspconfig',
  require 'plugins.nvim-treesitter',
  require 'plugins.telescope',
  require 'plugins.todo-comments',
  require 'plugins.tokyonight',
  require 'plugins.venv-selector',
  require 'plugins.vim-commentary',
  require 'plugins.vimtex',
  require 'plugins.which-key',
}, {
  ui = {
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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
