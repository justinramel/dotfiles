" Open/Create source|spec file
function! s:SpecSplit()
  let spec   = s:GetSpecFile(expand('%'))
  let source = s:GetSourceFile(expand('%'))
  call s:OpenSplit(spec, source)
endfunction

" Return the spec filename
function! s:GetSpecFile(file)
  if match(a:file, '_spec\.rb$') != -1
    return a:file
  else
    return substitute(substitute(a:file, ".rb$", "_spec.rb", ""), '^lib/', 'spec/', '')
  endif
endfunction

" Return the source filename
function! s:GetSourceFile(file)
  if match(a:file, '_spec\.rb$') != -1
    return substitute(substitute(a:file, "_spec.rb$", ".rb", ""), '^spec/', 'lib/', '')
  else
    return a:file
  endif
endfunction

" Open two files in a vsplit
function! s:OpenSplit(spec, source)
  exec('only')
  exec('e ' . a:spec)
  exec('vsplit ' . a:source)
endfunction


" Register a new command `AC` for open/create a related file
command! SPECSPLIT :call <SID>SpecSplit()
