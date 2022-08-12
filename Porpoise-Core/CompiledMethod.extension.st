Extension { #name : #CompiledMethod }

{ #category : #'*Porpoise-Core' }
CompiledMethod >> value: anObject withArguments: aCollection [

	^self valueWithReceiver: anObject arguments: aCollection
]
