set nocompatible      " use vim defaults
let mapleader = " "   " redefine leader from default backslash

" plugin manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" solarize!
set term=xterm-256color
set background=dark
colorscheme solarized
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

" search settings
set showmatch
set incsearch
set hlsearch
"make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" map command t to leader f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

" quickly alternate between files
nnoremap <leader><leader> <c-^>

" highlight tabs and trailing spaces
set list listchars=tab:→\ ,trail:·
set list

" store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" enable file type detection.
filetype plugin indent on

" allow paste from sytem clipboard without formating
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

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

" misc key maps

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

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
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
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
nnoremap <leader>. :call OpenTestAlternate()<cr>

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
            exec ":!ruby -rminitest/pride " . a:filename
            "exec ":!rspec --color " . a:filename
        end
    end
endfunction
