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
Object >> isImmutable: aBoolean [
]

{ #category : #'*Porpoise-Core' }
Object >> propertyAt: aSymbol [
	"Answers a property value of the receiver whose name matches aSymbol."

	^self propertyManager propertyOf: self at: aSymbol.
]

{ #category : #'*Porpoise-Core' }
Object >> propertyAt: aSymbol ifAbsent: aBlock [
	"Answers a property value of the receiver whose name matches aSymbol. If the object
	does not have such a property then aBlock is evaluated."

	^self propertyManager propertyOf: self at: aSymbol ifAbsent: aBlock.
]

{ #category : #'*Porpoise-Core' }
Object >> propertyAt: aSymbol put: valueObject [
	"Sets a property value of the receiver whose name matches aSymbol."

	^self propertyManager propertyOf: self at: aSymbol put: valueObject.
]

{ #category : #'*Porpoise-Core' }
Object >> propertyManager [
	"Private - Answers the default PropertyManager to use."

	^PropertyManager default
]

{ #category : #'*Porpoise-Core' }
Object >> removeAllProperties [
	"Remove all the properties of the receiver."
	
	self propertyManager removeAllPropertiesOf: self
]

{ #category : #'*Porpoise-Core' }
Object >> removePropertyAt: aSymbol [
	"Removes a property of the receiver whose name matches aSymbol."

	^self propertyManager removePropertyOf: self at: aSymbol
]

{ #category : #'*Porpoise-Core' }
Object >> removePropertyAt: aSymbol ifAbsent: aBlock [
	"Removes a property of the receiver whose name matches aSymbol. If the object
	does not have such a property then aBlock is evaluated."

	^self propertyManager removePropertyOf: self at: aSymbol ifAbsent: aBlock.
]

{ #category : #'*Porpoise-Core' }
Object >> setEvents: anObject [
]
