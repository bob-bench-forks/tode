browse
browseproject
  "
  browse project <regex-pattern>
  browse project --exact <project-name>
"

  | block pattern |
  self getSubcommandOptsMixedLongShort: {#('exact' nil #'none')}.
  pattern := ''.
  subArguments do: [ :arg | pattern := pattern , ' ' , arg ].
  block := [ self findProject ].
  ^ self browseClassesBlock: block label: 'Defs in project' , pattern