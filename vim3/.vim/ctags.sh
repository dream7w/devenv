#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

mkdir tags
ctags -I __THROW --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --fields=+iaS -R -f ~/.vim/tags/systags /usr/include /usr/local/include
ctags -R --c++-kinds=+p --c-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ~/.vim/tags/cpp_src_tags ~/.vim/cpp_src
