Class {
	#name : #WORD,
	#superclass : #ExternalInteger,
	#category : #'Porpoise-FFI'
}

{ #category : #converting }
WORD class >> asExternalTypeOn: generator [ 

	^FFIUInt16 asExternalTypeOn: generator 
]

{ #category : #'field definition' }
WORD class >> byteSize [ 

	^2
]

{ #category : #'field definition' }
WORD class >> fields [
	" 
	WORD defineFields 
	"
	^ #(#(#value 'ushort') )
]

{ #category : #accessing }
WORD >> value [
	"This method was automatically generated. See WORD class>>fields."
	<generated>
	^handle unsignedShortAt: 1
]

{ #category : #accessing }
WORD >> value: anObject [
	"This method was automatically generated. See WORD class>>fields."
	<generated>
	handle unsignedShortAt: 1 put: anObject
]
