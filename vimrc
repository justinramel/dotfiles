set nocompatible      " use vim defaults
let mapleader = " "   " redefine leader from default backslash

" plugin manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has('gui_running') 
  set guifont=Inconsolata\ 16
endif 

colorscheme Tomorrow-Night
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

" backspace past the start of edit, autoindenting, and even start of the line
set backspace=start,indent,eol

" search settings
set showmatch
set incsearch
set hlsearch
"make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" map command t to leader f
" map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

" map command p to leader f
map <leader>f :CtrlP .<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_dotfiles = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*build/*,*resources/*

" quickly alternate between files
nnoremap <leader><leader> <c-^>

" highlight tabs and trailing spaces
set list listchars=tab:→\ ,trail:·
set list

" no backup or swap file
set nobackup
set nowritebackup
set noswapfile

" enable file type detection.
filetype plugin indent on

" allow paste from sytem clipboard without formating
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" mappings to paste and reformat/reindent
:nnoremap <Esc>P  P'[v']=
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
imap <c-l> <space>=><space>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>v :edit $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! InsertTabWrapper()
"  let col = col('.') - 1
"  if !col || getline('.')[col - 1] !~ '\k'
"    return "\<tab>"
"  else
"    return "\<c-p>"
"  endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>


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
map <leader>a :call RunTests('')<cr>

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
nnoremap <leader>r :!rake<cr>

" Buffer Juggler
nnoremap <leader>b :LustyJuggler<cr>

" Scratch Pad
nnoremap <leader>s :Scratch<cr>

" Map jj to esc
ino jj <esc>
cno jj <c-c>

" Fugitive {{{
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>dg :diffget<CR>
nnoremap <silent> <leader>dp :diffput<CR>
"}}}
