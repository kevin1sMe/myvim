set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf-8


call pathogen#infect()

syntax enable
filetype on
filetype plugin on

set nocompatible

"tab
set tags+=.,./**/tags,/Users/kevin/Source/git_repo/skynet_tags

set tabstop=4
set shiftwidth=4
set expandtab

set ruler
set showcmd
set showmatch
set vb t_vb=
set softtabstop=4
set autoindent
set smartindent
set cindent
set nu
set nowrapscan
set hlsearch
set undolevels=5000



"下面这些是网上抄下来的
colorscheme elflord          " 着色模式
set guifont=Monaco:h10       " 字体 && 字号
set tabstop=4                " 设置tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set autoindent               " 自动对齐
set backspace=2              " 设置退格键可用
set cindent shiftwidth=4     " 自动缩进4空格
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
set nu!                      " 显示行号
"set showmatch               " 显示括号配对情况
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 查找book时，当输入/b时会自动找到
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set vb t_vb=                 " 关闭提示音
"set cursorline              " 突出显示当前行
set hidden                   " 允许在有未保存的修改时切换缓冲区
"set list                     " 显示Tab符，使用一高亮竖线代替
"set listchars=tab:\|\ ,

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

set writebackup              " 设置无备份文件
set nobackup
set autochdir                " 设定文件浏览器目录为当前目录
"set nowrap                  " 设置不自动换行
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠

set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2

" 每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.erb,*.hs,*.vim 2match Underlined /.\%81v/

au BufRead,BufNewFile *.proto setfiletype proto

" ======= 引号 && 括号自动匹配 ======= "

:inoremap ( ()<ESC>i

:inoremap ) <c-r>=ClosePair(')')<CR>

:inoremap { {}<ESC>i

:inoremap } <c-r>=ClosePair('}')<CR>

:inoremap [ []<ESC>i

:inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap < <><ESC>i
	
":inoremap > <c-r>=ClosePair('>')<CR>

:inoremap " ""<ESC>i

:inoremap ' ''<ESC>i

:inoremap ` ``<ESC>i

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf


" TxtBrowser          高亮TXT文本文件
au BufRead,BufNewFile *.txt setlocal ft=txt

" :FencView           查看文件编码和更改文件编码
let g:fencview_autodetect=1

" :LoadTemplate       根据文件后缀自动加载模板
""let g:template_path='/data/kevinlin/.vim/template/'

" :AuthorInfoDetect   自动添加作者、时间等信息，本质是NERD_commenter && authorinfo的结合
let g:vimrc_author='kevinlin'
let g:vimrc_email='linjiang1205@qq.com'

" Ctrl + E            一步加载语法模板和作者、时间信息 [非插入模式]
""map <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
""vmap <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
map <c-e> <ESC>:AuthorInfoDetect<CR><ESC>

"设置mapleader
let mapleader=","

nnoremap <silent> <Leader>t :TlistToggle <CR>
nnoremap <silent> <Leader>g :CommandT <CR>
nnoremap <silent> <Leader>w  :WMToggle <CR>
nnoremap <silent> <Leader>n  :NERDTreeToggle <CR>
"设置一些快捷键
"nnoremap <silent> <F8> :TlistToggle<CR>
"nmap <silent> <F7> :WMToggle <cr>
"nmap <silent> <F9> :NERDTreeToggle <cr>

"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}


"Tlist
"taglist{
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Close_On_Select=0
let Tlist_Process_File_Always=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"}

"winManager 
let g:winManagerWindowLayout="FileExplorer"
""let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWidth = 30

"NERDTree{
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=40
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$', '\.a$', '\.beam$']
"}

"minibufexp
let g:miniBufExplMapWindowNavVim=1 
let g:miniBufExplMapWindowNavArrows=1 
let g:miniBufExplMapCTabSwitchBufs=1 
let g:miniBufExplModSelTarget=1 
let g:miniBufExplorerMoreThanOne=0


"grep.vim
let Grep_Default_Options="-i"
let Grep_Default_Filelist="*.cpp *.c *.cc *.h"
let Grep_Xargs_Options='-print0'
let Egrep_Path="/usr/bin/egrep"
let Fgrep_Path="/usr/bin/fgrep"

"clang_complete{
""let completeopt-=preview
let g:clang_complete_auto = 1
" clang_complete 相关
"产生错误时打开 quickfix 窗口
let g:clang_complete_copen = 1
"定期更新 quickfix 窗口
let g:clang_periodic_quickfix = 1
"开启 code snippets 功能
let g:clang_snippets = 0
"}


vmap "+y :w !pbcopy<CR><CR>
nmap "+p :r !pbpaste<CR><CR>
