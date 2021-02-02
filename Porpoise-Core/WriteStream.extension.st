Extension { #name : #WriteStream }

{ #category : #'*Porpoise-Core' }
WriteStream >> basicPrint: anObject [

	self nextPutAll: 'a '; nextPutAll: anObject class name
]
