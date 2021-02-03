# Porpoise
Dolphin Smalltalk portability for Pharo

## What is Porpoise?
Porpoise is a compatibility layer to ease the porting of Dolphin Smalltalk frameworks to Pharo. It consists of classes and methods equivalent to those found in Dolphin Smalltalk - these may be straight copies, adaptations or redirections to equivalent Pharo code. Functionality is unlikely to be complete but just enough to enable the dependent framework code to be ported with no/minimal changes.

For porting code from Pharo to Dolphin Smalltalk there is an equivalent project - [Portishead](https://github.com/rko281/Portishead)

## How does Porpoise differ from Grease?
Grease is a portability package which largely implements a new, common API across Smalltalk dialects. Porpoise by contrast aims to implement classes and methods with the same names and API as those in Dolphin Smalltalk.

## To Install
```smalltalk
Metacello new
	repository: 'github://rko281/Porpoise';
	baseline: 'Porpoise';
	load: 'default'
```
