Extension { #name : #SequenceableCollection }

{ #category : #'*Porpoise-Core' }
SequenceableCollection >> from: anInteger do: operation [ 

	self from: anInteger keysAndValuesDo: [:i :each | operation value: each]
]

{ #category : #'*Porpoise-Core' }
SequenceableCollection >> from: anInteger keysAndValuesDo: aBlock [

	anInteger to: self size do: [ :index | aBlock value: index value: (self at: index) ]
]

{ #category : #'*Porpoise-Core' }
SequenceableCollection >> writeStream [

	^WriteStream on: self
]

{ #category : #'*Porpoise-Core' }
SequenceableCollection class >> writeStream [

	^self new writeStream
]

{ #category : #'*Porpoise-Core' }
SequenceableCollection class >> writeStream: anInteger [

	^WriteStream on: (self new: anInteger)
]
