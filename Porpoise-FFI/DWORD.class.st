Class {
	#name : #DWORD,
	#superclass : #ExternalInteger,
	#category : #'Porpoise-FFI'
}

{ #category : #converting }
DWORD class >> asExternalTypeOn: generator [ 

	^FFIUInt32 asExternalTypeOn: generator 
]

{ #category : #'field definition' }
DWORD class >> byteSize [

	^4
]

{ #category : #'field definition' }
DWORD class >> fields [
	" 
	DWORD defineFields 
	"
	^ #(#(#value 'ulong') )
]

{ #category : #accessing }
DWORD >> value [
	"This method was automatically generated. See DWORD class>>fields."
	<generated>
	^handle unsignedLongAt: 1
]

{ #category : #accessing }
DWORD >> value: anObject [
	"This method was automatically generated. See DWORD class>>fields."
	<generated>
	handle unsignedLongAt: 1 put: anObject
]
