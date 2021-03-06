as yet unclassified
specialChildNodeNameList: parentNode
  | specialList |
  specialList := parentNode topez displayOops
    ifTrue: [ #('(class)' '(oop)') ]
    ifFalse: [ #('(class)') ].
  parentNode basicContents isInvariant
    ifTrue: [ specialList := specialList , #('(invariant)') ].
  (parentNode basicContents respondsTo: #'isTranlogged')
    ifTrue: [ 
      (parentNode basicContents perform: #'isTranlogged')
        ifFalse: [ specialList := specialList , #('(notTranlogged)') ] ].
  parentNode basicContents isCommitted
    ifTrue: [ specialList := specialList , #('(committed)') ].
  (DependencyList for: parentNode basicContents)
    ifNotNil: [ specialList := specialList , #('(dependents)') ].
  ^ specialList