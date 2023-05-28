Class {
	#name : #PropertyManager,
	#superclass : #Object,
	#instVars : [
		'register',
		'semaphore'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Porpoise-Core'
}

{ #category : #accessing }
PropertyManager class >> default [

	^default
]

{ #category : #'class initialization' }
PropertyManager class >> initialize [

	default := self new
]

{ #category : #initialization }
PropertyManager >> initialize [
	"Private - Initialize the receiver"

	register := WeakIdentityKeyDictionary new.
	WeakArray addWeakDependent: register.
	semaphore := Semaphore forMutualExclusion.

]

{ #category : #private }
PropertyManager >> propertiesForStoreOf: anObject [
	^ semaphore
		critical: [ register at: anObject ifAbsentPut: [ IdentityDictionary new ] ]
]

{ #category : #accessing }
PropertyManager >> propertyOf: anObject at: aSymbol [ 
	"Answers a property value matching aSymbol for anObject"

	^self 
		propertyOf: anObject
		at: aSymbol
		ifAbsent: [register errorNotFound: aSymbol]
]

{ #category : #accessing }
PropertyManager >> propertyOf: anObject at: aSymbol ifAbsent: aBlock [
	"Answers a property value matching aSymbol for anObject. If no such property
	exists then aBlock will be evaluated"

	^ (semaphore critical: [ register lookup: anObject ])
		ifNil: [ aBlock value ]
		ifNotNil: [ :properties | properties at: aSymbol ifAbsent: aBlock ]
]

{ #category : #adding }
PropertyManager >> propertyOf: anObject at: aSymbol ifAbsentPut: valueOperation [
	"Answers a property value matching aSymbol for anObject. If no such property
	exists then the result of evaluating aBlock will is stored as the value of the
	property, and then answered."

	^ (self propertiesForStoreOf: anObject)
		at: aSymbol
		ifAbsentPut: valueOperation
]

{ #category : #adding }
PropertyManager >> propertyOf: anObject at: aSymbol put: valueObject [
	"Associates a property valueObject with the property name aSymbol for anObject.
	Answer the valueObject put."

	^ (self propertiesForStoreOf: anObject) at: aSymbol put: valueObject
]

{ #category : #accessing }
PropertyManager >> register [
	^register
]

{ #category : #removing }
PropertyManager >> removeAllPropertiesOf: anObject [
	"Removes all properties for anObject"

	semaphore critical: [ register removeKey: anObject ifAbsent: [  ] ]
]

{ #category : #removing }
PropertyManager >> removePropertyOf: anObject at: aSymbol [
	"Removes a property value matching aSymbol for anObject"

	self removePropertyOf: anObject at: aSymbol ifAbsent: [register errorNotFound: aSymbol]
]

{ #category : #removing }
PropertyManager >> removePropertyOf: anObject at: aSymbol ifAbsent: aBlock [
	"Removes a property value matching aSymbol for anObject. If no such property
	exists then aBlock will be evaluated"

	| propertyDict |
	propertyDict := (semaphore critical: [ register lookup: anObject ])
		ifNil: [ ^ aBlock value ].
	propertyDict removeKey: aSymbol ifAbsent: [ ^ aBlock value ].
	propertyDict isEmpty
		ifTrue: [ semaphore critical: [ register removeKey: anObject ] ]
]
