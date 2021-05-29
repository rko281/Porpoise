Extension { #name : #String }

{ #category : #'*Porpoise-Core' }
String >> << anObject [
	"Expand the receiver with replacable arguments represented by anObject.
	anObject may be an individual object mapping to a single parameter (in which case this message is equivalent to #expandMacrosWith:),
	or a collection mapping to a collection of parameters (in which case this message is equivalent to #expandMacrosWithArguments:).

	See #expandMacrosWithArguments: for further details."

	"Dolphin allows <1d> for displayString; replace this with <2p> for printString (naive but should work in most cases)"
	^anObject expandMacrosIn: (self copyReplaceAll: 'd>' with: 'p>')
]

{ #category : #'*Porpoise-Core' }
String >> asAnsiString [

	^self asByteString 
]

{ #category : #'*Porpoise-Core' }
String >> asUtf16String [ 

	^Utf16String fromString: self
]

{ #category : #'*Porpoise-Core' }
String >> expandMacrosIn: aString [

	"Private - Expand aString with the replaceable argument represented by the receiver.

	Overridden here to avoid treating the receiver as a collection of multiple arguments"

	^aString expandMacrosWith: self
]

{ #category : #'*Porpoise-Core' }
String >> trimBlanks [

	^self trim
]

{ #category : #'*Porpoise-Core' }
String >> trimNulls [

	^self readStream upTo: Character null
]
