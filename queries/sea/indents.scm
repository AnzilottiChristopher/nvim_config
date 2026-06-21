; new style
(compound_statement) @indent
"}" @dedent

; old style fallback
[
  (compound_statement)
  (class_declaration)
  (interface_declaration)
] @indent.type

[
  "{"
  "}"
] @indent.bracket

"}" @indent.end
