Class {
	#name : #ExternalInteger,
	#superclass : #ExternalStructure,
	#category : #'Porpoise-FFI'
}

{ #category : #'instance creation' }
ExternalInteger class >> fromInteger: anInteger [
	"Answer a new instance of the receiver with contents copied from anInteger"

	^self new value: anInteger
]

{ #category : #'instance creation' }
ExternalInteger class >> new [ 

	^self externalNew 
]

{ #category : #'accessing structure variables' }
ExternalInteger >> asInteger [

	^self value
]

{ #category : #'accessing structure variables' }
ExternalInteger >> pointer [ 

	^self getHandle
]
