private-formatting
formatBlock: aBlockNode
	(LineUpBlockBrackets and: [ self willBeMultiline: aBlockNode body ])
		ifTrue: [ self newLine ]
		ifFalse: [ codeStream nextPutAll: StringInsideBlocks ].
	self formatBlockArgumentsFor: aBlockNode.
	(self willBeMultiline: aBlockNode body)
		ifTrue: [ self newLine ].
	self visitNode: aBlockNode body.
	(LineUpBlockBrackets and: [ self willBeMultiline: aBlockNode body ])
		ifTrue: [ self newLine ]
		ifFalse: [ codeStream nextPutAll: StringInsideBlocks ]