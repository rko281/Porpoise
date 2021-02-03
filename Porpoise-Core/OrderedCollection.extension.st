Extension { #name : #OrderedCollection }

{ #category : #'*Porpoise-Core' }
OrderedCollection >> removeAtIndex: anInteger [

	^self removeAt: anInteger
]

{ #category : #'*Porpoise-Core' }
OrderedCollection >> removeFirstIfAbsent: exceptionHandler [
	"Remove and answer the first element of the receiver, but if the
	receiver is empty answer the result of evaluating the <niladicValuable>,
	exceptionHandler."

	self isEmpty ifTrue: [^exceptionHandler value].
	^self removeFirst
]
