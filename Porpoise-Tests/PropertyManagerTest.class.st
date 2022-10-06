Class {
	#name : #PropertyManagerTest,
	#superclass : #TestCase,
	#category : #'Porpoise-Tests'
}

{ #category : #tests }
PropertyManagerTest >> testPropertyLookup [
	
	| object |
	
	object := PropertyManagerTestObject new.
	self should: [ object propertyAt: #test ] raise: NotFound.
	self assert: (object propertyAt: #test ifAbsent: [0]) equals: 0.

	object propertyAt: #test put: 123.
	self assert: (object propertyAt: #test) equals: 123
]

{ #category : #tests }
PropertyManagerTest >> testPropertyManagerKeyWeakness [

	"Ensure existence of properties doesn't prevent an unreferenced object from being GCd"
	
	| count object |

	Smalltalk garbageCollect. 
	count := PropertyManagerTestObject allInstances size.
	object := PropertyManagerTestObject new.
	self assert: PropertyManagerTestObject allInstances size equals: count + 1.

	object propertyAt: #test put: 123.
	self assert: PropertyManagerTestObject allInstances size equals: count + 1.

	object := nil.
	Smalltalk garbageCollect.
	
	self assert: PropertyManagerTestObject allInstances size equals: count
]

{ #category : #tests }
PropertyManagerTest >> testPropertyManagerValueWeakness [

	"Ensure properties are GCd when their owner disappears"
	
	| count object property |

	Smalltalk garbageCollect. 
	count := PropertyManagerTestObject allInstances size.
	object := Object new.
	property := PropertyManagerTestObject new.
	object propertyAt: #test put: property.
	self assert: PropertyManagerTestObject allInstances size equals: count + 1.
	
	object := nil.
	Smalltalk garbageCollect.
	self assert: PropertyManagerTestObject allInstances size equals: count + 1.

	property := nil.
	Smalltalk garbageCollect.
	self assert: PropertyManagerTestObject allInstances size equals: count
]

{ #category : #tests }
PropertyManagerTest >> testPropertyRemoval [

	| object |
	
	object := PropertyManagerTestObject new.
	self shouldnt: [object removePropertyAt: #test1 ifAbsent: []] raise: NotFound.

	object 
		propertyAt: #test1 put: 123;
		propertyAt: #test2 put: 456.
	
	self assert: (object propertyAt: #test1) equals: 123.
	self assert: (object propertyAt: #test2) equals: 456.
	
	object removePropertyAt: #test1.
	self assert: (object propertyAt: #test1 ifAbsent: [0]) equals: 0.
	self assert: (object propertyAt: #test2) equals: 456.

	object removeAllProperties.
	self assert: (object propertyAt: #test2 ifAbsent: [0]) equals: 0
]
