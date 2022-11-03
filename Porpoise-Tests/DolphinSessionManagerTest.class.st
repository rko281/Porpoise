Class {
	#name : #DolphinSessionManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'originalSessionManager',
		'originalTraceStream'
	],
	#category : #'Porpoise-Tests'
}

{ #category : #initialization }
DolphinSessionManagerTest >> setUp [

	super setUp.
	originalSessionManager := DolphinSessionManager current.
	originalTraceStream := Smalltalk at: #Trace ifAbsent: [nil].
	DolphinSessionManager reset
]

{ #category : #initialization }
DolphinSessionManagerTest >> tearDown [

	super tearDown.
	DolphinSessionManager current: originalSessionManager.
	originalTraceStream ifNotNil: [Smalltalk at: #Temp put: originalTraceStream]
]

{ #category : #tests }
DolphinSessionManagerTest >> testExceptionToTrace [

	| stream |
	
	stream := WriteStream on: String new.
	Smalltalk at: #Trace put: stream.
	
	[5/0] on: Error do: [ :exc | exc toTrace: 1 ].

	self assert: stream contents equals: 'ZeroDivide
'
]

{ #category : #tests }
DolphinSessionManagerTest >> testSessionManagerShutDown [

	| sessionStopped |

	sessionStopped := false.

	"Configure an event for session shutdown, as per Dolphin"
	SessionManager current when: #sessionStopped send: #value to: [ sessionStopped := true].

	"Simulate Pharo image shut down event, but only for DolphinSessionManager"

	"First, not actually quitting"
	DolphinSessionManager shutDown: false.
	self deny: sessionStopped.
	
	"Now quitting"
	DolphinSessionManager shutDown: true.
	self assert: sessionStopped
]

{ #category : #tests }
DolphinSessionManagerTest >> testSessionManagerStartUp [

	| sessionStarted |

	sessionStarted := false.

	"Configure an event for session startup, as per Dolphin"
	SessionManager current when: #sessionStarted send: #value to: [ sessionStarted := true].

	"Simulate Pharo image start, but only for DolphinSessionManager"

	"First, not actually starting"
	DolphinSessionManager startUp: false.
	self deny: sessionStarted.
	
	"Now starting"
	DolphinSessionManager startUp: true.
	self assert: sessionStarted
]

{ #category : #tests }
DolphinSessionManagerTest >> testTrace [

	| stream |
	
	stream := WriteStream on: String new.
	Smalltalk at: #Trace put: stream.
	
	SessionManager current trace: 'hello'.
	self assert: stream contents equals: 'hello'
]

{ #category : #tests }
DolphinSessionManagerTest >> testTraceLine [

	| stream |
	
	stream := WriteStream on: String new.
	Smalltalk at: #Trace put: stream.
	
	SessionManager current traceLine: 'hello'.
	self assert: stream contents equals: 'hello
'
]
