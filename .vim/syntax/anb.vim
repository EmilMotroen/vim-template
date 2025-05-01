syntax keyword anbKeyword Protocol Knowledge Actions Goals Types 
syntax keyword anbType Agent Number Symmetric_key Function
syntax keyword anbVariable A B NA NB NS KAB KBA sk pre TA TB TS IDA IDB IDS
syntax match anbComment "#.*$"
syntax keyword anbSpecialKeyword secret between authenticates where on

syntax region anbTypeDeclaration start="Number" end="$" contains=anbVariable

highlight link anbKeyword Keyword
highlight link anbType Type
highlight link anbVariable Identifier
highlight link anbComment Comment
highlight link anbSpecialKeyword Special
highlight link anbTypeDeclaration Type
