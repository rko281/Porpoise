Extension { #name : #Integer }

{ #category : #'*Porpoise-FFI' }
Integer >> byteSize [

	^self bytesCount
]

{ #category : #'*Porpoise-FFI' }
Integer >> isNull [
	"Answer whether the receiver is 'null' (equal to zero)."

	^self == 0
]
