tests
testNestedNoSelfReferences
  | stack haltMethodFrame baseNodeMap argAndTempNames block haltMethodCallFrame noSelfFrame x |
  block := [ self nestedBlockNoSelf ].
  stack := self runTestBlockReturnStack: block.
  haltMethodFrame := self findHaltMethodFrameFrom: stack value.
  haltMethodCallFrame := haltMethodFrame next.
  noSelfFrame := haltMethodCallFrame next.
  baseNodeMap := noSelfFrame baseNodeMap.
  argAndTempNames := noSelfFrame argAndTempNames.
  self assert: baseNodeMap size == 3.
  self assert: (baseNodeMap includesKey: '(context)').
  self
    assert:
      (x := noSelfFrame objectFor: '(homeContext)' ifAbsent: [ self assert: false ])
        == (self class compiledMethodAt: #'nestedBlockNoSelf').
  self
    assert:
      (x := noSelfFrame objectFor: '(self)' ifAbsent: [ self assert: false ]) == self.
  self assert: argAndTempNames size == 4.
  self assert: (argAndTempNames at: 1) = 'temp1'.
  self assert: (argAndTempNames at: 2) = 'temp1'.
  self assert: (argAndTempNames at: 3) = '.t1'.
  self assert: (argAndTempNames at: 4) = '.t2'.
  self assert: (x := noSelfFrame argAndTempNamesAt: 1) == 1.
  self assert: (x := noSelfFrame argAndTempNamesAt: 2) == 1