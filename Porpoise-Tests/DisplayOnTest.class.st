Class {
	#name : #DisplayOnTest,
	#superclass : #TestCase,
	#instVars : [
		'stream'
	],
	#category : #'Porpoise-Tests'
}

{ #category : #printing }
DisplayOnTest >> displayOn: aStream [

	aStream nextPutAll: 'i am a displayontest'
]

{ #category : #running }
DisplayOnTest >> setUp [

	super setUp.
	
	stream := WriteStream on: String new
]

{ #category : #tests }
DisplayOnTest >> testDisplayOnTest [

	"Ensure my implementation of displayOn: is invoked"

	stream display: self.
	
	self assert: stream contents equals: 'i am a displayontest'
]

{ #category : #tests }
DisplayOnTest >> testFileReference [

	"Verify FileReference's implementation of displayStringOn: is used"

	| imagePath |
	
	imagePath := Smalltalk imagePath.
	stream display: imagePath asFileReference.
	
	self assert: stream contents equals: imagePath
]

{ #category : #tests }
DisplayOnTest >> testNumber [

	"Simple test"

	stream display: 123.
	
	self assert: stream contents equals: '123'
]

{ #category : #tests }
DisplayOnTest >> testScaledDecimal [

	"Verify the scale is omitted"

	stream display: 123.45s2.

	self assert: stream contents equals: '123.45'
]

{ #category : #tests }
DisplayOnTest >> testString [

	"Ensure the graphical String>>displayOn: implementation doesn't trip things up"

	stream display: 'hello'.
	
	self assert: stream contents equals: 'hello'
	
]
