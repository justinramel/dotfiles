inoremap <esc> <nop>
inoremap <C-i> <esc>
inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>
inoremap kk <esc>

if has("win32")
  let $HOME = 'c:\vim'
endif

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
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/matchit.zip'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'endwise.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'repeat.vim'
Bundle 'surround.vim'
Bundle 'ack.vim'
Bundle 'benmills/vimux'
Bundle 'vimwiki'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'AndrewRadev/switch.vim'

" syntastic settings
if !has("win32")
  let g:syntastic_error_symbol='✗'      " error symbol
  let g:syntastic_warning_symbol='⚠'    " warning symbol
endif
let g:syntastic_check_on_open=1       " check syntax on load
let g:syntastic_echo_current_error=1  " echo error to command
let g:syntastic_enable_signs=1        " show in document error signs
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

" enable file type detection.
filetype plugin indent on

let mapleader = " "     " redefine leader from default backslash

if has('gui_running')
  set guioptions=egmrt  " hide the gui menubar
  if has("gui_gtk2")
    set guifont=Inconsolata\ 16
  elseif has("gui_win32")
    set guifont=Inconsolata:h16
  endif
endif

syntax enable
set background=dark
colorscheme Tomorrow-Night-Bright

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
set noerrorbells visualbell t_vb= " switch off beeping and flashing on error
set splitbelow
set splitright
set so=5
set shortmess+=I

" backspace past the start of edit, autoindenting, and even start of the line
set backspace=start,indent,eol

" search settings
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set noesckeys

nnoremap <leader>wv :vsplit<cr><C-w>l " open a new vertical split and switch to it
nnoremap <leader>wh :split<cr><C-w>j  " open a new horizontal split and switch to it

" abbreviations
iabbrev ssig -- <cr>Justin Ramel<cr>justin.ramel@gmail.com

" surround word with "
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" surround word with '
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" vimwiki mappings
if has("win32")
  let g:vimwiki_list = [{'path': 'C:\Dropbox\vimwiki\', 'auto_export': 1, 'path_html': 'C:\Dropbox\vimwiki_html'}]
else
  let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_export': 1}]
endif
nmap <Leader>ww <Plug>VimwikiIndex
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
if has("win32")
  set list listchars=tab:\>\�,trail:�
else
  set list listchars=tab:▸\ ,trail:·
endif

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
  " reload .vimrc when it is changed
  autocmd BufWritePost .vimrc source $MYVIMRC

  " Jump to last cursor position when re-opening a file
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
                \ endif
augroup END

autocmd BufWritePre *.rb,*.js,*.markdown,*.java :%s/\s\+$//e " remove whitespace

" misc key maps
" Insert a hash rocket with <c-l>
inoremap <c-l> <space>=><space>

if has("win32")
  nnoremap <leader>ev :e c:\vim\dotfiles\vimrc<cr>
else
  nnoremap <leader>ev :e $MYVIMRC<cr>
endif
nnoremap <leader>sv :source $MYVIMRC<cr>

" Spelling
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_gb " Set region to British English
set spellfile=~/.vim/spell/en.utf-8.add

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
map <leader>rn :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>. :call OpenTestAlternate()<cr>

function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
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

" Fugitive {{{
nnoremap <silent> <leader>ga :Git add .<CR>
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

" insert todays date
:nnoremap <F5> "=strftime("%a %d %b %Y")<CR>P
:inoremap <F5> <C-R>=strftime("%a %d %b %Y")<CR>

if filereadable(".vimrc.local")
  so .vimrc.local
endif

" remap for saves
nmap <leader>w :w!<cr>

" setting different shift widths
map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
map <leader>t8 :setlocal shiftwidth=4<cr>

" Close the current buffer
map <leader>bd :bdel<cr>

" Close all the buffers
map <leader>ba :bufdo bd!<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" autocomplete common programming elements
inoremap (( ()<esc>i
inoremap [[ []<esc>i
inoremap {{ {}<esc>i
inoremap '' ''<esc>i
inoremap "" ""<esc>i
inoremap uu _
inoremap ## #{}<esc>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimux
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
map <leader>rl :RunLastVimTmuxCommand<CR>

" Inspect runner pane
map <leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
map <leader>rx :CloseVimTmuxPanes<CR>

" Interrupt any command running in the runner pane
map <leader>rs :InterruptVimTmuxRunner<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>ts :SPECSPLIT<CR>

noremap - :Switch<cr>
