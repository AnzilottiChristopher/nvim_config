; indent after opening braces
[
  (compound_statement)
  (class_declaration)
  (interface_declaration)
] @indent.type

; align with opening delimiter
[
  "{"
  "}"
] @indent.bracket

; dedent on closing brace
"}" @indent.end
