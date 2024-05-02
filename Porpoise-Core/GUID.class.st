Class {
	#name : #GUID,
	#superclass : #UUID,
	#category : #'Porpoise-Core'
}

{ #category : #'instance creation' }
GUID class >> fromBytes: guidBytes [

	^UUID withAll: guidBytes
]

{ #category : #'instance creation' }
GUID class >> fromString: aString [

	^super fromString: (aString allButFirst allButLast)
]

{ #category : #'instance creation' }
GUID class >> newNull [

	^UUID nilUUID
]

{ #category : #'instance creation' }
GUID class >> newUnique [

	^UUID new
]
