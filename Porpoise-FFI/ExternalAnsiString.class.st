Class {
	#name : #ExternalAnsiString,
	#superclass : #ExternalString,
	#category : #'Porpoise-FFI'
}

{ #category : #accessing }
ExternalAnsiString >> at: anInteger [

	^Character value: (self byteAt: anInteger)
]

{ #category : #accessing }
ExternalAnsiString >> at: anInteger put: aCharacter [

	self byteAt: anInteger put: aCharacter asciiValue
]

{ #category : #copying }
ExternalAnsiString >> copyFrom: start to: stop [ 

	^(super copyFrom: start to: stop) asByteString 
]
