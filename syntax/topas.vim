" Vim syntax file
" Language: TOPAS
" Maintainer: Murdock Grewar
" Latest Revision: 23 June 2021

" Keywords
syn keyword basicKeywords includeFile nextgroup=equalssign
highlight link basicKeywords Tag

" List of highlight group names, such as "comment" and "constant", available
" at http://vimdoc.sourceforge.net/htmldoc/syntax.html
"
" vim uses an ancient dialect of regex that doesn't obey usual regex rules.
" See https://jeetblogs.org/post/vim-regular-expression-special-characters-to-escape-or-not-to-escape/
" Can precede regex expressions with '\v' to get mostly normal regex
" behaviour.
"
" Under the '\v' usage, non-capturing regex groups can be expressed with a
" percentage sign before the parantheses, like %(...) instead of (...).
" This way the grouped expression is not captured. Vim can only keep a track
" of 10 capture groups at a time before complaining about 'too many '('' so it
" is necessary to use these non-capturing groups.

" String variables to be used multiple times later
let s:mainsections  = '%(Ma|El|Is|Ge|So|Ph|Vr|Sc|Gr|Tf|Ts)'
let s:wordpattern   = '[a-zA-Z][a-zA-Z0-9]*' " For some reason, vim does not like the '\w' keyword of regex...
let s:paramsectionpattern = s:mainsections . '/(' . s:wordpattern . '/)*'
let s:endlinepatt   = '\s*%(#|$)' " Pattern indicating end of line, beginning with whitespace(?) and ending either with a comment or actual end-of-line

""" Constants
let s:unit          = '%(nm|um|mm|cm|m|deg|rad|eV|keV|MeV|GeV|Sv\*mm2)'
" bools
let s:boolpattern   = '"%(False|false|FALSE|f|0|True|true|TRUE|t|1)"'
" strings
let s:stringpattern = '"[^"]*"'
" integers
let s:intpattern    = '-?[0-9]+'
let s:posintpattern = '[1-9][0-9]*'
" doubles (unitless part)
let s:doublepattern = '-?[0-9]+%(\.[0-9]*)?'

" int vector
let s:integervectorpattern  = s:posintpattern . '%(\s+' . s:intpattern      . ')+'
" bool vector
let s:boolvectorpattern     = s:posintpattern . '%(\s+' . s:boolpattern     . ')+'
" string vector
let s:stringvectorpattern   = s:posintpattern . '%(\s+' . s:stringpattern   . ')+'
" double vector (has units)
let s:doublevectorpattern   = s:posintpattern . '%(\s+' . s:doublepattern   . ')+\s+' . s:unit
" unitless vector
let s:unitlessvectorpattern = s:posintpattern . '%(\s+' . s:doublepattern   . ')+'

""" Compound constants/parameters
" Compound parameter syntax outline at this page: https://topas.readthedocs.io/en/latest/parameters/intro/syntax.html?highlight=parameter#complete-set-of-allowed-syntax-for-any-one-parameter-line
let s:parampattern = s:paramsectionpattern . s:wordpattern

" Compound integer
let s:operatorinteger = '\s+%([+\-*])\s+'
let s:compoundinteger = '%(' . 
			\ s:intpattern . '|' . 
			\ s:parampattern . '|' . 
			\ '%(' . '%(' . s:intpattern . '|' . s:parampattern . ')' . s:operatorinteger . s:parampattern . ')' . '|' . 
			\ '%(' . s:parampattern . s:operatorinteger . s:intpattern . ')' . 
			\ ')'  " . 
"			\ '%(' . s:endlinepatt . ')@='

" Compound double (units)
let s:operatordouble = '\s+%([+\-*])\s+'
let s:compounddouble = '%(' . 
			\ '%(' . s:doublepattern . '|' . s:parampattern . ')' . '\s+' . s:unit . '|' . 
			\ '%(' . '%(' . s:doublepattern . '|' . s:parampattern . ')' . '\s+' . s:unit . s:operatordouble . s:parampattern . ')' . '|' .
			\ '%(' . '%(' . s:doublepattern . '|' . s:parampattern . ')' . s:operatordouble . s:parampattern . '\s+' . s:unit . ')' . '|' .
			\ '%(' . s:parampattern . '\s+' . s:unit . s:operatordouble . s:doublepattern . ')' . '|' . 
			\ '%(' . s:parampattern . s:operatordouble . s:doublepattern . '\s+' . s:unit .  ')' . 
			\ ')' " . 
"			\ '%(' . s:endlinepatt . ')@='

" Compound unitless
let s:operatorunitless = '\s+%([+\-*])\s+'
let s:compoundunitless = '%(' . 
			\ '%(' . s:doublepattern . '|' . s:parampattern . ')' . '|' . 
			\ '%(' . '%(' . s:doublepattern . '|' . s:parampattern . ')' . s:operatorunitless . s:parampattern . ')' . '|' . 
			\ '%(' . '%(' . s:doublepattern . '|' . s:parampattern . ')' . s:operatorunitless . s:parampattern . ')' . '|' . 
			\ '%(' . s:parampattern . s:operatorunitless . s:doublepattern . ')' . '|' . 
			\ '%(' . s:parampattern . s:operatorunitless . s:doublepattern . ')' . 
			\ ')' " . 
