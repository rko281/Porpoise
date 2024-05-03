Extension { #name : 'Dictionary' }

{ #category : '*Porpoise-Core' }
Dictionary >> keyAtEqualValue: anObject ifAbsent: aBlock [

	"keyAtValue: uses equality"

	^self keyAtValue: anObject ifAbsent: aBlock
]

{ #category : '*Porpoise-Core' }
Dictionary >> lookup: keyObject [
	"Answer the value named by the <Object> argument, keyObject, or nil if there is no such key in the receiver.
	Clearly if the receiver can contain nil values then it will not be possible to distinguish between the absence
	of the key and the key being associated with a nil value. However, this method expresses the
	very common pattern of passing an empty block as absent handler to #at:ifAbsent:, e.g.
		(dict at: key ifAbsent: []) ifNotNil: [:value | value ...]"

	^(array at: (self findElementOrNil: keyObject)) ifNotNil: [:element | element value]
]

{ #category : '*Porpoise-Core' }
Dictionary >> shrink [
]

{ #category : '*Porpoise-Core' }
Dictionary class >> withAll: aCollectionOfAssociations [

	| new |
	
	new := Dictionary new: aCollectionOfAssociations size // 2.
	aCollectionOfAssociations do: [ :each | new at: each key put: each value ].
	^new
]
