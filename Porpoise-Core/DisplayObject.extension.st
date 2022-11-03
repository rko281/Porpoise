Extension { #name : #DisplayObject }

{ #category : #'*Porpoise-Core' }
DisplayObject >> dolphinDisplayOn: aStream [

	"Override to avoid the graphics-centric implementation of DisplayObject>>displayOn:"

	self displayStringOn: aStream
]