"			\ '%(' . s:endlinepatt . ')@='

" Compound string
let s:operatorstring = '\s+[+]\s+'
let s:compoundstring = '%(' . 
			\ '%(' . s:stringpattern . '|' . s:parampattern . ')' . '|' . 
			\ '%(' . '%(' . s:stringpattern . '|' . s:parampattern . ')' . s:operatorstring . s:parampattern . ')' . '|' . 
			\ '%(' . '%(' . s:stringpattern . '|' . s:parampattern . ')' . s:operatorstring . s:parampattern . ')' . '|' . 
			\ '%(' . s:parampattern . s:operatorstring . s:stringpattern . ')' . '|' . 
			\ '%(' . s:parampattern . s:operatorstring . s:stringpattern . ')' . 
			\ ')' " . 
"			\ '%(' . s:endlinepatt . ')@='

" Compound boolean
let s:compoundbool = '%(' . 
			\ s:boolpattern . '|' . 
			\ s:parampattern . '|' . 
			\ s:parampattern . '\s+\*\s+' . s:parampattern . 
			\ ')'

" Compound integer vector
let s:compoundintegervector = '%(' .
			\ s:integervectorpattern . '|' . 
			\ s:integervectorpattern . '\s+[+\-*]\s+' . s:parampattern . '|' . 
			\ s:parampattern . '|' . 
			\ s:intpattern .   '\s+[*]\s+' . s:parampattern . '|' .
			\ s:parampattern . '\s+[*]\s+' . s:parampattern . 
			\ ')'

" Compound boolean vector
let s:compoundboolvector = '%(' . 
			\ s:boolvectorpattern . '|' . 
			\ s:parampattern . 
			\ ')'

" Compound string vector
let s:compoundstringvector = '%(' . 
			\ s:stringvectorpattern . '|' . 
			\ s:parampattern . '|' . 
			\ s:stringvectorpattern . '\s+[+]\s+' . s:parampattern . 
			\ ')'

" Compound double vector
let s:compounddoublevector = '%(' . 
			\ s:doublevectorpattern . '|' . 
			\ s:doublevectorpattern . '\s+[+\-*]\s+' . s:parampattern . '|' . 
			\ s:unitlessvectorpattern . '\s+[*]\s+' . s:parampattern . '\s+' . s:unit . '|' .
			\ s:parampattern .  '\s+' . s:unit . '|' . 
			\ s:doublepattern . '\s+[*]\s+' . s:parampattern . '|' . 
			\ s:parampattern .  '\s+[*]\s+' . s:parampattern . 
			\ ')'

" Compound unitless vector
let s:compoundunitlessvector = '%(' . 
			\ s:unitlessvectorpattern . '|' . 
			\ s:unitlessvectorpattern . '\s+[+\-*]\s+' . s:parampattern . '|' . 
			\ s:parampattern . '|' . 
			\ s:doublepattern . '\s+[*]\s+' . s:parampattern . '|' . 
			\ s:parampattern .  '\s+[*]\s+' . s:parampattern . 
			\ ')'


" Match comments, including multiline comments.
" Vim regex needs the '=' sign encased in square brackets to take it
" literally, for some reason.
syn region bigcomment start='\v(#)@=' end='\v(^[^#]*[=])@='
highlight link bigcomment Comment

let s:assignmentpattern = "[=][\t ]*" " I do not know why the '\s' whitespace character doesn't work here.

" Not sure what's meant by this one.
" syn match keyword '\v(?i:inheritedvalue)'

"
syn match meta '\v^([bidus]v?c?):' nextgroup=section
highlight link meta Type

" Match constants
" Last constants listed take priority
execute 'syn match constantInvalid ''\v' . '%(' . s:assignmentpattern . ')@<=' . '[^#\t ][^#]*' . '%(' . s:endlinepatt . ')@='' contained'
syn cluster constants add=constantInvalid
highlight link constantInvalid Error

" Compound expressions
execute 'syn match compoundInteger ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compoundinteger . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundInteger
highlight link compoundInteger Number

execute 'syn match compoundDouble ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compounddouble . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundDouble
highlight link compoundDouble Float

execute 'syn match compoundUnitless ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compoundunitless . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundUnitless
highlight link compoundUnitless Float

execute 'syn match compoundString ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compoundstring . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundString
highlight link compoundString String

execute 'syn match compoundBool ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compoundbool . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundBool
highlight link compoundBool Constant

" Compound vector expressions
execute 'syn match compoundIntegerVector ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compoundintegervector . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundIntegerVector
highlight link compoundIntegerVector Number

execute 'syn match compoundDoubleVector ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compounddoublevector . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundDoubleVector
highlight link compoundDoubleVector Float

