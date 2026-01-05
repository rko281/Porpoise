Extension { #name : 'WeakValueDictionary' }

{ #category : '*Porpoise-Core' }
WeakValueDictionary >> approxSize [
	"Use the raw tally--this may be an overestimate if some values have been
	garbage collected, but it is more important to be fast."

	^ tally
]
