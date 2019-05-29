command! S3wfUpdateHighlights call s3wf#update_highlights()

augroup S3wf
  autocmd BufRead,BufNewFile *.s3wf call s3wf#update_highlights()
augroup END
