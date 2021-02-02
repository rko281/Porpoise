Class {
	#name : #SWORD,
	#superclass : #WORD,
	#category : #'Porpoise-FFI'
}

{ #category : #converting }
SWORD class >> asExternalTypeOn: generator [ 

	^FFIInt16 asExternalTypeOn: generator 
]

{ #category : #'field definition' }
SWORD class >> fields [
	" 
	SWORD defineFields 
	"
	^ #(#(#value 'short') )
]

{ #category : #accessing }
SWORD >> value [
	"This method was automatically generated. See SWORD class>>fields."
	<generated>
	^handle signedShortAt: 1
]

{ #category : #accessing }
SWORD >> value: anObject [
	"This method was automatically generated. See SWORD class>>fields."
	<generated>
	handle signedShortAt: 1 put: anObject
]
