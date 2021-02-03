Extension { #name : #Dictionary }

{ #category : #'*Porpoise-Core' }
Dictionary >> shrink [
]

{ #category : #'*Porpoise-Core' }
Dictionary class >> withAll: aCollectionOfAssociations [

	| new |
	
	new := Dictionary new: aCollectionOfAssociations size // 2.
	aCollectionOfAssociations do: [ :each | new at: each key put: each value ].
	^new
]
