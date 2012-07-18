set nocompatible        " use vim defaults
filetype off            " required for vundle!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" my bundles
Bundle 'kien/ctrlp.vim'
Bundle 'widox/vim-buffer-explorer-plugin'
Bundle 'xolox/vim-easytags'
Bundle 'ervandew/matchem'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kana/vim-scratch'
Bundle 'Lokaltog/vim-powerline'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'endwise.vim'
Bundle 'fugitive.vim'
Bundle 'Tabular'
Bundle 'commentary.vim'
Bundle 'repeat.vim'
Bundle 'vim-coffee-script'
Bundle 'surround.vim'

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

" enable file type detection.
filetype plugin indent on

let mapleader = " "     " redefine leader from default backslash

if has('gui_running')
  set guifont=Inconsolata\ 16
endif

colorscheme Tomorrow-Night-Bright
syntax enable

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

" move between windows using ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <leader>ww <C-w><C-w>       " switch windows
nnoremap <leader>wx <C-w><C-x>       " exchange current window with neighbour
nnoremap <leader>wq :wincmd q<cr>    " close window
nnoremap <leader>wo :only<cr>        " close all but current window

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
:nnoremap <CR> :nohlsearch<cr>

" mappings to paste and reformat/reindent
:nnoremap <Esc>p  p'[v']=

" custom autocmds
augroup vimrcEx
  " clear all autocmds in the group
  autocmd!
  " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
                \ endif
augroup END

autocmd BufWritePre *.rb :%s/\s\+$//e " remove whitespace

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
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

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
  :w
  :!rake
endfunction

" Scratch Pad
let g:scratch_show_command='hide buffer'
nnoremap <leader>s :ScratchOpen<cr>

" Map jk to esc
inoremap jj <esc>
cnoremap jj <c-c>
inoremap <esc> <nop>

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

"if exists(":Tabularize")
  "nmap <Leader>a= :Tabularize /=<CR>
  "vmap <Leader>a= :Tabularize /=<CR>
  "nmap <Leader>a: :Tabularize /:\zs<CR>
  "vmap <Leader>a: :Tabularize /:\zs<CR>
"endif

let g:SuperTabDefaultCompletionType = "context"

nmap <F8> :TagbarToggle<CR>

au BufWritePost *.coffee silent CoffeeMake!
