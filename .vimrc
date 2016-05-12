

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"kalfazed ,vimrc

set nocompatible               " be iMproved  
filetype off                   " required!       /**  从这行开始，vimrc配置 **/  



"""""""""color"""""""
set t_Co=256
"color twilight
color wombat256mod


" Mouse and backspace
" set mouse=a
set backspace=indent,eol,start


" You need to reload this file for the change to apply
filetype plugin indent on
syntax on


set rtp+=/home/kalfazed/.vim/bundle/Vundle.vim/


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed



" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = "`"



" Quick quit command
noremap <Leader>w :quit<CR>  " Quit current window
noremap <Leader>q :qa!<CR>   " Quit all windows



" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press > several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Set the character of space and tab
set list
set listchars=eol:·,tab:>-,extends:>,precedes:<


"""""""""""""""""""Setting of some vim plugin""""""""""""""""""""""
" Settings for vim-powerline
set laststatus=2


" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
set nofoldenable

"TODO
"I need to use roap to complete some functions of python mode

"""""""""""""""""""Setting of some vim plugin""""""""""""""""""""""




"YCM configuration
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'




"Display line number and clock
set number
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

"call vundle#rc()  
call vundle#begin()
  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bundle set up
" let Vundle manage Vundle  
" required!   
Bundle 'gmarik/vundle'  
  
" My Bundles here:  /* 插件配置格式 */  
"     
" original repos on github （Github网站上非vim-scripts仓库的插件，按下面格式填写）  
Bundle 'tpope/vim-fugitive'  
Bundle 'Lokaltog/vim-easymotion'  
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}  
Bundle 'tpope/vim-rails.git'  
" vim-scripts repos  （vim-scripts仓库里的，按下面格式填写）  
Bundle 'L9'  
Bundle 'FuzzyFinder'  
Bundle 'Valloric/YouCompleteMe'

"javascript
Bundle 'pangloss/vim-javascript'

"Bundle for vim-snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

"Bundle for nerdtree
Bundle 'https://github.com/scrooloose/nerdtree.git'

"Bundle ctags
Bundle 'SublimeText/CTags'  

"Bundle winmanager Taglist BufExplorer
Bundle 'vim-scripts/winmanager--Fox'
Bundle 'vim-scripts/taglist.vim'
Bundle 'jlanzarotta/bufexplorer'

"Bundle for syntastic
Bundle 'scrooloose/syntastic'

"Bundle for javascript
Bundle 'jelera/vim-javascript-syntax'

"YCM0Generator
Bundle 'rdnetto/YCM-Generator'


" non github repos   (非上面两种情况的，按下面格式填写)  
"Bundle 'git://git.wincent.com/command-t.git'  
" ...   
  
filetype plugin indent on     " required!   /** vimrc文件配置结束 **/  
"                                           /** vundle命令 **/  
" Brief help  
" :BundleList          - list configured bundles  
" :BundleInstall(!)    - install(update) bundles  
" :BundleSearch(!) foo - search(or refresh cache first) for foo   
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles  
"     
" see :h vundle for more details or wiki for FAQ   
" NOTE: comments after Bundle command are not allowed..  

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CombinKey
"
" for YCM
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
""Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F3> :YcmDiags<CR>
"
"For ESC
imap jj <Esc>  
:map <Space><Space> :w<CR>
:map qq :q<CR>

"For Open NERDTree by F4 Button
map <F4> :NERDTreeToggle<CR>
imap <F4><ESC> :NERDTree<CR>


"Show winManagerWindows
let NERDTreeDirArrows=0
let g:AutoOpenWinManager = 1
let g:winManagerWindowLayout = 'FileExplorer|TagList'
let g:winManagerWidth = 30
nmap <silent> wm :WMToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"PopUp menu
filetype plugin on
set ofu=syntaxcomplete#Complete
highlight Pmenu guibg=brown gui=bold
highlight Pmenu ctermfg=238 gui=bold
highlight Pmenu ctermbg=DarkGrey gui=bold

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set term=screen-256color


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"setting of YCM
" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	"从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> 
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
""在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"setting for syntastic
let g:syntastic_error_symbol = '✗ '
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1"whether to show balloons	


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""''ctags"""""""""""""""""""""""""""""""""""""""""' "set tags=/home/kalfazed/Code/supercom/tags
"set tags +=/home/kalfazed/Code/host/OakGate/OakGateDirectedTest/tags
set tags +=/home/kalfazed/Code/dtlibs/OakGateDirectedTest/tags
set tags +=/home/kalfazed/Code/pinot-test/tools/tags



""""""""''JavaScript"""""""""""""""""""""""""""""""""""
" au FileType javascript call JavaScriptFold()
"
"""""""""""""""""""""""""""""""""""""""""""



""""""""""Can I stay in Japan in the next year?""""""""""""""""""""""""
" Jan,25  110,000 //Currently
" Feb,25  110,000 + 142,766 = 252,766 //salary_Fixstars
" Mar,25  252,766 + 112,592 = 365,358 //salary_Fixstars
" Mar,25  365,358 + 300,000 = 665,358 //salary_Part_Time_Job
" Apr,25  665,358 + 126,666 = 792,024 //salary_Fixstars
" Apr,25  792,024 + 76,800  = 868,824 //salary_OSCAR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" May,1   868,824 - 550,000 = 318,824 //Tuition
" May,1   318,824 - 150,000 = 168,824 //trafic, rent, living expenses
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" May,25  168,824 + 126,666 = 295,490 //salary_Fixstars  
" Jun,25  295,490 + 126,666 = 422,156 //salary_Fixstars
" Jul,25  422,156 + 126,666 = 548,822 //salary_Fixstars
" Aug,25  548,822 + 126,666 = 675,488 //salary_Fixstars
" Sep,25  675,488 + 126,666 = 802,154 //salary_Fixstars
" Sep,25  802,154 + 192,000 = 994,154 //salary_OSCAR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Oct,1   802,154 - 550,000 = 444,154 //Tuition
" Oct,1   252,154 - 50,960  = 393,194 //trafic
" Oct,1   393,194 - 120,000 = 273,194 //Living expenses
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""IF"""""""""""""""""""""""""""
" Oct,1   273,194 + 480,000 = 753,194 //IF_ScholorShip_80,000_Per_month
" Oct,1   753,184 - 200,000 = 553,184 //IF_Rent_Initial_Cost_200,000
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I think i will move before May.25, So i will calculate the rent of Jun, Jul, Aug, Sep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Oct,1   553,184 - 280,000 = 273,184 //IF_Rent_70,000_Per_month


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"16+17 = 33