execute 'syn match compoundUnitlessVector ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compoundunitlessvector . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundUnitlessVector
highlight link compoundUnitlessVector Float

execute 'syn match compoundStringVector ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compoundstringvector . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundStringVector
highlight link compoundStringVector String

execute 'syn match compoundBoolVector ''\v' . '%(' . s:assignmentpattern . ')@<=' . s:compoundboolvector . '%(' . s:endlinepatt . ')@=' . ''' contained contains=section'
syn cluster compounds add=compoundBoolVector
highlight link compoundBoolVector Constant

" Match parameter 'section' names and parameter names
execute 'syn match section ''\v' . s:paramsectionpattern . ''' nextgroup=paramname,bad_paramname contained'
highlight link section Class

" The '(abc)@<=' is vim's screwed-up version of regex look-behind ?<=(abc)
execute 'syn match bad_paramname ''\v(' . s:paramsectionpattern . ')@<=' . '[^/ \t]+'  . ''' nextgroup=equalssign skipwhite contained'
highlight link bad_paramname Error
execute 'syn match paramname ''\v(' . s:paramsectionpattern . ')@<=' . s:wordpattern . ''' nextgroup=equalssign skipwhite contained'
highlight link paramname Attribute

"syn match equalssign '\v\s*[=]\s*' nextgroup=@compounds,constantInvalid contained skipwhite
syn region equalssign matchgroup=equalsgroup start='\v%(\s*)@<=[=]%(\s*)@=' end='\v%(\s*%(#|$))@=' contains=@compounds,constantInvalid keepend skipwhite contained oneline
highlight link equalsgroup Operator

""" Highlight bad syntax
"let s:badbool = '''\v^bc?:([^#]*(' . s:endlinepatt . ')@=(\S)@<=([=]\s*' . s:compoundbool . ')@<!)@='''
"execute 'syn match bad_bool ' . s:badbool . ' nextgroup=section'

" Non-vectors
execute 'syn match bad_int ''\v^ic?:([^#]*%(' . s:endlinepatt . ')@=(\S)@<=%([=]\s*' . s:compoundinteger . ')@<!)@='' nextgroup=section'
highlight link bad_int Error

execute 'syn match bad_bool ''\v^bc?:([^#]*(' . s:endlinepatt . ')@=(\S)@<=([=]\s*' . s:compoundbool . ')@<!)@='' nextgroup=section'
highlight link bad_bool Error

execute 'syn match bad_double ''\v^dc?:([^#]*%(' . s:endlinepatt . ')@=(\S)@<=%([=]\s*' . s:compounddouble . ')@<!)@='' nextgroup=section'
highlight link bad_double Error

execute 'syn match bad_string ''\v^sc?:([^#]*%(' . s:endlinepatt . ')@=(\S)@<=%([=]\s*' . s:compoundstring . ')@<!)@='' nextgroup=section'
highlight link bad_string Error

execute 'syn match bad_unitless ''\v^uc?:([^#]*%(' . s:endlinepatt . ')@=(\S)@<=%([=]\s*' . s:compoundunitless . ')@<!)@='' nextgroup=section'
highlight link bad_unitless Error

" Vectors
execute 'syn match bad_int_vector ''\v^ivc?:([^#]*%(' . s:endlinepatt . ')@=(\S)@<=%([=]\s*' . s:compoundintegervector . ')@<!)@='' nextgroup=section'
highlight link bad_int_vector Error

execute 'syn match bad_bool_vector ''\v^bvc?:([^#]*(' . s:endlinepatt . ')@=(\S)@<=([=]\s*' . s:compoundboolvector . ')@<!)@='' nextgroup=section'
highlight link bad_bool_vector Error

execute 'syn match bad_string_vector ''\v^svc?:([^#]*%(' . s:endlinepatt . ')@=(\S)@<=%([=]\s*' . s:compoundstringvector . ')@<!)@='' nextgroup=section'
highlight link bad_string_vector Error

execute 'syn match bad_double_vector ''\v^dvc?:([^#]*%(' . s:endlinepatt . ')@=(\S)@<=%([=]\s*' . s:compounddoublevector . ')@<!)@='' nextgroup=section'
highlight link bad_double_vector Error

execute 'syn match bad_unitless_vector ''\v^uvc?:([^#]*%(' . s:endlinepatt . ')@=(\S)@<=%([=]\s*' . s:compoundunitlessvector . ')@<!)@='' nextgroup=section'
highlight link bad_unitless_vector Error

" Match filename for includeFile
" Doesn't work for some reason
"syn region include_filename matchgroup=include_group start='\v^includeFile\s*[=]' end='(\s?(#|$))@=' oneline
"highlight link include_group Tag

" No more than 1 equals sign on a line unless a comment
execute 'syn match twoequals ''\v^[^#]*[=][^#]*[=][^#]*' . '%(' . s:endlinepatt . ')@='''
highlight link twoequals Error

