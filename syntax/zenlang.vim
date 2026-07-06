" Basic syntax highlighting for ZenLang
syntax clear

syn match zenComment "//.*$"

syn match zenString /".*"/

syn match zenNumber /\v-?\d+/

syn keyword zenKeyword fn return let null true false if elif else while break continue vmcall mod dynmod

syn keyword zenBuiltin print println get_string array_size array_push array_pop array_remove array_insert array_count array_last str_split err ok get_err get_ok read_file_bytes read_file write_file_bytes write_file boolean ord chr stringify number clone
syn keyword zenSelf self

hi def link zenComment Comment
hi def link zenTodo Todo
hi def link zenString String
hi def link zenKeyword Keyword
hi def link zenBuiltin Function
hi def link zenSelf Keyword
hi def link zenNumber Number
