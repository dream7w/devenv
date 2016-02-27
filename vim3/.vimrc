"==========================================
"  @Author      : zabambo
"  @File        : .vimrc
"  @Encoding    : utf-8
"  @Create      : 2016-02-27 00:32:38
"  @Modified    : 2016-02-27 00:32:38
"  @Description : 
"==========================================


"------------------common setting begin------------------
"
"粘贴模式
:set pastetoggle=<F11>

" file encoding
set encoding=utf-8
set fileencoding=utf-8

" show line number in vim
set number

"set bs=indent,eol,start         " allow backspacing over everything in insert mode

"语法高亮
"set syntax=on

"Tab宽度 自动缩进字数
set ts=2
set softtabstop=2
set shiftwidth=2
"空格代替制表符
set expandtab

"禁止生成临时文件
"set nobackup
"set noswapfile

"------------------common setting end------------------



"------------------common functions start------------------
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
"autocmd FileWritePre,BufWritePre *.cc,*.h,*.cpp,*.hpp,*.inl call DateModified()



"------------------common functions end------------------




"------------------vundle start------------------
" Install 
"       git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

" required settings
set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"my Bundle here:
""
"..................................
" original repos on github
" to find files
" :CtrlP to enter
Bundle 'kien/ctrlp.vim'
"xml edit
Bundle 'sukima/xmledit'
"undo
Bundle 'sjl/gundo.vim'
"auto add } ] etc.
Bundle 'jiangmiao/auto-pairs'
"python vim env
Bundle 'klen/python-mode'
"Snippets are intelligent text that spares you a lot of typing
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
"go .vim/bundle/YouCompleteMe to execute ./install.py --clang-completer
"or you had to yum install -y python-devel
Bundle 'Valloric/ListToggle'
Bundle 'Valloric/YouCompleteMe'
"to generates a list of compiler flags from a project with an arbitrary build
"system for YouCompleteMe
"can't use
" Bundle 'rdnetto/YCM-Generator'
"high light
Bundle 't9md/vim-quickhl'
"status bar
" Bundle 'Lokaltog/vim-powerline'
"commnet tool
Bundle 'scrooloose/nerdcommenter'


"..................................
"" vim-scripts repos
" multi word paste
Bundle 'YankRing.vim'
" svn csv command
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
"Bundle 'EasyGrep'
Bundle 'grep.vim'
"Bundle 'VOoM'
"Bundle 'VimIM'
Bundle 'winmanager'
Bundle 'minibufexpl.vim'
Bundle 'a.vim'


"..................................
filetype plugin indent on     " required

" Use
"       ReLaunch vim
"       BundleInstall
"       BundleUpdate
"       BundleClean
" Put your stuff after this line
"------------------vundle end------------------


"------------------plugin setting start------------------
" set leader as ;
let mapleader = ";"


" CtrlP
nnoremap <leader>ff :CtrlP<CR>

" gundo
" show undo window
nnoremap <leader>gud :GundoToggle<CR>
"let g:gundo_width = 60
"let g:gundo_preview_height = 40
let g:gundo_right = 1



" YouCompleteMe
" default conf
let g:ycm_global_ycm_extra_conf = '~/.vim/zconf/.ycm_extra_conf.py' 
" do not to confirm when open vim
let g:ycm_confirm_extra_conf = 0

" go to declaration or definition
" after jumped use Ctrl+o to jump back or Ctro+i to jump forward
nnoremap <leader>yd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>yf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>yg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" show errors
nnoremap <leader>ye :YcmDiags<CR>
" nmap <F4> :YcmDiags<CR>
" force to recompile files
nnoremap <leader>yr :YcmForceCompileAndDiagnostics<CR>


" high light
nmap <leader>h <Plug>(quickhl-manual-this)
xmap <leader>h <Plug>(quickhl-manual-this)
nmap <leader>hh <Plug>(quickhl-manual-reset)
xmap <leader>hh <Plug>(quickhl-manual-reset)


" nerdcommenter
" select line then
"[count]<leader>cm |NERDComMinimalComment|
"Comments the given lines using only one set of multipart delimiters. /**/
"[count]<leader>ci |NERDComInvertComment|
"Toggles the comment state of the selected line(s) individually. //
"[count]<leader>cu
"delete Comments 



" YankRing
nnoremap <silent> <leader>sp :YRShow<CR>


" 'grep.vim'
" for search
map <F3> :Rgrep<CR>


" win manager
nmap wm :WMToggle<CR>

" top buffer
let g:miniBufExplMapWindowNavVim=1

" 'a.vim'
" for .h .cc switch
map <F12> :A<CR>

"------------------plugin setting end------------------




