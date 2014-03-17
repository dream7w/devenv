
set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif


" zdf local config==============================================
set encoding=utf-8 
set fileencoding=utf-8

set ts=2
set expandtab

set number
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

set cscopequickfix=s-,c-,d-,i-,t-,e-

set t_Co=256
colorscheme zlight 

inoremap <C-d> <Delete>
inoremap <C-b> <Backspace>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"no nowrap
set nowrap


" minibufexpl settings
" Ctrl+tab | Ctrl + Shift + tab to switch buffs
" Ctrl + h,j,k,l to switch buffs
" ctrl + arrows to switch buffs
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"a .h .cpp switch
map <F12> :A<CR>

"grep 
map <F3> :Rgrep<CR>

" cscope and tags
map <F2> :!./mk_tags<CR>
if has("cscope") && filereadable("/usr/bin/cscope")
	set csprg=/usr/bin/cscope
	set csto=0
   	set cst
   	set nocsverb
   	" add any database in current directory
   	if filereadable("cscope.out")
      		cs add cscope.out
   	" else add database pointed to by environment
   	elseif $CSCOPE_DB != ""
      		cs add $CSCOPE_DB
   	endif
   	set csverb
endif


" s ²éÕÒ·ûºÅ g ²éÕÒ¶¨Òå c ²éÕÒµ÷ÓÃ±¾º¯ÊıµÄº¯Êı t ²éÕÒ×Ö·û´®
" e egrep²éÕÒ f ²éÕÒÎÄ¼ş i ²éÕÒ°üº¬±¾ÎÄ¼şµÄÎÄ¼ş d ²éÕÒ±¾º¯Êıµ÷ÓÃµÄº¯Êı
nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap ff :cs find f <C-R>=expand("<cword>")<CR><CR>
"nmap fi :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap fi :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>

"SuperTab instead of <tab> with <c-.> to complete, but it doesn't work; you can use s+tab for this func
let g:SuperTabMappingForward = "<C-.>"

"OmniCpp
set nocp
filetype plugin on
set tags+=~/.vim/cpp_src_tags
set tags+=~/.vim/systags
"set tags+=~/.vim/systags
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " ÏÔÊ¾º¯Êı²ÎÊıÁĞ±í 
let OmniCpp_MayCompleteDot = 1   " ÊäÈë .  ºó×Ô¶¯²¹È«
let OmniCpp_MayCompleteArrow = 1 " ÊäÈë -> ºó×Ô¶¯²¹È« 
let OmniCpp_MayCompleteScope = 1 " ÊäÈë :: ºó×Ô¶¯²¹È« 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest












