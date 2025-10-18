local ls = require 'luasnip'
local s = ls.snippet
local f = ls.function_node
local sn = ls.sn
local t = ls.text_node
local i = ls.insert_node
local rep = require('luasnip.extras').rep
local d = ls.dynamic_node

return {
  -- normal snippets
  s('sub', { t '\\subsection*{', i(1), t '}' }),
  s('set', { t '\\{', i(1), t '\\}' }),
  s('enum', { t { '\\begin{enumerate}', '\t' }, i(1), t { '', '\\end{enumerate}' } }),
  s('item', { t { '\\begin{itemize}', '\t' }, i(1), t { '', '\\end{itemize}' } }),
  s('ali', { t { '\\begin{align*}', '\t' }, i(1), t { '', '\\end{align*}' } }),
  s('sum', { t '\\sum_{', i(1, 'n = 1'), t '}^{', i(2, '\\infty'), t '} ' }),
  s('lim', { t '\\lim_{', i(1, 'n'), t ' \\to ', i(2, '\\infty'), t '} ' }),
  s('b', { t '\\bigg' }),
  s('qq', { t '\\qquad ' }),
  s('q', { t '\\quad ' }),
  s('p', { t '\\left ( ', i(1), t ' \\right )' }),
  s('|', { t '\\left | ', i(1), t ' \\right |' }),
  s('tx', { t '\\text{ ', i(1), t ' }' }),
}, {
  -- autosnippets
  s('mk', { t '$', i(1), t '$' }),
  s('dm', { t { '', '\\[', '' }, t '\t', i(1), t { '', '\\]' } }),
  s({ trig = 'sr', wordTrig = false }, { t '^2' }),
  s({ trig = 'cb', wordTrig = false }, { t '^3' }),
  s({ trig = 'td', wordTrig = false }, { t '^{', i(1), t '}' }),
  s({ trig = 'sqr' }, { t '\\sqrt{', i(1), t '}' }),

  s('nind', { t { '\\noindent', '' } }),
  s('eps', t { '\\epsilon' }),
  s('omg', t { '\\omega' }),
  s('Omg', t { '\\Omega' }),
  s('inft', t { '\\infty' }),
  s('frl', t { '\\forall' }),
  s('ext', t { '\\exists' }),
  s('**', { t '\\textbf{', i(1), t '}' }),
  s('xx', { t '\\cdot' }),
  s('//', { t '\\frac{', i(1), t '}{', i(2), t '}' }),
  s('beg', { t '\\begin{', i(1), t '}', t { '', '\t' }, i(2), t { '', '' }, t '\\end{', rep(1), t '}' }),
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

  -- fractions, trigger word is (<random stuff>)/ which goes to \frac{<random><stuff>}{}
  s({ trig = '%((.*)%)%/', regTrig = true, wordTrig = false }, {
    d(1, function(_, snip)
      local letter = snip.trigger:match '%(([^)]+)%)'
      return sn(nil, {
        t('\\frac{' .. letter .. '}{'),
        i(1), -- now you can insert!
        t '}',
      })
    end, {}),
  }),

  s({ trig = '%w+/', regTrig = true, wordTrig = false }, {
    d(1, function(_, snip)
      local letter = snip.trigger:match '(%w+)/'
      return sn(nil, {
        t('\\frac{' .. letter .. '}{'),
        i(1), -- now you can insert!
        t '}',
      })
    end, {}),
  }),
}
