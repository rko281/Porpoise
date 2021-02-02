Extension { #name : #FFIStructure }

{ #category : #'*Porpoise-FFI' }
FFIStructure class >> withBytes: aByteArray [

	^aByteArray copyBytesTo: self new
]
