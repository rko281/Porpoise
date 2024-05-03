Extension { #name : 'Integer' }

{ #category : '*Porpoise-Core' }
Integer >> exp10 [
	"Answer an <integer> which is base-10 exponent of the receiver (i.e. 10 raised to the power
	of the receiver)."

	^10 raisedToInteger: self
]

{ #category : '*Porpoise-Core' }
Integer >> isBitSet: index [

	^self anyMask: (1 bitShift: index-1)
]

{ #category : '*Porpoise-Core' }
Integer >> mask: anInteger set: aBoolean [

	^aBoolean 
		ifTrue: [ self maskSet: anInteger ] 
		ifFalse: [ self maskClear: anInteger ]
]

{ #category : '*Porpoise-Core' }
Integer >> maskClear: anInteger [

	^self bitClear: anInteger
]

{ #category : '*Porpoise-Core' }
Integer >> maskSet: anInteger [

	^self bitOr: anInteger
]

{ #category : '*Porpoise-Core' }
Integer >> setBit: n [

	^self bitAt: n put: 1
]
