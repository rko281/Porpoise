Extension { #name : 'SessionManager' }

{ #category : '*Porpoise-Core' }
SessionManager class >> current [

	^self default
]

{ #category : '*Porpoise-Core' }
SessionManager >> trace: aString [
	
	^DolphinSessionManager current trace: aString
]

{ #category : '*Porpoise-Core' }
SessionManager >> traceLine: aString [
	
	^DolphinSessionManager current traceLine: aString
]

{ #category : '*Porpoise-Core' }
SessionManager >> traceStream [
	
	^DolphinSessionManager current traceStream
]

{ #category : '*Porpoise-Core' }
SessionManager >> when: aSymbol send: aSelector to: anObject [

	"Check for Dolphin SessionManager events"
	^(DolphinSessionManager dolphinSessionEvents includes: aSymbol) 
		ifTrue: [ DolphinSessionManager current when: aSymbol send: aSelector to: anObject ]
		ifFalse: [ super when: aSymbol send: aSelector to: anObject ]
]
