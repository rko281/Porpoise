Extension { #name : 'Message' }

{ #category : '*Porpoise-Core' }
Message >> argumentCount [

	^self numArgs
]

{ #category : '*Porpoise-Core' }
Message >> value: anObject [

	^self sendTo: anObject
]
