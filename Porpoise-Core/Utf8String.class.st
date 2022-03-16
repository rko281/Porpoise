Class {
	#name : #Utf8String,
	#superclass : #String,
	#category : #'Porpoise-Core'
}

{ #category : #'instance creation' }
Utf8String class >> fromByteArray: aByteArray [

	^ZnUTF8Encoder default decodeBytes: aByteArray
]
