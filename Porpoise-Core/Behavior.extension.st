Extension { #name : #Behavior }

{ #category : #'*Porpoise-Core' }
Behavior >> addClassConstant: aString value: anObject [

	(self classVarNames includes: aString asSymbol) ifFalse: [ 	self addClassVarNamed: aString].
	self classPool at: aString asSymbol put: anObject
]

{ #category : #'*Porpoise-Core' }
Behavior >> isAbstract: aBoolean [
]

{ #category : #'*Porpoise-Core' }
Behavior >> lookupMethod: aSymbol [

	^self lookupSelector: aSymbol
]

{ #category : #'*Porpoise-Core' }
Behavior >> primAllSubinstances [

	^self allSubInstances
]
