Class {
	#name : #ExternalByteArray,
	#superclass : #ArrayedCollection,
	#instVars : [
		'handle',
		'size'
	],
	#category : #'Porpoise-FFI'
}

{ #category : #converting }
ExternalByteArray class >> asExternalTypeOn: generator [

	^FFIExternalArrayType objectClass: self
]

{ #category : #'instance creation' }
ExternalByteArray class >> new: anInteger [

	^(super new: 0)
		size: anInteger;
		generateHandle;
		yourself
]

{ #category : #'instance creation' }
ExternalByteArray class >> newFixed: anInteger [

	^self new: anInteger
]

{ #category : #converting }
ExternalByteArray >> asByteArray [

	^self copyFrom: 1 to: self size
]

{ #category : #accessing }
ExternalByteArray >> at: anInteger [

	^handle unsignedByteAt: anInteger
]

{ #category : #accessing }
ExternalByteArray >> at: anInteger put: byte [

	^handle unsignedByteAt: anInteger put: byte asInteger
]

{ #category : #accessing }
ExternalByteArray >> basicAt: anInteger [

	^handle unsignedByteAt: anInteger
]

{ #category : #accessing }
ExternalByteArray >> basicAt: anInteger put: byte [

	^handle unsignedByteAt: anInteger put: byte asInteger
]

{ #category : #accessing }
ExternalByteArray >> byteAt: anInteger [

	^handle unsignedByteAt: anInteger
]

{ #category : #accessing }
ExternalByteArray >> byteAt: anInteger put: byte [

	^handle unsignedByteAt: anInteger put: byte
]

{ #category : #copying }
ExternalByteArray >> copyBytesTo: anFFIStructure [

	^anFFIStructure 
		setHandle: self handle;
		yourself
]

{ #category : #copying }
ExternalByteArray >> copyFrom: startIndex to: endIndex [

	^self handle copyFrom: startIndex to: endIndex
]

{ #category : #converting }
ExternalByteArray >> decodeUtf16: anInteger [

	"Decode a Utf16String of anInteger bytes from the receiver.
	Return a ByteString or WideString as appropriate for the contents"

	| stream offset |

	stream := WriteStream on: (String new: anInteger).
	offset := 0.
	
	[ offset >= anInteger ] whileFalse: 
		[ | codePoint leadSurrogate trailSurrogate |
		codePoint := self wordAtOffset: offset.
		offset := offset + 2.
		(codePoint < 16rD800 or: [codePoint > 16rDFF]) ifFalse: 
			[leadSurrogate :=  codePoint.
			trailSurrogate := self wordAtOffset: offset.
			offset := offset + 2.
			codePoint := 16r10000 + ((leadSurrogate - 16rD800) * 16r400 + (trailSurrogate - 16rDC00))].
		
		(codePoint > 255 and: [ stream originalContents isWideString not ]) ifTrue: 
			[ | wideString position |
			position := stream position.
			wideString := WideString from: stream originalContents.
			stream on: wideString; setFrom: position + 1 to: position ].

		stream nextPut: (Character value: codePoint) ].
	
	^stream contents

]

{ #category : #accessing }
ExternalByteArray >> doubleAtOffset: byteOffset [
	"Return a 32bit signed integer starting at the given byte offset"
	^handle doubleAt: byteOffset + 1
]

{ #category : #accessing }
ExternalByteArray >> doubleAtOffset: byteOffset put: value [
	^handle doubleAt: byteOffset + 1 put: value
]

{ #category : #accessing }
ExternalByteArray >> dwordAtOffset: anInteger [ 
	"Return a 32bit unsigned integer starting at the given byte offset"
	^handle integerAt: anInteger + 1 size: 4 signed: false
]

{ #category : #accessing }
ExternalByteArray >> dwordAtOffset: byteOffset put: anInteger [
	"Store a 32bit unsigned integer starting at the given byte offset"
	^handle integerAt: byteOffset + 1 put: anInteger size: 4 signed: false
]

{ #category : #accessing }
ExternalByteArray >> floatAtOffset: byteOffset [
	^handle floatAt: byteOffset + 1
]

{ #category : #accessing }
ExternalByteArray >> floatAtOffset: byteOffset put: value [
	^handle floatAt: byteOffset + 1 put: value
]

{ #category : #initialization }
ExternalByteArray >> generateHandle [

	handle := ExternalAddress gcallocate: size
]

{ #category : #accessing }
ExternalByteArray >> getHandle [ 

	^handle
]

{ #category : #accessing }
ExternalByteArray >> handle [
	^handle
]

{ #category : #accessing }
ExternalByteArray >> handle: anObject [
	handle := anObject
]

{ #category : #'private-ffi' }
ExternalByteArray >> packToArity: anInteger [ 

	^handle packToArity: anInteger
]

{ #category : #'accessing structure variables' }
ExternalByteArray >> pointer [ 

	^handle pointer
]

{ #category : #accessing }
ExternalByteArray >> replaceBytesOf: aString from: start to: stop startingAt: anInteger [ 

	| offset bytes |
	
	aString class = Utf16String ifTrue: [ ^self replaceUtf16BytesOf: aString from: start to: stop startingAt: anInteger ].

	offset := anInteger - start.

	bytes := self copyFrom: anInteger to: (stop - start + 1).
	start to: stop do: 
		[ :index |
		aString byteAt: index put: (bytes byteAt: (index + offset))].
	
	^aString
]

{ #category : #accessing }
ExternalByteArray >> replaceFrom: start to: stop with: replacement startingAt: repStart [ 
	handle replaceFrom: start to: stop with: replacement asByteArray startingAt: repStart
]

{ #category : #accessing }
ExternalByteArray >> replaceUtf16BytesOf: aUtf16String from: start to: stop startingAt: anInteger [ 

	"Literal meaning - replace the bytes ofUtf16String with those of the receiver.
	Use case - manifesting a concrete String with the bytes resuling from a Windows FFI call.
	Since Utf16Strings are only used for marshalling to/from Windows calls, 
	we instead create an appropriate String (Byte or Wide) and become: aUtf16String to this"

	start = 1 ifFalse: [ self notYetImplemented ].
	
	^aUtf16String become: (Utf16String fromByteArray: (self copyFrom: start to: stop))
]

{ #category : #copying }
ExternalByteArray >> resize: anInteger [

	^self become: (self copyFrom: 1 to: anInteger)
]

{ #category : #accessing }
ExternalByteArray >> sdwordAtOffset: anInteger [ 
	"Return a 32bit signed integer starting at the given byte offset"
	^handle integerAt: anInteger + 1 size: 4 signed: true
]

{ #category : #accessing }
ExternalByteArray >> sdwordAtOffset: byteOffset put: anInteger [
	"Store a 32bit signed integer starting at the given byte offset"
	^handle integerAt: byteOffset + 1 put: anInteger size: 4 signed: true
]

{ #category : #accessing }
ExternalByteArray >> size [
	^ size
]

{ #category : #accessing }
ExternalByteArray >> size: anObject [
	size := anObject
]

{ #category : #accessing }
ExternalByteArray >> sqwordAtOffset: anInteger [ 
	"Return a 64bit signed integer starting at the given byte offset"
	^handle integerAt: anInteger + 1 size: 8 signed: true
]

{ #category : #accessing }
ExternalByteArray >> sqwordAtOffset: byteOffset put: anInteger [
	"Store a 64bit signed integer starting at the given byte offset"
	^handle integerAt: byteOffset + 1 put: anInteger size: 8 signed: true
]

{ #category : #accessing }
ExternalByteArray >> swordAtOffset: anInteger [ 
	"Return a 16bit signed integer starting at the given byte offset"
	^handle integerAt: anInteger + 1 size: 2 signed: true
]

{ #category : #accessing }
ExternalByteArray >> swordAtOffset: byteOffset put: anInteger [
	"Store a 16bit signed integer starting at the given byte offset"
	^handle integerAt: byteOffset + 1 put: anInteger size: 2 signed: true
]

{ #category : #accessing }
ExternalByteArray >> wordAtOffset: anInteger [ 
	"Return a 16bit unsigned integer starting at the given byte offset"
	^handle integerAt: anInteger + 1 size: 2 signed: false
]

{ #category : #accessing }
ExternalByteArray >> wordAtOffset: byteOffset put: anInteger [
	"Store a 16bit unsigned integer starting at the given byte offset"
	^handle integerAt: byteOffset + 1 put: anInteger size: 2 signed: false
]
