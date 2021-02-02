Extension { #name : #Message }

{ #category : #'*Porpoise-Core' }
Message >> value: anObject [

	^self sendTo: anObject
]
