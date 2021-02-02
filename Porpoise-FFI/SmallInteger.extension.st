Extension { #name : #SmallInteger }

{ #category : #'*Porpoise-FFI' }
SmallInteger >> byteSize [

	^ExternalAddress wordSize
]
