Class {
	#name : 'DolphinSessionManager',
	#superclass : 'Object',
	#classInstVars : [
		'current'
	],
	#category : 'Porpoise-Core',
	#package : 'Porpoise-Core'
}

{ #category : 'accessing' }
DolphinSessionManager class >> current [

	^current ifNil: [ current := self new ]
]

{ #category : 'constants' }
DolphinSessionManager class >> dolphinSessionEvents [

	^#(#sessionStarted #sessionStopped)
]

{ #category : 'class initialization' }
DolphinSessionManager class >> initialize [ 

	Smalltalk 
		addToStartUpList: self;
		addToShutDownList: self
]

{ #category : 'accessing' }
DolphinSessionManager class >> reset [

	current := nil
]

{ #category : 'system startup' }
DolphinSessionManager class >> shutDown: isQuitting [

	isQuitting ifTrue: [self current onShutDown]
]

{ #category : 'system startup' }
DolphinSessionManager class >> startUp: isNewSession [

	isNewSession ifTrue: [ self current onStartUp ]
]

{ #category : 'event handling' }
DolphinSessionManager >> onShutDown [

	self triggerEvent: #sessionStopped
]

{ #category : 'event handling' }
DolphinSessionManager >> onStartUp [

	self triggerEvent: #sessionStarted
]

{ #category : 'logging' }
DolphinSessionManager >> trace: aString [
	"Append aString to the trace device."

	(self traceStream)
		nextPutAll: aString;
		flush
]

{ #category : 'logging' }
DolphinSessionManager >> traceLine: aString [
	"Append aString to the trace stream and start a new line."

	(self traceStream)
		nextPutAll: aString;
		cr;
		flush
]

{ #category : 'logging' }
DolphinSessionManager >> traceStream [
	"Answer a <puttableStream> onto the session's trace output device."

	^Smalltalk at: #Trace ifAbsent: [DeafObject current]
]
