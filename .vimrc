"-----------------------------------------------------------"
"-------------------Vundle Setting Begin--------------------"
"-----------------------------------------------------------"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" klet Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/emmet-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-----------------------------------------------------------"
"--------------------My NERDTree Setting--------------------"
"-----------------------------------------------------------"
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
autocmd vimenter * NERDTree
" 按下 F2 调出/隐藏 NERDTree
map <F2> :NERDTreeToggle<CR>
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"-----------------------------------------------------------"
"--------------------My .Vimrc Setting----------------------"
"-----------------------------------------------------------"
" 语法高亮 
syntax enable
" 设置主题
colorscheme molokai
set background=dark
" 设置字体以及大小
set guifont=Monaco:h14
" 显示行号
set nu
" 显示光标所在的行号列号
set ruler
" 设置工作目录为当前编辑文件的目录
set autochdir
set buftype=""
" jk映射到esc
inoremap jk <esc>
" 显示输入的命令
set showcmd
" 设定默认解码 
set fenc=utf-8 
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936 
" 关闭兼容模式
set nocompatible
" 自动对齐
set autoindent
set smartindent
" 查询
set incsearch
" 高亮当前行 
set cursorline
" 光标闪烁关闭
set gcr=a:block-blinkon0
" 制表符4
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 探测文件类型
filetype on 
" 载入文件类型的插件
filetype plugin on
filetype indent on 
" 高亮显示匹配的括号
set showmatch
" 匹配括号显示高亮时间
set matchtime=1
" 括号自动补全
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap < <><ESC>i
nmap <c-j> 5j
nmap <c-k> 5k

" 默认开启indent-guide
let g:indent_guides_enable_on_vim_startup = 1
" 设置对齐线的宽度
let g:indent_guides_guide_size = 1
" 设置垂直对齐线的颜色
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=4


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" C,C++,Java,Python按F5编译运行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
 func! CompileRunGcc()
     exec "w"
	 if &filetype == 'c'
		 exec "!gcc % -o %<"
		 exec "! ./%<"
	 elseif &filetype == 'cpp'
		 exec "!g++ % -o %<"
		 exec "! ./%<"
	 elseif &filetype == 'java' 
		 exec "!javac %" 
		 exec "!java %<"
	 elseif &filetype == 'sh'
		 :!./%
	 elseif &filetype == 'python'
		 exec "!python %"
	 endif
 endfunc
