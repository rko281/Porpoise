Class {
	#name : #VMConstants,
	#superclass : #SharedPool,
	#classVars : [
		'DoubleSize',
		'FloatSize',
		'HalfPtrBits',
		'HalfPtrMask',
		'HalfPtrMax',
		'HashBits',
		'IntMax',
		'IntPtrBits',
		'IntPtrMask',
		'IntPtrMax',
		'IntPtrSize',
		'IntSize',
		'IsWin64',
		'MaxBlockNesting',
		'MaxLiterals',
		'MaxMessageArgs',
		'MaxPrimitive',
		'MaxTemps',
		'MaxVirtualFunction',
		'SmallIntegerMax',
		'SmallIntegerMin',
		'UIntMax',
		'UIntPtrMax'
	],
	#category : #'Porpoise-Core'
}

{ #category : #'class initialization' }
VMConstants class >> initialize [
	self
		initialize_UIntPtrMax;
		initialize_IntPtrMax;
		initialize_IsWin64;
		initialize_HashBits;
		initialize_SmallIntegerMin;
		initialize_MaxTemps;
		initialize_MaxBlockNesting;
		initialize_IntPtrSize;
		initialize_MaxVirtualFunction;
		initialize_HalfPtrMask;
		initialize_IntSize;
		initialize_HalfPtrBits;
		initialize_SmallIntegerMax;
		initialize_MaxMessageArgs;
		initialize_FloatSize;
		initialize_MaxPrimitive;
		initialize_IntPtrMask;
		initialize_IntMax;
		initialize_UIntMax;
		initialize_HalfPtrMax;
		initialize_DoubleSize;
		initialize_MaxLiterals;
		initialize_IntPtrBits;
		yourself
]

{ #category : #'class initialization' }
VMConstants class >> initialize_DoubleSize [
	DoubleSize := 8
]

{ #category : #'class initialization' }
VMConstants class >> initialize_FloatSize [
	FloatSize := 4
]

{ #category : #'class initialization' }
VMConstants class >> initialize_HalfPtrBits [
	HalfPtrBits := 16
]

{ #category : #'class initialization' }
VMConstants class >> initialize_HalfPtrMask [
	HalfPtrMask := 65535
]

{ #category : #'class initialization' }
VMConstants class >> initialize_HalfPtrMax [
	HalfPtrMax := 32767
]

{ #category : #'class initialization' }
VMConstants class >> initialize_HashBits [
	HashBits := 30
]

{ #category : #'class initialization' }
VMConstants class >> initialize_IntMax [
	IntMax := 2147483647
]

{ #category : #'class initialization' }
VMConstants class >> initialize_IntPtrBits [
	IntPtrBits := 32
]

{ #category : #'class initialization' }
VMConstants class >> initialize_IntPtrMask [
	IntPtrMask := 4294967295
]

{ #category : #'class initialization' }
VMConstants class >> initialize_IntPtrMax [
	IntPtrMax := 2147483647
]

{ #category : #'class initialization' }
VMConstants class >> initialize_IntPtrSize [
	IntPtrSize := 4
]

{ #category : #'class initialization' }
VMConstants class >> initialize_IntSize [
	IntSize := 4
]

{ #category : #'class initialization' }
VMConstants class >> initialize_IsWin64 [
	IsWin64 := false
]

{ #category : #'class initialization' }
VMConstants class >> initialize_MaxBlockNesting [
	MaxBlockNesting := 255
]

{ #category : #'class initialization' }
VMConstants class >> initialize_MaxLiterals [
	MaxLiterals := 65536
]

{ #category : #'class initialization' }
VMConstants class >> initialize_MaxMessageArgs [
	MaxMessageArgs := 255
]

{ #category : #'class initialization' }
VMConstants class >> initialize_MaxPrimitive [
	MaxPrimitive := 255
]

{ #category : #'class initialization' }
VMConstants class >> initialize_MaxTemps [
	MaxTemps := 255
]

{ #category : #'class initialization' }
VMConstants class >> initialize_MaxVirtualFunction [
	MaxVirtualFunction := 1024
]

{ #category : #'class initialization' }
VMConstants class >> initialize_SmallIntegerMax [
	SmallIntegerMax := 1073741823
]

{ #category : #'class initialization' }
VMConstants class >> initialize_SmallIntegerMin [
	SmallIntegerMin := -1073741824
]

{ #category : #'class initialization' }
VMConstants class >> initialize_UIntMax [
	UIntMax := 4294967295
]

{ #category : #'class initialization' }
VMConstants class >> initialize_UIntPtrMax [
	UIntPtrMax := 4294967295
]
