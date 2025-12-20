!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:59:48'!
initialize
	top := Bottom new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:53:28'!
isEmpty
	^ top isBottom.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 14:21:49'!
pop
	| elementoASacar |
	elementoASacar := top valueWithError: OOStack stackEmptyErrorDescription.
	top := top next.
	^elementoASacar! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:57:55'!
push: anElement
	top := top push: anElement. ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:58:32'!
size 
	^ top size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SP 9/20/2025 18:46:21'!
stackEmptyErrorDescription
	^ 'No se puede realizar esta operacion en este momento'! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 14:12:14'!
top
	^ top valueWithError: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #PushedObj category: #'Stack-Exercise'!
Object subclass: #PushedObj
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PushedObj methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:54:13'!
isBottom
	^self subclassResponsibility .! !

!PushedObj methodsFor: 'as yet unclassified' stamp: 'SP 9/23/2025 15:07:44'!
push: aValue
	| top |
	top := PushedValue new.
	top value: aValue.
	top next: self.
	^ top! !

!PushedObj methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:14:46'!
size
	^self subclassResponsibility .! !

!PushedObj methodsFor: 'as yet unclassified' stamp: 'SP 9/23/2025 15:07:55'!
valueWithError: anErrorMessage
	^ self subclassResponsibility ! !


!classDefinition: #Bottom category: #'Stack-Exercise'!
PushedObj subclass: #Bottom
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Bottom methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:53:49'!
isBottom
	^ true.! !

!Bottom methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:51:51'!
size 
	^ 0.! !

!Bottom methodsFor: 'as yet unclassified' stamp: 'SP 9/23/2025 15:07:21'!
valueWithError: anErrorMessage 
	^ self error: anErrorMessage.! !


!classDefinition: #PushedValue category: #'Stack-Exercise'!
PushedObj subclass: #PushedValue
	instanceVariableNames: 'value next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PushedValue methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:54:04'!
isBottom
	^ false ! !

!PushedValue methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 14:21:54'!
next
	^ next. ! !

!PushedValue methodsFor: 'as yet unclassified' stamp: 'SP 9/23/2025 15:06:51'!
next: aValue
	next := aValue.! !

!PushedValue methodsFor: 'as yet unclassified' stamp: 'Buty 9/23/2025 13:16:05'!
size
	^ 1 + next size. ! !

!PushedValue methodsFor: 'as yet unclassified' stamp: 'SP 9/23/2025 15:06:15'!
value: aValue
	value := aValue.! !

!PushedValue methodsFor: 'as yet unclassified' stamp: 'SP 9/23/2025 15:06:03'!
valueWithError: anErrorMessage 
	^ value.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'resultCollection initialStack temporaryStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'SP 9/26/2025 11:24:01'!
initializeWithTheStack: aStack
	initialStack := aStack.
	temporaryStack := OOStack new.
	resultCollection := OrderedCollection new.
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'SP 9/26/2025 11:30:41'!
reorganizeInitialStack
	[temporaryStack isEmpty] whileFalse:[
		 | elementoAMover |
		elementoAMover := temporaryStack pop.
		initialStack push: elementoAMover
	].
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'SP 9/26/2025 12:01:05'!
searchTheStackWithPrefix: aPrefix
	[initialStack isEmpty] whileFalse: [ 
		| currentString |
		currentString := initialStack pop.
		resultCollection add: currentString.
		temporaryStack push: currentString.
	].
	resultCollection := resultCollection select: [:eachString | eachString beginsWith: aPrefix].
	self reorganizeInitialStack.
	^ resultCollection
	
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'SP 9/26/2025 11:14:46'!
initialize: aStack
	^ self new initializeWithTheStack: aStack.! !


!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'Buty 9/26/2025 15:07:47'!
test01Example
	| stack prefix sentenceFinder sentencesWithThePrefix expected |
	stack := OOStack new.
	prefix := 'Wint'.
	sentenceFinder := SentenceFinderByPrefix initialize: stack.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	sentencesWithThePrefix := sentenceFinder searchTheStackWithPrefix: prefix.
	expected := OrderedCollection withAll: #('Winter is here').	
	self assert: sentencesWithThePrefix = expected.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'Buty 9/26/2025 15:07:32'!
test02SentenceFinderIsCaseSensitive
	| stack prefix sentenceFinder sentencesWithThePrefix expected |
	stack := OOStack new.
	prefix := 'pe'.
	sentenceFinder := SentenceFinderByPrefix initialize: stack.
	stack push: 'Pedro'.
	stack push: 'pedro'.
	sentencesWithThePrefix := sentenceFinder searchTheStackWithPrefix: prefix.
	expected := OrderedCollection withAll: #('pedro').	
	self assert: sentencesWithThePrefix = expected.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'Buty 9/26/2025 15:09:28'!
test03NoMatches
	| stack prefix sentenceFinder sentencesWithThePrefix expected |
	stack := OOStack new.
	prefix := 'a'.
	sentenceFinder := SentenceFinderByPrefix initialize: stack.
	stack push: 'Arandano'.
	stack push: 'banana'.
	stack push: 'manzana'.
	sentencesWithThePrefix := sentenceFinder searchTheStackWithPrefix: prefix.
	expected := OrderedCollection withAll: #().	
	self assert: sentencesWithThePrefix = expected.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'Buty 9/26/2025 15:13:11'!
test04EmptyStack
	| stack prefix sentenceFinder sentencesWithThePrefix expected |
	stack := OOStack new.
	prefix := ''.
	sentenceFinder := SentenceFinderByPrefix initialize: stack.
	sentencesWithThePrefix := sentenceFinder searchTheStackWithPrefix: prefix.
	expected := OrderedCollection withAll: #().	
	self assert: sentencesWithThePrefix = expected.! !
