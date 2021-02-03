Extension { #name : #Collection }

{ #category : #'*Porpoise-Core' }
Collection >> copyLike [

	^self copyLike: (self size ifNil: [ 0 ])
]

{ #category : #'*Porpoise-Core' }
Collection >> copyLike: anInteger [

	^self species new: anInteger
]
