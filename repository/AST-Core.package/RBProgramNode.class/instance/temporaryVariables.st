accessing
temporaryVariables
	^parent isNil ifTrue: [#()] ifFalse: [parent temporaryVariables]