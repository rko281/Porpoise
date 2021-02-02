Class {
	#name : #SQWORD,
	#superclass : #QWORD,
	#category : #'Porpoise-FFI'
}

{ #category : #'field definition' }
SQWORD class >> asExternalTypeOn: generator [ 

	^FFIInt64 asExternalTypeOn: generator 
]

{ #category : #'field definition' }
SQWORD class >> fields [
	" 
	SQWORD defineFields 
	"
	^ #(#(#value 'longlong') )
]

{ #category : #accessing }
SQWORD >> value [
	"This method was automatically generated. See SQWORD class>>fields."
	<generated>
	^handle signedLongLongAt: 1
]

{ #category : #accessing }
SQWORD >> value: anObject [
	"This method was automatically generated. See SQWORD class>>fields."
	<generated>
	handle signedLongLongAt: 1 put: anObject
]
