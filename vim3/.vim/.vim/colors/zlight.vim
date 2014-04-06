" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2006 Apr 15

" This color siasme uses a light grey background.

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "zlight"

hi Normal 	ctermfg=Black 		ctermbg=White 		guifg=Black 	guibg=White
hi SpecialKey 	ctermfg=DarkGreen 				guifg=DarkGreen
hi NonText 	ctermfg=Black 		ctermbg=White 		guifg=Black 	guibg=White
hi Directory 	ctermfg=DarkCyan 				guifg=DarkCyan
hi ErrorMsg 	ctermfg=Red 		ctermbg=Yellow 		guifg=Red 	guibg=Yellow
hi IncSearch 	ctermfg=White 		ctermbg=Black 		guifg=White 	guibg=Black
hi Search 	ctermfg=White 		ctermbg=Black 		guifg=White 	guibg=Black
hi MoreMsg 	ctermfg=DarkGreen	 			guifg=DarkGreen
hi MoreMsg 	ctermfg=Red	 				guifg=Red
hi LineNr 	ctermfg=Yellow 		ctermbg=DarkGrey 	guifg=Yellow 	guibg=DarkGrey
hi Question 	ctermfg=DarkGreen		 		guifg=DarkGreen

hi StatusLineNC cterm=reverse
hi VertSplit 	cterm=reverse
hi Title 	ctermfg=Red 	ctermbg=Yellow 		guifg=Red
hi Visual 	cterm=reverse
hi VisualNOS 	cterm=reverse
hi WarningMsg 	ctermfg=DarkBlue 		 		guifg=DarkBlue
hi WildMenu 	ctermfg=Black 		ctermbg=DarkCyan 	guifg=Black 	guibg=DarkCyan
hi Folded 	ctermfg=Yellow 		ctermbg=DarkGrey 	guifg=Yellow 	guibg=DarkGrey
hi FoldColumn 	ctermfg=Yellow 		ctermbg=DarkGrey 	guifg=Yellow 	guibg=DarkGrey
hi DiffAdd 	ctermfg=White 		ctermbg=Red 		guifg=White 	guibg=Red
hi DiffChange 	ctermfg=Yellow 		ctermbg=Magenta 	guifg=Yellow 	guibg=Magenta
hi DiffDelete 	ctermfg=Red 		ctermbg=Brown   	guifg=Red    	guibg=Brown  
hi DiffText   	ctermfg=Blue							guibg=Blue   


hi Comment    	ctermfg=DarkGrey 	ctermbg=White   	guifg=DarkGrey 	guibg=White   
hi Constant   	ctermfg=DarkBlue 				guifg=DarkBlue
hi Special    	ctermfg=DarkRed  				guifg=DarkRed  
hi Identifier 	ctermfg=DarkMagenta				guifg=DarkMagenta
hi Statement  	ctermfg=Blue        				guifg=Blue       
hi Operator   	ctermfg=Blue        				guifg=Blue       
hi PreProc    	ctermfg=DarkMagenta 				guifg=DarkMagenta
hi Type       	ctermfg=Blue        				guifg=Blue       
hi Underlined 	ctermfg=Yellow		ctermbg=Blue    	guifg=Blue
hi Ignore     	ctermfg=Grey 					guifg=Grey
hi Error      	ctermfg=White		ctermbg=Red       	guifg=White  	guibg=Red
hi Todo       	ctermfg=White		ctermbg=DarkGreen 	guifg=White  	guibg=DarkGreen
hi String     	ctermfg=DarkGreen 				guifg=DarkGreen 
hi Number     	ctermfg=Magenta   				guifg=Magenta  


" vim: sw=2
