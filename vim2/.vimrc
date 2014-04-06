"==========================================
"  @Author      : zabambo
"  @File        : .vimrc
"  @Encoding    : utf-8
"  @Create      : 2014-04-06 04:06:20
"  @Modified    : 2014-04-06 04:06:20
"  @Description : 
"==========================================



" Vundle start=======================
" Install 
" 	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
" Your plugins here
" Bundle后的插件名称来自于http://vim-scripts.org/vim/scripts.html的Name列
Bundle 'taglist.vim'
Bundle 'winmanager'
Bundle 'grep.vim'
Bundle 'minibufexpl.vim'
" c++--------------------------------------
Bundle 'a.vim'
Bundle 'neocomplcache'
Bundle 'OmniCppComplete'


"go lang------------------------------------
" To install godef:
"   go get code.google.com/p/rog-go/exp/cmd/godef
Bundle 'dgryski/vim-godef'

" To install gocode:
"   go get github.com/nsf/gocode
Bundle 'Blackrush/vim-gocode'

" To install golint:
"   go get github.com/golang/lint/golint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" To install gotags:
"   go get github.com/jstemmer/gotags
Bundle 'majutsushi/tagbar'



filetype plugin indent on     " required

" Use
" 	ReLaunch vim
" 	BundleInstall
" 	BundleUpdate
" 	BundleClean
" Put your stuff after this line
" Vundle end=======================



" Plugin Settings Start======================
" 'taglist.vim'
" 'winmanager'
" for file list
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<CR>

" 'grep.vim'
" for search
map <F3> :Rgrep<CR>

" 'minibufexpl.vim'
" for top buff list
let g:miniBufExplMapWindowNavVim=1


" Plugin Settings End======================




" Zdf Common Setting Start========================
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

" 总是显示状态行
set laststatus=2
"禁止生成临时文件
set nobackup
set noswapfile
"粘贴模式
:set pastetoggle=<F11> 


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




" Zdf Common Setting End========================




" C++ Setting Start========================
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=menu,menuone,longest
" ctags
map <F2> :!~/.vim/mk_tags<CR>
" add stl sys tags
set tags+=~/.vim/tags/cpp_src_tags
set tags+=~/.vim/tags/systags

" 'a.vim'
" for .h .cc switch
map <F12> :A<CR>

" 'neocomplcache'
" for auto complete
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1


" 'OmniCppComplete'
" for auto complete
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



" C++ Setting End========================




" Go Lang Setting Start========================
" go get github.com/bradfitz/goimports
" Use goimports instead of gofmt.
let g:gofmt_command = "goimports"
let g:go_fmt_autofmt = 1

" 'dgryski/vim-godef'
" gd: show function define

" 'Blackrush/vim-gocode'
" autocomplete

" 'majutsushi/tagbar'
" for file tags
nmap gwm :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }



" Go Lang Setting End========================




