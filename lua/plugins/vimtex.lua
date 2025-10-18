return {
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    -- mappings = {
    --   ['<localleader>l'] = {
    --     name = '+VimTeX',
    --     a = 'Show Context Menu',
    --   },
    -- },

    init = function()
      -- VimTeX configuration goes here
      vim.g.vimtex_view_method = 'zathura'
      -- vim.o.conceallevel = 1
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_conceal = 'abdmg'
      vim.g.vimtex_compiler_method = 'latexmk'
      --
      vim.cmd [[highlight Conceal guifg=#FFF guibg=none]]
      vim.g.vimtex_text_obj_enabled = 0
    end,
  },
}
