Extension { #name : 'Collection' }

{ #category : '*Porpoise-Core' }
Collection >> approxSize [
	"Private - Answer the approximate size of the receiver.
	Implementation Note: This does not have to be accurate, but it should be fast
	(i.e. don't calculate it by counting the receiver's elements).
	Dolphin defaults to 2, but we have such a wide messy hierarchy,
	it's easier for the subclasses that *don't* have a fast #size to override."

	^ self size
]

{ #category : '*Porpoise-Core' }
Collection >> copyLike [

	^self copyLike: (self size ifNil: [ 0 ])
]

{ #category : '*Porpoise-Core' }
Collection >> copyLike: anInteger [

	^self species new: anInteger
]
