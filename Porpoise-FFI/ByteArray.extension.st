Extension { #name : #ByteArray }

{ #category : #'*Porpoise-FFI' }
ByteArray >> copyBytesTo: aFFIStructure [

	"LibC memCopy: self to: aFFIStructure getHandle size: self class byteSize ?"
	
	self notYetImplemented 
]

{ #category : #'*Porpoise-FFI' }
ByteArray class >> newFixed: anInteger [ 
	^ExternalByteArray newFixed: anInteger
]

{ #category : #'*Porpoise-FFI' }
ByteArray >> replaceBytesOf: aString from: start to: stop startingAt: anInteger [ 

	^aString replaceFrom: start to: stop with: self startingAt: anInteger
]

{ #category : #'*Porpoise-FFI' }
ByteArray >> sdwordAtOffset: anInteger [ 

	^self signedLongAt: anInteger + 1
]
