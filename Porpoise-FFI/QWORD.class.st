Class {
	#name : #QWORD,
	#superclass : #ExternalInteger,
	#category : #'Porpoise-FFI'
}

{ #category : #converting }
QWORD class >> asExternalTypeOn: generator [ 

	^FFIUInt64 asExternalTypeOn: generator 
]

{ #category : #'field definition' }
QWORD class >> byteSize [

	^8
]

{ #category : #'field definition' }
QWORD class >> fields [
	" 
	QWORD defineFields 
	"
	^ #(#(#value 'ulonglong') )
]

{ #category : #accessing }
QWORD >> value [
	"This method was automatically generated. See QWORD class>>fields."
	<generated>
	^handle unsignedLongLongAt: 1
]

{ #category : #accessing }
QWORD >> value: anObject [
	"This method was automatically generated. See QWORD class>>fields."
	<generated>
	handle unsignedLongLongAt: 1 put: anObject
]
