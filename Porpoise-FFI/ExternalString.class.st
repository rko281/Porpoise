Class {
	#name : #ExternalString,
	#superclass : #ExternalByteArray,
	#category : #'Porpoise-FFI'
}

{ #category : #converting }
ExternalString >> asString [

	^self copyFrom: 1 to: self size
]

{ #category : #copying }
ExternalString >> trimBlanks [

	^self asString trimBlanks
]

{ #category : #copying }
ExternalString >> trimNulls [

	^self asString trimNulls
]
