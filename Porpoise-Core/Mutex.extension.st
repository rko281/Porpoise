Extension { #name : #Mutex }

{ #category : #'*Porpoise-Core' }
Mutex >> critical: criticalBlock ifLocked: lockedBlock [

	"Copied from Calypso-NavigationModel extension method tryEnterCritical: criticalBlock ifLocked: lockedBlock"

	| activeProcess |
	activeProcess := Processor activeProcess.
	activeProcess == owner ifTrue:[^criticalBlock value].
	^semaphore critical:[
		owner := activeProcess.
		criticalBlock ensure:[owner := nil]] ifLocked: lockedBlock
]

{ #category : #'*Porpoise-Core' }
Mutex >> owner [

	^owner
]
