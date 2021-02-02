Class {
	#name : #Utf16String,
	#superclass : #ExternalString,
	#classInstVars : [
		'encoder'
	],
	#category : #'Porpoise-FFI'
}

{ #category : #'instance creation' }
Utf16String class >> _fromByteArray: aByteArray [

	"Private - answer an instance of the receiver containing the bytes aByteArray.
	Compare with the public implementation fromByteArray: which returns an appropriate String instance"

	^(self new: aByteArray size // 2) replaceFrom: 1 to: aByteArray size with: aByteArray
]

{ #category : #accessing }
Utf16String class >> encoder [

	"Unexplained changing of already-initialized encoder to big endian, so always reset"
	^(encoder ifNil: [ encoder := ZnUTF16Encoder new]) beLittleEndian
]

{ #category : #'instance creation' }
Utf16String class >> fromByteArray: aByteArray [

	"aByteArray is a valid sequence of Windows UTF16 bytes.
	Create and answer an equivalent String (ByteString or WideString depending on contents of aByteArray)"
	
	^self encoder decodeBytes: aByteArray
]

{ #category : #'instance creation' }
Utf16String class >> fromByteString: aByteString [

	^self withAll: (self encoder encodeString: aByteString)
]

{ #category : #'instance creation' }
Utf16String class >> fromString: aString [

	^self _fromByteArray: (self encoder encodeString: aString)
]

{ #category : #'instance creation' }
Utf16String class >> new: anInteger [ 

	^super new: anInteger * 2
]

{ #category : #'instance creation' }
Utf16String class >> newFixed: anInteger [

	^super newFixed: anInteger * 2
]

{ #category : #converting }
Utf16String >> asByteArray [

	^super copyFrom: 1 to: self size * 2
]

{ #category : #copying }
Utf16String >> copyFrom: startIndex to: endIndex [

	^startIndex = 1
		ifTrue: [ self encoder decodeBytes: (super copyFrom: startIndex to: endIndex  * 2) ]
		ifFalse: [ self encoder decodeBytes: (super copyFrom: ((startIndex - 1) * 2) + 1 to: ((endIndex - 1)  * 2) + 1) ]
]

{ #category : #accessing }
Utf16String >> encoder [

	^self class encoder
]

{ #category : #printing }
Utf16String >> printOn: aStream [

	self asString printOn: aStream
]

{ #category : #accessing }
Utf16String >> size [

	^super size // 2
]
