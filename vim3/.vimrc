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
set syntax=on

"Tab宽度 自动缩进字数
set ts=2
set softtabstop=2
set shiftwidth=2
"空格代替制表符
set expandtab

"禁止生成临时文件
"set nobackup
"set noswapfile

set t_Co=256
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




"------------------NeoBundle start------------------
 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!


"..................................
" original repos on github
" to find files
" :CtrlP to enter
NeoBundle 'kien/ctrlp.vim'
"xml edit
NeoBundle 'sukima/xmledit'
"undo
NeoBundle 'sjl/gundo.vim'
"auto add } ] etc.
NeoBundle 'jiangmiao/auto-pairs'
"python vim env
NeoBundle 'klen/python-mode'
"Snippets are intelligent text that spares you a lot of typing
NeoBundle 'SirVer/ultisnips'
NeoBundle 'scrooloose/syntastic'
"go .vim/bundle/YouCompleteMe to execute ./install.py --clang-completer
"or you had to yum install -y python-devel
NeoBundle 'Valloric/ListToggle'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'rdnetto/YCM-Generator'
"to generates a list of compiler flags from a project with an arbitrary build
"system for YouCompleteMe
"can't use
" Bundle 'rdnetto/YCM-Generator'
"high light
NeoBundle 't9md/vim-quickhl'
"status bar
" Bundle 'Lokaltog/vim-powerline'
"commnet tool
NeoBundle 'scrooloose/nerdcommenter'
" colorscheme kolor
NeoBundle 'zeis/vim-kolor'
" colorscheme molokai
NeoBundle 'tomasr/molokai'

"..................................
"" vim-scripts repos
" multi word paste
NeoBundle 'YankRing.vim'
" svn csv command
NeoBundle 'vcscommand.vim'
NeoBundle 'ShowPairs'
NeoBundle 'SudoEdit.vim'
"Bundle 'EasyGrep'
NeoBundle 'grep.vim'
"Bundle 'VOoM'
"Bundle 'VimIM'
NeoBundle 'winmanager'
NeoBundle 'minibufexpl.vim'
NeoBundle 'a.vim'




 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck



"------------------NeoBundle end------------------


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
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 
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
nnoremap <leader>yc :YcmGenerateConfig<CR>


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
let g:yankring_history_dir = '~/.vim/zconf'
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


"colorscheme molokai
colorscheme kolor

"------------------plugin setting end------------------




