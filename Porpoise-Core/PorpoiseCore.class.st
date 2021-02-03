Class {
	#name : #PorpoiseCore,
	#superclass : #Object,
	#category : #'Porpoise-Core'
}

{ #category : #'class initialization' }
PorpoiseCore class >> initialize [ 

	"Create class pseudonyms
	
	self initialize 
	
	"

	self environment 
		at: #AnsiString put: ByteString;
		at: #ArithmeticValue put: Number
]
