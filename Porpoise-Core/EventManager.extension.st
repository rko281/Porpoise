Extension { #name : #EventManager }

{ #category : #'*Porpoise-Core' }
EventManager class >> actionMapFor: anObject put: anActionMap [
	^ anActionMap
		ifNil: [ self releaseActionMapFor: anObject ]
		ifNotNil: [ self actionMaps at: anObject put: anActionMap ]
]

{ #category : #'*Porpoise-Core' }
EventManager class >> actionMapOrNilFor: anObject [
	^ self actionMaps at: anObject ifAbsent: [  ]
]
