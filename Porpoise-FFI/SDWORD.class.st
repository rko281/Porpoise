Class {
	#name : #SDWORD,
	#superclass : #DWORD,
	#category : #'Porpoise-FFI'
}

{ #category : #converting }
SDWORD class >> asExternalTypeOn: generator [ 

	^FFIInt32 asExternalTypeOn: generator 
]

{ #category : #'field definition' }
SDWORD class >> fields [
	" 
	SDWORD defineFields 
	"
	^ #(#(#value 'long') )
]

{ #category : #accessing }
SDWORD >> value [
	"This method was automatically generated. See SDWORD class>>fields."
	<generated>
	^handle signedLongAt: 1
]

{ #category : #accessing }
SDWORD >> value: anObject [
	"This method was automatically generated. See SDWORD class>>fields."
	<generated>
	handle signedLongAt: 1 put: anObject
]
