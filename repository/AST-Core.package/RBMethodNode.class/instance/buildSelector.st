private
buildSelector
	| selectorStream |
	selectorStream := WriteStream on: (String new: 50).
	selectorParts do: [:each | selectorStream nextPutAll: each value].
	^selectorStream contents asSymbol