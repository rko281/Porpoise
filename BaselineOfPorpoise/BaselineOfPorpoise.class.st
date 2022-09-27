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
					package: 'Porpoise-FFI' with: [ spec requires: #('Porpoise-Core') ];
					package: 'Porpoise-Tests' with: [spec requires: #('Porpoise-FFI') ].
			
				spec
					group: 'ffi' with: #('Porpoise-FFI');
					group: 'core' with: #('Porpoise-Core');
					group: 'default' with: #('Porpoise-FFI');
					group: 'tests' with: #('Porpoise-Tests')
				]
]
