Extension { #name : #Notification }

{ #category : #'*Porpoise-Core' }
Notification class >> deprecated [

	Deprecation new
		context: thisContext sender;
		explanation: 'this method is deprecated';
		signal
]
