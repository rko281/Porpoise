Extension { #name : #Object }

{ #category : #'*Porpoise-Core' }
Object >> asValue [

	^self asValueHolder 
]

{ #category : #'*Porpoise-Core' }
Object >> beFinalizable [

	"Similar to but not identical to Dolphin finalization behavior.
	In Pharo, the #finalize message is sent to the receiver's executor (normally a shallowCopy of the receiver), not the receiver itself"

	self finalizationRegistry add: self
]

{ #category : #'*Porpoise-Core' }
Object >> beUnfinalizable [

	self finalizationRegistry remove: self ifAbsent: [ ]
]

{ #category : #'*Porpoise-Core' }
Object >> debugPrintString [

	^self printString
]

{ #category : #'*Porpoise-Core' }
Object >> displayOn: aStream [

	self displayStringOn: aStream
]

{ #category : #'*Porpoise-Core' }
Object >> expandMacrosIn: aString [

	"Private - Expand aString with the replaceable argument represented by the receiver."

	^aString expandMacrosWith: self
]

{ #category : #'*Porpoise-Core' }
Object >> getEvents [

	^nil
]

{ #category : #'*Porpoise-Core' }
Object >> setEvents: anObject [
]
