set conceallevel=1

" Syntax -------------------------------------------------------
" Character definition
syntax match S3wfCharaId /\v\@[a-z0-9_]+/ contained
syntax match S3wfCharaColor /\v\c#[0-9a-f]{6}/ contained
syntax match S3wfCharaDef /\v\c^\@[a-z0-9_]+\=#[0-9a-f]{6},[^[:space:]]+/ contains=S3wfCharaId,S3wfCharaColor
" Sections
syntax match S3wfTitle /\v^#+ .+$/

" Conceal ------------------------------------------------------
syntax match S3wfNewLine / ;;$/ conceal cchar=↵

" Highlight ----------------------------------------------------
highlight default link S3wfCharaId Keyword
highlight default link S3wfCharaColor Underlined
highlight default link S3wfCharaDef Special
highlight default link S3wfTitle Title
