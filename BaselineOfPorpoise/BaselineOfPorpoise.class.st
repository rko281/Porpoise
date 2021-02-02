Class {
	#name : #BaselineOfPorpoise,
	#superclass : #BaselineOf,
	#category : #BaselineOfPorpoise
}

{ #category : #baselines }
BaselineOfPorpoise >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
				spec
					package: 'Porpoise-Core';
					package: 'Porpoise-FFI' with: [ spec requires: #('Porpoise-Core') ].
			
				spec
					group: 'ffi' with: #('Porpoise-FFI');
					group: 'core' with: #('Porpoise-Core');
					group: 'default' with: #('Porpoise-FFI')
				]
]
