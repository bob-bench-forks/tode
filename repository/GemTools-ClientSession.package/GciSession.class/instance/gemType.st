accessing
gemType

	^gemNRS isNil
		ifTrue: ['Linked']
		ifFalse: ['Remote'].
		