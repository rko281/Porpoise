Extension { #name : #SharedPool }

{ #category : #'*Porpoise-Core' }
SharedPool class >> at: aKey [

	^self classPool at: aKey
]

{ #category : #'*Porpoise-Core' }
SharedPool class >> keyAtValue: anObject [

	^self classPool keyAtValue: anObject
]

{ #category : #'*Porpoise-Core' }
SharedPool class >> keyAtValue: anObject ifAbsent: aBlock [

	^self classPool keyAtValue: anObject ifAbsent: aBlock
]
