Class {
	#name : 'GUID',
	#superclass : 'UUID',
	#category : 'Porpoise-Core',
	#package : 'Porpoise-Core'
}

{ #category : 'instance creation' }
GUID class >> fromBytes: guidBytes [

	^self withAll: guidBytes
]

{ #category : 'instance creation' }
GUID class >> fromString: aString [

	^UUID fromString: (aString allButFirst allButLast)
]

{ #category : 'instance creation' }
GUID class >> newNull [

	^UUID nilUUID
]

{ #category : 'instance creation' }
GUID class >> newUnique [

	^UUID new
]

{ #category : 'instance creation' }
GUID class >> withAll: aByteArray [

	^UUID new uuidData: aByteArray
]

{ #category : 'private' }
GUID >> species [

	^UUID
]
