Class {
	#name : 'WeakIdentityDictionary',
	#superclass : 'WeakIdentityValueDictionary',
	#category : 'Porpoise-Core',
	#package : 'Porpoise-Core'
}

{ #category : 'instance creation' }
WeakIdentityDictionary class >> newWithWeakKeys: anInteger [

	^WeakIdentityKeyDictionary new: anInteger
]
