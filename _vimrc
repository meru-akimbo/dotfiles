set nocompatible               " be iMproved
filetype off                   " required!
autocmd FileType * set comments=
set rtp+=~/.vim/vundle/
call vundle#rc()
Bundle 'fholgado/minibufexpl.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'

Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'vim-coffee-script' 

" js BDDツール
Bundle 'claco/jasmine.vim'
" indentの深さに色を付ける
Bundle 'nathanaelkane/vim-indent-guides'

filetype indent plugin on

set encoding=utf-8

syntax on
set wildmenu
set showcmd
set backspace=indent,eol,start
set nostartofline
set ruler
set laststatus=2
set mouse=a
set number
set splitbelow
set splitright
set ignorecase
set smartcase
set confirm
set visualbell
set t_vb=

set shiftwidth=2
set softtabstop=2
set expandtab
autocmd FileType * setlocal formatoptions-=ro
setlocal formatoptions-=r
setlocal formatoptions-=o


let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" " Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" " Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"  " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
"  " Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
"  " Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"
let g:neocomplcache_ctags_arguments_list = {
   \ 'perl' : '-R -h ".pm"'
    \ }

let g:neocomplcache_snippets_dir = $HOME."/.vim/snippets"
"      " Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default'    : '',
      \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
  \ }
"
"                  " Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
" for snippets
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
"Rubyのオムニ補完を設定(ft-ruby-omni)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
vmap <C-c> :w !xsel -ib<CR><CR>

" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!


"------------------------------------
" jasmine.vim
"------------------------------------
" ファイルタイプを変更
function! JasmineSetting()
  au BufRead,BufNewFile *Helper.js,*Spec.js  set filetype=jasmine.javascript
  au BufRead,BufNewFile *Helper.coffee,*Spec.coffee  set filetype=jasmine.coffee
  au BufRead,BufNewFile,BufReadPre *Helper.coffee,*Spec.coffee  let b:quickrun_config = {'type' : 'coffee'}
  call jasmine#load_snippets()
  map <buffer> <leader>m :JasmineRedGreen<CR>
  command! JasmineRedGreen :call jasmine#redgreen()
  command! JasmineMake :call jasmine#make()
endfunction
au BufRead,BufNewFile,BufReadPre *.coffee,*.js call JasmineSetting()

"------------------------------------
" indent_guides
"------------------------------------
" インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=237
au FileType coffee,ruby,javascript,python IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle
colorscheme default
