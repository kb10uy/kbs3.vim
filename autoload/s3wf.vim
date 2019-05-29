function! s3wf#update_conceal() abort
  let b:s3wf_names = {}
  let lastline = line('$')
  let ln = 1
  while ln <= lastline
    let line = getline(ln)
    let matches = matchlist(line, '\v\c\@([0-9a-z_]+)\=(#[0-9a-f]{6}),([^[:space:]]+)')
    if empty(matches)
      break
    endif
    let b:s3wf_names[ln] = [matches[1], matches[2], matches[3]]

    let groupname = 'S3wfRuntime_Character' . ln
    let syndef = 'syntax match ' . groupname . ' /\v^\@' . matches[1] . '\>.+$/'
    let hidef = 'highlight ' . groupname . ' guifg=' . matches[2]
    exec syndef
    exec hidef

    let ln = ln + 1
  endwhile
endfunction
