Class {
	#name : #GUID,
	#superclass : #UUID,
	#type : #bytes,
	#category : #'Porpoise-Core'
}

{ #category : #'instance creation' }
GUID class >> fromBytes: guidBytes [

	^guidBytes replaceBytesOf: self newNull from: 1 to: self byteSize startingAt: 1
]

{ #category : #'instance creation' }
GUID class >> fromString: aString [

	^super fromString: (aString allButFirst allButLast)
]

{ #category : #'instance creation' }
GUID class >> newNull [

	^self nilUUID
]
