" Basic syntax highlighting for Ken Thompson's B language
syntax clear
syntax keyword bKeyword extrn auto while if else return
syntax keyword bConst stdout stdin
syntax keyword bOperator = - + ( ) { } ; ,
syntax match bString /".*"/

highlight link bKeyword Keyword
highlight link bConst Boolean
highlight link bOperator Operator
highlight link bString String
