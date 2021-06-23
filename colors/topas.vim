
set background="#272822"
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "topas"

"hi Error       ctermfg=89  ctermbg=233 cterm=NONE guifg=#960050 guibg=#1e0010 gui=NONE

" Brownish comments
"hi Comment     ctermfg=95  ctermbg=NONE cterm=NONE guifg=#883333 guibg=NONE gui=NONE
hi Comment     ctermfg=242  ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE

hi Keyword     ctermfg=81  ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi Namespace   ctermfg=197  ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Type        ctermfg=81 ctermbg=NONE cterm=italic guifg=#66d9ef guibg=NONE gui=italic

hi Operator    ctermfg=197  ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE

hi Punctuation ctermfg=255  ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE

hi Name        ctermfg=255  ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi Attribute   ctermfg=148  ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Class       ctermfg=208  ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=NONE
hi Constant    ctermfg=81  ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi Decorator   ctermfg=148  ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Exception   ctermfg=148  ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Function    ctermfg=148  ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Other       ctermfg=148  ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Tag         ctermfg=197  ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE

hi Number      ctermfg=141  ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE

hi Literal     ctermfg=141  ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Date        ctermfg=186  ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE

hi String      ctermfg=186  ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi Escape      ctermfg=141  ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE

hi Deleted     ctermfg=197  ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Emph        ctermfg=NONE ctermbg=NONE cterm=italic guifg=NONE guibg=NONE gui=italic
hi Inserted    ctermfg=148  ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Strong      ctermfg=NONE ctermbg=NONE cterm=bold guifg=NONE    guibg=NONE gui=bold
hi Subheading  ctermfg=242  ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE

