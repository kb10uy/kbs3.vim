function! s3wf#update_highlights() abort
  call s3wf#clear_highlights()
  call s3wf#set_highlights()
endfunction

function! s3wf#set_highlights() abort
  let b:s3wf_names = {}
  let lastline = line('$')
  let ln = 1
  while ln <= lastline
    let line = getline(ln)
    let matches = matchlist(line, '\v\c\@([0-9a-z_]+)\=(#[0-9a-f]{6}),([^[:space:]]+)')
    if empty(matches)
      break
    endif

    let groupname = 'S3wfRuntime_Character' . ln
    exec 'syntax match ' . groupname . ' /\v^\@' . matches[1] . '\>.+$/'
    exec 'highlight ' . groupname . ' guifg=' . matches[2]

    let b:s3wf_names[ln] = [matches[1], matches[2], matches[3]]
    let ln = ln + 1
  endwhile
endfunction

function! s3wf#clear_highlights() abort
  if !exists('b:s3wf_names')
    return
  endif
  for k in keys(b:s3wf_names)
    let groupname = 'S3wfRuntime_Character' . k
    exec 'syntax clear ' . groupname
    exec 'hi clear ' . groupname
  endfor
endfunction
