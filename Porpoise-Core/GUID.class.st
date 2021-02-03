Class {
	#name : #GUID,
	#superclass : #UUID,
	#type : #bytes,
	#category : #'Porpoise-Core'
}

{ #category : #'instance creation' }
GUID class >> fromBytes: guidBytes [

	| guid |
	
	guid := self newNull.

	^guidBytes replaceBytesOf: guid from: 1 to: guid byteSize startingAt: 1
]

{ #category : #'instance creation' }
GUID class >> fromString: aString [

	^super fromString: (aString allButFirst allButLast)
]

{ #category : #'instance creation' }
GUID class >> newNull [

	^self nilUUID
]
