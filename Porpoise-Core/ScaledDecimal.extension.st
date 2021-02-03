Extension { #name : #ScaledDecimal }

{ #category : #'*Porpoise-Core' }
ScaledDecimal >> displayStringOn: aStream [
	"Omit the scale (compared to printOn:)"
	
	self printOn: aStream showingDecimalPlaces: scale
]
