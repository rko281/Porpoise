Extension { #name : #Morph }

{ #category : #'*Porpoise-Core' }
Morph >> topShell [

	^self window ifNotNil: [ :win | win model ifNotNil: [ :md | [md topShell] on: MessageNotUnderstood do: [ :mnu | mnu return: md ] ]]
]
