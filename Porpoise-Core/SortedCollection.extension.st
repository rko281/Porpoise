Extension { #name : 'SortedCollection' }

{ #category : '*Porpoise-Core' }
SortedCollection class >> defaultSortBlock [ 
	^[ :a :b | a <= b]
]

{ #category : '*Porpoise-Core' }
SortedCollection class >> value: a value: b [

	^a <= b
]
