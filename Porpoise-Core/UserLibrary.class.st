Class {
	#name : 'UserLibrary',
	#superclass : 'Object',
	#category : 'Porpoise-Core',
	#package : 'Porpoise-Core'
}

{ #category : 'accessing' }
UserLibrary class >> default [ 

	^self
]

{ #category : 'accessing' }
UserLibrary class >> getActiveWindow [

	^FFIConstantHandle new
]
