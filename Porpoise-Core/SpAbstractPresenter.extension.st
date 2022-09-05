Extension { #name : #SpAbstractPresenter }

{ #category : #'*Porpoise-Core' }
SpAbstractPresenter >> topShell [ 

	^self window ifNotNil: [ :win | win topShell ]
]
