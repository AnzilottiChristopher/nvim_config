; this — like self in Rust
(this_expression) @variable.builtin
; method calls
(call_expression
  function: (field_expression
    field: (field_identifier) @function.method.call))
; Types — primitive and class types
(primitive_type
  base: _ @type)
(class_type
  base: (identifier) @type)
; Ownership sigils
(class_type
  ownership: _ @operator)
; Class and interface names
(class_declaration
  name: (identifier) @type)
(interface_declaration
  name: (identifier) @type)
; Functions and methods
(function_definition
  declarator: (function_declarator
    declarator: (identifier) @function))
; Import path
(import_declaration
  path: (string) @string.special)
; Fields
(field_declaration
  name: (identifier) @variable.member)
; Parameters
(sea_parameter
  name: (identifier) @variable.parameter)
; Identifiers
(identifier) @variable
; Literals
(string_literal) @string
(number_literal) @number
; Comments
(comment) @comment
; Operators
"->" @operator
"*" @operator
"&" @operator
"=" @operator
"+" @operator
"-" @operator
"/" @operator
"%" @operator
"==" @operator
"!=" @operator
"<" @operator
">" @operator
"<=" @operator
">=" @operator
; Keywords — after identifiers so they take priority
"class" @keyword
"interface" @keyword
"inherit" @keyword
"implements" @keyword
"pub" @keyword
"new" @keyword
"drop" @keyword
"import" @keyword
"from" @keyword
"return" @keyword
"if" @keyword
"else" @keyword
"while" @keyword
"for" @keyword
"in" @keyword
"switch" @keyword
"case" @keyword
"break" @keyword
"continue" @keyword
"void" @keyword
"shared" @keyword
; Methods — after identifiers so @function.method overrides @variable
(sea_style_method
  name: (identifier) @function.method)
(c_style_method
  name: (identifier) @function.method)
; init constructor — after identifiers
"init" @function.method
