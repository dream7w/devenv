"==========================================
"  @Author      : zabambo
"  @File        : .vimrc
"  @Encoding    : utf-8
"  @Creat       : 2013-12-25 20:47:10
"  @Modified    : 2013-12-25 20:47:10
"  @Description : 
"==========================================

" Bundle Start====================================================================

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...


" zdf comm setting
set encoding=utf-8
set fileencoding=utf-8

set bs=indent,eol,start		" allow backspacing over everything in insert mode

"语法高亮
set syntax=on
"Tab宽度 自动缩进字数
set ts=2
set softtabstop=2
set shiftwidth=2

"空格代替制表符
set expandtab

"自动缩进
set autoindent
set cindent         
set smartindent                       " 为C程序提供自动缩进

"不自动缩进
"set noai
"set noautoindent
"set nocindent
"set nosi
set number
set t_Co=256
set nowrap
set history=500                       "keep 500 lines of command line history
set ruler                             "show the cursor position all the time;
colorscheme zlight
inoremap <C-d> <Delete>
inoremap <C-b> <Backspace>
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>


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



" ----------------------
" 总是显示状态行
set laststatus=2
"禁止生成临时文件
set nobackup
set noswapfile
"粘贴模式
:set pastetoggle=<F11> 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=menu,menuone,longest

set cscopequickfix=s-,c-,d-,i-,t-,e-

" ctags
map <F2> :!./mk_tags<CR>
" add stl sys tags
set tags+=~/.vim/tags/cpp_src_tags
set tags+=~/.vim/tags/systags

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

" s 查找符号 g 查找定义 c 查找调用本函数的函数 t 查找字符串
" e egrep查找 f 查找文件 i 查找包含本文件的文件 d 查找本函数调用的函数
nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap ff :cs find f <C-R>=expand("<cword>")<CR><CR> :cw<CR>
"nmap fi :cs find i <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap fi :cs find i ^<C-R>=expand("<cword>")<CR>$<CR> :cw<CR>
nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR> :cw<CR>









" zdf need plugin
Bundle 'taglist.vim'
Bundle 'winmanager'
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<CR>

Bundle 'a.vim'
map <F12> :A<CR>

Bundle 'grep.vim'
map <F3> :Rgrep<CR>

Bundle 'minibufexpl.vim'
let g:miniBufExplMapWindowNavVim=1

Bundle 'neocomplcache'
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1

"Bundle 'snipMate'
"Bundle 'SuperTab'
" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
"let g:SuperTabRetainCompletionType=2
" 设置按下<Tab>后默认的补全方式, 默认是<C-P>, 现在改为<C-X><C-O>
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

Bundle 'OmniCppComplete'
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowScopeInAbbr = 1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
let OmniCpp_ShowAccess = 1 " show access
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1
let OmniCpp_DefaultNamespaces=["std"]

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Bundle End====================================================================











" pair
":inoremap ( ()
":inoremap ) =ClosePair(')')
":inoremap { {}
":inoremap } =ClosePair('}')
":inoremap [ []
":inoremap ] =ClosePair(']')
":inoremap < <>
":inoremap > =ClosePair('>')
"function ClosePair(char)
"  if getline('.')[col('.') - 1] == a:char
"    return ""
"  else
"    return a:char
"  endif
"endf



""定义函数SetTitle，自动插入文件头  
func SetTitle()  
  "if &filetype == 'cc'  
    call setline(1, "\/*==========================================")  
    call setline(2, "  @Author      : zabambo")  
    call setline(3, "  @File        : ".expand("%"))  
    call setline(4, "  @Encoding    : utf-8")  
    call setline(5, "  @Create      : ".strftime("%Y-%m-%d %H:%M:%S"))  
    call setline(6, "  @Modified    : ".strftime("%Y-%m-%d %H:%M:%S"))  
    call setline(7, "  @Description : ")  
    call setline(8, "==========================================*\/")  
    call setline(9, "")  
  "endif  
endfunc  
func DateModified()
  let zcur_line = line(".")
  let zcur_clo = virtcol(".")
  call cursor(1,1)
  if search('@Modified') != 0
    let line = line('.')
    if line < 9
      call setline(line, "  @Modified    : ".strftime("%Y-%m-%d %H:%M:%S"))  
    endif
  endif
  call cursor(zcur_line,zcur_clo)
endfunc


"autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"        
map <F10> :call SetTitle()<CR>  
"map <F10> :call DateInsert()<CR>  
"autocmd FileWritePre,BufWritePre *.cc,*.h,*.cpp,*.hpp,*.inl ks|call DateModified()|'s
autocmd FileWritePre,BufWritePre *.cc,*.h,*.cpp,*.hpp,*.inl call DateModified()



"commands
"'gf': go to file