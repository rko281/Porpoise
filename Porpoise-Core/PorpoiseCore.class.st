Class {
	#name : 'PorpoiseCore',
	#superclass : 'Object',
	#category : 'Porpoise-Core',
	#package : 'Porpoise-Core'
}

{ #category : 'class initialization' }
PorpoiseCore class >> initialize [
	"Create class pseudonyms
	
	self initialize 
	
	"

	self environment
		at: #AnsiString put: ByteString;
		at: #ArithmeticValue put: Number;
		at: #LookupTable put: Dictionary;
		at: #WeakLookupTable put: WeakValueDictionary
]
