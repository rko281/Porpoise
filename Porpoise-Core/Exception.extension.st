Extension { #name : #Exception }

{ #category : #'*Porpoise-Core' }
Exception class >> signal: message with: aTag [
		
	^self signal: message withTag: aTag
]

{ #category : #'*Porpoise-Core' }
Exception >> signal: signalText with: arg [
	"Raise the receiver with the <readableString> error message text,
	signalText and the <Object> tag, arg."

	self messageText: signalText.
	self tag: arg.
	^self signal
]

{ #category : #'*Porpoise-Core' }
Exception class >> signalWith: aTag [
		
	^self signal: nil with: aTag
]

{ #category : #'*Porpoise-Core' }
Exception >> toTrace [
	"Print details of the Exception to the session managers debug output device."
	
	self toTrace: 0
]

{ #category : #'*Porpoise-Core' }
Exception >> toTrace: anInteger [
	"Print details of the Exception to the session managers debug output device,
	along with a stack track of depth as specified by the <integer>, frames."

	| traceStream |
	traceStream := SessionManager current traceStream.
	traceStream
		nextPutAll: self description;
		cr.
"	self raisingFrame printStackOn: traceStream depth: anInteger."
	traceStream flush
]
