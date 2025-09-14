local ls = require 'luasnip'
local s = ls.snippet
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node
local rep = require('luasnip.extras').rep

return {
  -- normal snippets
  s('sub', { t '\\subsection*{', i(1), t '}' }),
  s('set', { t '{', i(1), t '}' }),
  s('enum', { t { '\\begin{enumerate}', '' }, i(1), t { '', '\\end{enumerate}' } }),
  s('item', { t { '\\begin{itemize}', '' }, i(1), t { '', '\\end{itemize}' } }),
  s('sum', { t '\\sum_{', i(1, 'n = 1'), t '}^{', i(2, '\\infty'), t '} ' }),
  s('lim', { t '\\lim_{', i(1, 'n'), t ' \\to ', i(2, '\\infty'), t '} ' }),
}, {
  -- autosnippets
  s('mk', { t '$', i(1), t '$' }),
  s('dm', { t { '', '$$ ' }, i(1), t ' $$' }),
  s({ trig = 'sr', wordTrig = false }, { t '^2' }),
  s({ trig = 'cb', wordTrig = false }, { t '^2' }),
  s({ trig = 'td', wordTrig = false }, { t '^{', i(1), t '}' }),
  s({ trig = 'sqr' }, { t '\\sqrt{', i(1), t '}' }),

  s('nind', { t { '\\noindent', '' } }),
  s('eps', t { '\\epsilon' }),
  s('**', { t '\\textbf{', i(1), t '}' }),
  s('//', { t '\\frac{', i(1), t '}{', i(2), t '}' }),
  s('beg', { t '\\begin{', i(1), t '}', t { '', '' }, i(2), t { '', '' }, t '\\end{', rep(1), t '}' }),
  s('vsp', { t { '\\vspace{1em}', '' } }),

  -- for single digit subscripts trigger word is <word><number>
  s({ trig = '[A-Za-z](%d)', regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      local letter = snip.trigger:match '([A-Za-z])'
      local number = snip.trigger:match '%d+'
      return letter .. '_{' .. number .. '}'
    end, {}),
  }),

  -- for double digit subscripts trigger word is <word>_<number><number>
  s({ trig = '[A-Za-z]_(%d%d)', regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      local letter = snip.trigger:match '([A-Za-z])'
      local number = snip.trigger:match '%d%d'
      return letter .. '_{' .. number .. '}'
    end, {}),
  }),

  s({ trig = '[A-Za-z](%d)', regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      local letter = snip.trigger:match '([A-Za-z])'
      local number = snip.trigger:match '%d+'
      return letter .. '_{' .. number .. '}'
    end, {}),
  }),
}
