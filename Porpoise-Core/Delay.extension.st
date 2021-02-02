Extension { #name : #Delay }

{ #category : #'*Porpoise-Core' }
Delay class >> forMicroseconds: anInteger [

	^self forMilliseconds: ((anInteger // 1000) max: 1)

]
