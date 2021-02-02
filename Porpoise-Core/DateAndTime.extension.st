Extension { #name : #DateAndTime }

{ #category : #'*Porpoise-Core' }
DateAndTime class >> fromDate: aDate time: aTime [

	^self date: aDate time: aTime
]

{ #category : #'*Porpoise-Core' }
DateAndTime >> nanosecond [

	^ nanos

]
