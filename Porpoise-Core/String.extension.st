Extension { #name : #String }

{ #category : #'*Porpoise-Core' }
String >> asAnsiString [

	^self asByteString 
]

{ #category : #'*Porpoise-Core' }
String >> asUtf16String [ 

	^Utf16String fromString: self
]

{ #category : #'*Porpoise-Core' }
String >> trimBlanks [

	^self trim
]

{ #category : #'*Porpoise-Core' }
String >> trimNulls [

	^self readStream upTo: Character null
]
