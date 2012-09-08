" Vim color file - zenburn
" Generated by http://bytefluent.com/vivify 2012-09-08
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "zenburn"

hi IncSearch guifg=#385f38 guibg=#f8f893 guisp=#f8f893 gui=NONE ctermfg=65 ctermbg=228 cterm=NONE
hi WildMenu guifg=#cbecd0 guibg=#2c302d guisp=#2c302d gui=underline ctermfg=194 ctermbg=236 cterm=underline
hi SignColumn guifg=#9fafaf guibg=#181818 guisp=#181818 gui=bold ctermfg=109 ctermbg=234 cterm=bold
hi SpecialComment guifg=#82a282 guibg=NONE guisp=NONE gui=bold ctermfg=108 ctermbg=NONE cterm=bold
hi Typedef guifg=#dfe4cf guibg=NONE guisp=NONE gui=bold ctermfg=187 ctermbg=NONE cterm=bold
hi Title guifg=#efefef guibg=NONE guisp=NONE gui=bold ctermfg=255 ctermbg=NONE cterm=bold
hi Folded guifg=#93b3a3 guibg=#3f4040 guisp=#3f4040 gui=NONE ctermfg=108 ctermbg=238 cterm=NONE
hi PreCondit guifg=#dfaf8f guibg=NONE guisp=NONE gui=bold ctermfg=180 ctermbg=NONE cterm=bold
hi Include guifg=#ffcfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi TabLineSel guifg=#efefef guibg=#1c1c1b guisp=#1c1c1b gui=bold ctermfg=255 ctermbg=234 cterm=bold
hi StatusLineNC guifg=#2e3330 guibg=#88b090 guisp=#88b090 gui=NONE ctermfg=236 ctermbg=108 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText guifg=#404040 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
"hi CTagsGlobalConstant -- no settings --
hi DiffText guifg=#ecbcbc guibg=#41363c guisp=#41363c gui=bold ctermfg=181 ctermbg=238 cterm=bold
hi ErrorMsg guifg=#80d4aa guibg=#2f2f2f guisp=#2f2f2f gui=bold ctermfg=115 ctermbg=236 cterm=bold
"hi Ignore -- no settings --
hi Debug guifg=#bca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=138 ctermbg=NONE cterm=bold
hi PMenuSbar guifg=#000000 guibg=#2e3330 guisp=#2e3330 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Identifier guifg=#efdcbc guibg=NONE guisp=NONE gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi Conditional guifg=#f0dfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi StorageClass guifg=#c3bf9f guibg=NONE guisp=NONE gui=bold ctermfg=187 ctermbg=NONE cterm=bold
hi Todo guifg=#dfdfdf guibg=#1c1c1c guisp=#1c1c1c gui=bold ctermfg=254 ctermbg=234 cterm=bold
hi Special guifg=#cfbfaf guibg=NONE guisp=NONE gui=NONE ctermfg=181 ctermbg=NONE cterm=NONE
hi LineNr guifg=#9fafaf guibg=#262626 guisp=#262626 gui=NONE ctermfg=109 ctermbg=235 cterm=NONE
hi StatusLine guifg=#313633 guibg=#ccdc90 guisp=#ccdc90 gui=NONE ctermfg=237 ctermbg=186 cterm=NONE
hi Normal guifg=#d7d7d7 guibg=#1c1c1c guisp=#1c1c1c gui=NONE ctermfg=188 ctermbg=234 cterm=NONE
hi Label guifg=#dfcfaf guibg=NONE guisp=NONE gui=underline ctermfg=187 ctermbg=NONE cterm=underline
"hi CTagsImport -- no settings --
hi PMenuSel guifg=#ccdc90 guibg=#353a37 guisp=#353a37 gui=bold ctermfg=186 ctermbg=237 cterm=bold
hi Search guifg=#ffffe0 guibg=#284f28 guisp=#284f28 gui=NONE ctermfg=230 ctermbg=22 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=#8f8f8f guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi Statement guifg=#e3ceab guibg=NONE guisp=NONE gui=NONE ctermfg=187 ctermbg=NONE cterm=NONE
hi SpellRare guifg=#bc8cbc guibg=NONE guisp=NONE gui=NONE ctermfg=139 ctermbg=NONE cterm=NONE
"hi EnumerationValue -- no settings --
hi Comment guifg=#7f9f7f guibg=NONE guisp=NONE gui=italic ctermfg=108 ctermbg=NONE cterm=NONE
hi Character guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
hi Float guifg=#c0bed1 guibg=NONE guisp=NONE gui=NONE ctermfg=146 ctermbg=NONE cterm=NONE
hi Number guifg=#8cd0d3 guibg=NONE guisp=NONE gui=NONE ctermfg=116 ctermbg=NONE cterm=NONE
hi Boolean guifg=#dca3a3 guibg=NONE guisp=NONE gui=NONE ctermfg=181 ctermbg=NONE cterm=NONE
hi Operator guifg=#f0efd0 guibg=NONE guisp=NONE gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#303030 guisp=#303030 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
"hi Union -- no settings --
hi TabLineFill guifg=#cfcfaf guibg=#181818 guisp=#181818 gui=bold ctermfg=187 ctermbg=234 cterm=bold
hi Question guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi WarningMsg guifg=#ffffff guibg=#333333 guisp=#333333 gui=bold ctermfg=15 ctermbg=236 cterm=bold
hi VisualNOS guifg=#333333 guibg=#f18c96 guisp=#f18c96 gui=bold,underline ctermfg=236 ctermbg=210 cterm=bold,underline
hi DiffDelete guifg=#333333 guibg=#464646 guisp=#464646 gui=NONE ctermfg=236 ctermbg=238 cterm=NONE
hi ModeMsg guifg=#ffcfaf guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi CursorColumn guifg=#dcdccc guibg=#2b2b2b guisp=#2b2b2b gui=NONE ctermfg=187 ctermbg=235 cterm=NONE
hi Define guifg=#ffcfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi Function guifg=#efef8f guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#93b3a3 guibg=#3f4040 guisp=#3f4040 gui=NONE ctermfg=108 ctermbg=238 cterm=NONE
hi PreProc guifg=#ffcfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
"hi EnumerationName -- no settings --
hi Visual guifg=NONE guibg=#005f87 guisp=#005f87 gui=NONE ctermfg=NONE ctermbg=24 cterm=NONE
hi MoreMsg guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi SpellCap guifg=#8c8cbc guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi VertSplit guifg=#2e3330 guibg=#688060 guisp=#688060 gui=NONE ctermfg=236 ctermbg=65 cterm=NONE
hi Exception guifg=#c3bf9f guibg=NONE guisp=NONE gui=bold ctermfg=187 ctermbg=NONE cterm=bold
hi Keyword guifg=#f0dfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi Type guifg=#dfdfbf guibg=NONE guisp=NONE gui=bold ctermfg=187 ctermbg=NONE cterm=bold
hi DiffChange guifg=NONE guibg=#333333 guisp=#333333 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Cursor guifg=#000d18 guibg=#8faf9f guisp=#8faf9f gui=bold ctermfg=23 ctermbg=108 cterm=bold
hi SpellLocal guifg=#9ccc9c guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
hi Error guifg=#ef9f9f guibg=#201010 guisp=#201010 gui=bold ctermfg=217 ctermbg=234 cterm=bold
hi PMenu guifg=#ccccbc guibg=#242424 guisp=#242424 gui=NONE ctermfg=187 ctermbg=235 cterm=NONE
hi SpecialKey guifg=#9ece9e guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
hi Constant guifg=#dca3a3 guibg=NONE guisp=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
"hi DefinedName -- no settings --
hi Tag guifg=#e89393 guibg=NONE guisp=NONE gui=bold ctermfg=174 ctermbg=NONE cterm=bold
hi String guifg=#cc9393 guibg=NONE guisp=NONE gui=NONE ctermfg=174 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=#040404 guibg=#a0afa0 guisp=#a0afa0 gui=NONE ctermfg=NONE ctermbg=108 cterm=NONE
hi MatchParen guifg=#f0f0c0 guibg=#383838 guisp=#383838 gui=bold ctermfg=230 ctermbg=237 cterm=bold
"hi LocalVariable -- no settings --
hi Repeat guifg=#ffd7a7 guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi SpellBad guifg=#dc8c6c guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
"hi CTagsClass -- no settings --
hi Directory guifg=#dcdccc guibg=NONE guisp=NONE gui=bold ctermfg=187 ctermbg=NONE cterm=bold
hi Structure guifg=#efefaf guibg=NONE guisp=NONE gui=bold ctermfg=229 ctermbg=NONE cterm=bold
hi Macro guifg=#ffcfaf guibg=NONE guisp=NONE gui=bold ctermfg=223 ctermbg=NONE cterm=bold
hi Underlined guifg=#dcdccc guibg=NONE guisp=NONE gui=underline ctermfg=187 ctermbg=NONE cterm=underline
hi DiffAdd guifg=#709080 guibg=#313c36 guisp=#313c36 gui=bold ctermfg=65 ctermbg=237 cterm=bold
hi TabLine guifg=#b6bf98 guibg=#181818 guisp=#181818 gui=bold ctermfg=144 ctermbg=234 cterm=bold
hi mbenormal guifg=#cfbfad guibg=#2e2e3f guisp=#2e2e3f gui=NONE ctermfg=187 ctermbg=237 cterm=NONE
hi perlspecialstring guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi doxygenspecial guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi mbechanged guifg=#eeeeee guibg=#2e2e3f guisp=#2e2e3f gui=NONE ctermfg=255 ctermbg=237 cterm=NONE
hi mbevisiblechanged guifg=#eeeeee guibg=#4e4e8f guisp=#4e4e8f gui=NONE ctermfg=255 ctermbg=60 cterm=NONE
hi doxygenparam guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi doxygensmallspecial guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi doxygenprev guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi perlspecialmatch guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi cformat guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi lcursor guifg=#404040 guibg=#8fff8b guisp=#8fff8b gui=NONE ctermfg=238 ctermbg=120 cterm=NONE
hi cursorim guifg=#404040 guibg=#8b8bff guisp=#8b8bff gui=NONE ctermfg=238 ctermbg=105 cterm=NONE
hi doxygenspecialmultilinedesc guifg=#ad600b guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi taglisttagname guifg=#808bed guibg=NONE guisp=NONE gui=NONE ctermfg=105 ctermbg=NONE cterm=NONE
hi doxygenbrief guifg=#fdab60 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi mbevisiblenormal guifg=#cfcfcd guibg=#4e4e8f guisp=#4e4e8f gui=NONE ctermfg=252 ctermbg=60 cterm=NONE
hi user2 guifg=#7070a0 guibg=#3e3e5e guisp=#3e3e5e gui=NONE ctermfg=103 ctermbg=60 cterm=NONE
hi user1 guifg=#00ff8b guibg=#3e3e5e guisp=#3e3e5e gui=NONE ctermfg=48 ctermbg=60 cterm=NONE
hi doxygenspecialonelinedesc guifg=#ad600b guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi doxygencomment guifg=#ad7b20 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi cspecialcharacter guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
"hi clear -- no settings --
