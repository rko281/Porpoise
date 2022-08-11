Extension { #name : #Mutex }

{ #category : #'*Porpoise-Core' }
Mutex >> critical: criticalBlock ifLocked: lockedBlock [

	^self tryEnterCritical: criticalBlock ifLocked: lockedBlock
]

{ #category : #'*Porpoise-Core' }
Mutex >> owner [

	^owner
]
