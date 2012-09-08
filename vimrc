set nocompatible        " use vim defaults
filetype off            " required for vundle!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" my bundles
Bundle 'kien/ctrlp.vim'
Bundle 'LustyJuggler'
Bundle 'widox/vim-buffer-explorer-plugin'
Bundle 'xolox/vim-easytags'
Bundle 'ervandew/matchem'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Lokaltog/vim-powerline'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'endwise.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Tabular'
Bundle 'commentary.vim'
Bundle 'repeat.vim'
Bundle 'vim-coffee-script'
Bundle 'surround.vim'
Bundle 'ack.vim'
Bundle 'YankRing.vim'
Bundle 'unimpaired.vim'
Bundle 'benmills/vimux'
Bundle 'vimwiki'

" syntastic settings
let g:syntastic_check_on_open=1       " check syntax on load
let g:syntastic_echo_current_error=1  " echo error to command
let g:syntastic_enable_signs=1        " show in document error signs
let g:syntastic_error_symbol='✗'      " error symbol
let g:syntastic_warning_symbol='⚠'    " warning symbol
let g:syntastic_enable_highlighting=0 " higlight errors
let g:syntastic_quiet_warnings=0      " show warning messages

" tabular settings
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" vimux settings
" don't create new windows re-use the nearest one
let g:VimuxUseNearestPane = 1

" vimwiki
nmap <Leader>vw <Plug>VimwikiIndex

" enable file type detection.
filetype plugin indent on

let mapleader = " "     " redefine leader from default backslash

if has('gui_running')
  set guifont=Inconsolata\ 16
endif

" colorscheme Tomorrow-Night-Bright
colorscheme zenburn
syntax enable

" reflow
nnoremap Q gqap
vnoremap Q gq

set history=10000     " remember more commands and search history
set title             " show title of the file in vim bar
set ls=2              " show status bar with file path and name
set showcmd           " displays an incomplete command lower right of window
set ruler             " show the cursor vertical position in lower right
set nowrap            " don't wrap lines
set showmode          " show the current mode
set nocursorcolumn    " highlight the current column, off
set cursorline        " highlight current line
set number            " turn on line numbers
set numberwidth=4     " format line numbers 001
set colorcolumn=80    " show line in column 80
set expandtab         " convert tabs into space
set softtabstop=2     " tab conversion to number of spaces
set shiftwidth=2      " auto-indent amount when using cindent, >>, <<
set autoindent        " uses the indent from the previous line
set hidden            " allows hidding of buffers even when changed
set clipboard=unnamed " allow copy/paste buffer to work with system clipboard
set wildmode=longest,list,full "code completion
set wildmenu

" backspace past the start of edit, autoindenting, and even start of the line
set backspace=start,indent,eol

" search settings
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set noesckeys

let g:Powerline_symbols = 'fancy'

nnoremap <leader>wv :vsplit<cr><C-w>v<C-w>l " open a new vertical split and switch to it
nnoremap <leader>wh :split<cr><C-w>j        " open a new horizontal split and switch to it

" abbreviations
iabbrev ssig -- <cr>Justin Ramel<cr>justin.ramel@gmail.com

" surround word with "
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" surround word with '
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" vimwiki mappings
nmap <Leader>ww <Plug>VimwikiIndex
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_export': 1}]
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1

" move between windows using ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <leader>a :Ack -i 

" map command p to leader f
map <leader>f :CtrlP .<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_dotfiles = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*build/*,*resources/*

" quickly alternate between files
nnoremap <leader><leader> <c-^>

" highlight tabs and trailing spaces
set list listchars=tab:▸\ ,trail:·
set list

" no backup or swap file
set nobackup
set nowritebackup
set noswapfile


" allow paste from sytem clipboard without formating
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" clear the search buffer when hitting return
:nnoremap <cr> :nohlsearch<cr>

" mappings to paste and reformat/reindent
:nnoremap <Esc>p  p'[v']=

" custom autocmds
augroup vimrcEx
  " clear all autocmds in the group
  autocmd!
  " Jump to last cursor position when re-opening a file
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
                \ endif
augroup END

autocmd BufWritePre *.rb,*.js,*.markdown :%s/\s\+$//e " remove whitespace

" misc key maps
" Insert a hash rocket with <c-l>
inoremap <c-l> <space>=><space>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! InsertTabWrapper()
  "let col = col('.') - 1
  "if !col || getline('.')[col - 1] !~ '\k'
    "return "\<tab>"
  "else
    "return "\<c-p>"
  "endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" USEFUL REMAPPING OF ARROW KEYS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" arrow keys on there own move between splits
nnoremap <Up>        <C-W>k
nnoremap <Down>      <C-W>j
nnoremap <Left>      <C-W>h
nnoremap <Right>     <C-W>l

" shift + arrow to resize splits
nnoremap <silent> <S-Up>   <C-w>+
nnoremap <silent> <S-Down> <C-w>-
nnoremap <silent> <S-Right> <C-w>>
nnoremap <silent> <S-Left>  <C-w><

" ctrl + arrow bubble line / lines up or down
nmap <C-Up>   [e
imap <C-Up>   <C-O><C-Up>
vmap <C-Up>   [egv
nmap <C-Down> ]e
imap <C-Down> <C-O><C-Down>
vmap <C-Down> ]egv

" left/right indent with tab
nmap <S-tab> <<
vmap <S-tab> <gv
nmap <tab>   >>
vmap <tab>   >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>. :call OpenTestAlternate()<cr>

function! OpenTestAlternate()
  "let new_file = AlternateForCurrentFile()
  let new_file = AlternateForRubyMotion()
  exec ':e ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '_spec/') != -1 "Ruby/Rails
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction

function! AlternateForRubyMotion()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '_spec/') != -1
  let going_to_spec = !in_spec
  if going_to_spec
    let new_file = substitute(new_file, '^app/', '', '')
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'isolated_spec/' . new_file
  else
    let new_file = substitute(new_file, '^isolated_spec/', 'app/', '')
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
  endif
  return new_file
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
"map <leader>a :call RunTests('')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")          " Run test script if it exists
            exec ":!script/test " . a:filename
        elseif a:filename == ''                 " Run all tests
            exec ":!rake test"
        elseif filereadable("Gemfile")          " Run single test via bundle
            exec ":!ruby -rminitest/pride " . a:filename
            "exec ":!bundle exec rspec --color " . a:filename
        else                                    " Run single test
            "exec ":!ruby -rminitest/pride " . a:filename
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

" Run rake
map <leader>r :call SaveAndRake()<cr>

function! SaveAndRake() 
  :wa
  :call VimuxRunCommand("rake")
  " :!rake
endfunction

inoremap jj <esc>

" Fugitive {{{
nnoremap <silent> <leader>gs :Git add .<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>dg :diffget<CR>
nnoremap <silent> <leader>dp :diffput<CR>
"}}}

let g:SuperTabDefaultCompletionType = "context"

" on saving coffee files auto generate js
au BufWritePost *.coffee silent CoffeeMake!

" write all files on losing focus
au FocusLost * :wa

nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>
