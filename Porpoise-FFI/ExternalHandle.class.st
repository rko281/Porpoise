Class {
	#name : #ExternalHandle,
	#superclass : #FFIConstantHandle,
	#category : #'Porpoise-FFI'
}

{ #category : #'class initialization' }
ExternalHandle class >> initialize [

	"
	self initialize
	"

	Smalltalk addToStartUpList: self
]

{ #category : #'system startup' }
ExternalHandle class >> startUp: isImageStarting [
	"Private - Ensure that old external resources are cleared so that they will be re-created."

	isImageStarting ifTrue: [self allInstancesDo: [ :each | each invalidateHandle]]
]

{ #category : #initialization }
ExternalHandle >> invalidateHandle [

	handle := 0
]
