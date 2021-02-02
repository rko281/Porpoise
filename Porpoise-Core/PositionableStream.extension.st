Extension { #name : #PositionableStream }

{ #category : #'*Porpoise-Core' }
PositionableStream >> skipWhile: aMonadicValuable [
	"Advance the receiver's current position to be past the sequence of future values for which
	the <monadicValuable> argument evaluates to true. Answer true if there are more elements on
	the stream of false otherwise."

	[self atEnd] whileFalse: 
			[| pos |
			pos := self position.
			(aMonadicValuable value: self next)
				ifFalse: 
					[self position: pos.
					^true]].
	^false
]
