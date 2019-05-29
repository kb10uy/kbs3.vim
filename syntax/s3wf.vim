set conceallevel=1

" Syntax
syntax match S3wfCharaDef /\c\v^\@[a-z0-9_]+=#[0-9a-f]{6},[^\s]+$/

" Highlight
highlight link S3wfCharaDef Special

" Conceal
syntax match S3wfNewLine / ;;$/ conceal cchar=↵
