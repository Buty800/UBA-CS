'From Cuis7.5 [latest update: #7426] on 20 August 2025 at 9:10:15 am'!
'Description Add search browser as pre-req'!
!provides: 'MethodFinder' 1 1!
!requires: 'SearchBrowser' 1 45 nil!
SystemOrganization addCategory: #MethodFinder!


!classDefinition: #MethodFinder category: #MethodFinder!
MethodSet subclass: #MethodFinder
	instanceVariableNames: 'receiver arguments expected argumentsSources receiverSource'
	classVariableNames: 'SkipSet'
	poolDictionaries: ''
	category: 'MethodFinder'!
!classDefinition: 'MethodFinder class' category: #MethodFinder!
MethodFinder class
	instanceVariableNames: ''!

!classDefinition: #LabelledInput category: #MethodFinder!
LinearLayoutMorph subclass: #LabelledInput
	instanceVariableNames: 'label textModelMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MethodFinder'!
!classDefinition: 'LabelledInput class' category: #MethodFinder!
LabelledInput class
	instanceVariableNames: 'label model'!

!classDefinition: #MethodFinderWindow category: #MethodFinder!
SearchBrowserWindow subclass: #MethodFinderWindow
	instanceVariableNames: 'argumentsInput expectedInput findButton receiverInput statusLabel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MethodFinder'!
!classDefinition: 'MethodFinderWindow class' category: #MethodFinder!
MethodFinderWindow class
	instanceVariableNames: ''!

!classDefinition: #MethodEvaluationReference category: #MethodFinder!
MethodReference subclass: #MethodEvaluationReference
	instanceVariableNames: 'argumentsSources receiverSource'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MethodFinder'!
!classDefinition: 'MethodEvaluationReference class' category: #MethodFinder!
MethodEvaluationReference class
	instanceVariableNames: ''!


!MethodFinder methodsFor: 'initialization' stamp: 'FC 7/30/2025 03:18:44'!
initialize

	super initialize.
	
	self clearResults. "Why doesn't MethodSet initialize this?"! !

!MethodFinder methodsFor: 'method finder' stamp: 'JB 7/29/2025 13:22:16'!
debugSelectedMethod
	
	selectedMessage debug.! !

!MethodFinder methodsFor: 'method finder' stamp: 'FC 7/30/2025 21:08:41'!
findMethodsOf: receiverObject withArguments: argumentsArray expecting: expectedObject withReceiverSource: aReceiverSource andArgumentSources: anArgumentSourcesCollection 
	
	" Contrario a la heurisitica vista, estos colaboradores comienzan en nil. "
	" Esto pues no podemos definir que valores tendran al crear la instancia"
	receiver := receiverObject.
	arguments := argumentsArray.
	expected := expectedObject.
	
	receiverSource := aReceiverSource.
	argumentsSources := anArgumentSourcesCollection.
	
	self clearResults.
	
	self findBasicMethods.
	
	receiver isKindOf: Collection :: and: [receiver isEmpty not] :: ifTrue: [
		self findEnumeratingMethodsWithElementSelectorArgs: 0.
		self findEnumeratingMethodsWithElementSelectorArgs: 1.
	].

	self sortByClassName.
	self reformulateList.

	^ messageList size.	! !

!MethodFinder methodsFor: 'private - source code generation' stamp: 'FC 7/30/2025 02:42:07'!
blockSourceCodeFor: anElement withSelector: anElementSelector andArgs: anAmountOfArgs

	| bodyFormats bodyFormat varName |
	
	varName := self variableNameFor: anElement.
	
	bodyFormats := Dictionary newFrom: {0->'{1} {2}'. 1->'{1} {2} {1}'}.
	bodyFormat := bodyFormats at: anAmountOfArgs.

	^ ' [:{1} | ', bodyFormat, ']' format: {varName. anElementSelector}.! !

!MethodFinder methodsFor: 'private - source code generation' stamp: 'FC 7/30/2025 20:27:40'!
variableNameFor: anElement

	| className prefixArticle |
	className := anElement class name.
	prefixArticle := className first isVowel ifTrue: ['an'] ifFalse: ['a'].
	

	^prefixArticle, className capitalized! !

!MethodFinder methodsFor: 'private - message list' stamp: 'JB 7/29/2025 10:46:43'!
addResults: results

	messageList addAll: results.! !

!MethodFinder methodsFor: 'private - message list' stamp: 'JB 7/29/2025 12:10:34'!
clearResults

	messageList := OrderedCollection new.
	self reformulateList.! !

!MethodFinder methodsFor: 'private' stamp: 'FC 7/30/2025 01:06:13'!
enumeratingSelectorsFor: receiverObject arguments: argCount
	
	| categories selectors |
	
	categories := #('enumerating' '[mk] enumerating').
	
	selectors := Set new.
	
	categories do: [ :aCategory |
		selectors addAll: (self selectorsFor: receiverObject arguments: argCount inCategory: aCategory).
	].

	^selectors! !

!MethodFinder methodsFor: 'private' stamp: 'FC 7/30/2025 20:39:45'!
findBasicMethods

	| possibleSelectors matchedSelectors methodReferences |

	possibleSelectors := self selectorsFor: receiver arguments: arguments size.
	
	matchedSelectors := self
		matchesIn: possibleSelectors
		receiver: receiver
		arguments: arguments
		expected: expected.
	
	methodReferences := self methodReferencesForSelectors: matchedSelectors 
							 withArgumentsSources: argumentsSources.
							
	self addResults: methodReferences.! !

!MethodFinder methodsFor: 'private' stamp: 'FC 7/30/2025 20:41:51'!
findEnumeratingMethodsWithElementSelectorArgs: elementSelectorArgsAmount

	| enumeratingSelectors elementSelectors blockSourceCode argBlock element |
	
	elementSelectorArgsAmount > 1 ifTrue: [ self error: 'MethodFinder can only find enumerating methods using unary or binary element selectors.' ].
	
	"Buscamos todos los selectores en la categoría de enumeración."
	enumeratingSelectors := self enumeratingSelectorsFor: receiver arguments: 1.
	
	"Buscamos todos los selectores que saben responder los elementos de la colección."
	"Asumimos que todos los elementos son del mismo tipo."
	element := receiver anyOne.
	elementSelectors := self selectorsFor: element arguments: elementSelectorArgsAmount.
	
	elementSelectors do: [ :anElementSelector |
		| matchedSelectors methodReferences |
		
		blockSourceCode := self blockSourceCodeFor: element withSelector: anElementSelector andArgs: elementSelectorArgsAmount.
		argBlock := Compiler evaluate: blockSourceCode.
		
		matchedSelectors := self
			matchesIn: enumeratingSelectors
			receiver: receiver
			arguments: {argBlock}
			expected: expected.

		methodReferences := self methodReferencesForSelectors: matchedSelectors  withArgumentsSources: {blockSourceCode}.
		methodReferences do: [:aMethodReference | aMethodReference addToRepresentation: blockSourceCode].
		
		self addResults: methodReferences.
	].
! !

!MethodFinder methodsFor: 'private' stamp: 'FC 7/30/2025 03:51:16'!
matchesIn: selectors receiver: receiverObject arguments: argumentArray expected: expectedObject
	"Find all methods on the receiver object that take the arguments and return expected object."
	| actualObject matches receiverCopy argumentsCopy |

	matches := selectors select: [ :selector |
		"Some methods modify the receiver, so we operate on a copy."
		receiverCopy := receiverObject veryDeepCopy.
		
		"Some methods modify the arguments, so we operate on a copy."
		argumentsCopy := argumentArray veryDeepCopy.
		
		actualObject :=
			[receiverCopy perform: selector withArguments: argumentArray]
				on: Exception
				do: [ :ex | nil ].
		
		actualObject isKindOf: Float :: and: [ expectedObject isKindOf: Float] ::
			ifTrue: [ actualObject  - expectedObject :: abs <= 0.001 ]
			ifFalse: [ actualObject = expectedObject ].
	].

	^ matches! !

!MethodFinder methodsFor: 'private' stamp: 'FC 7/30/2025 22:20:17'!
methodReferencesForSelectors: aSelectorsCollection withArgumentsSources: argumentsSourceCode
	
	^aSelectorsCollection collect: [ :selector |
		MethodEvaluationReference
			ofMethod: (receiver class lookupSelector: selector)
			withReceiverSource: receiverSource
			andArgumentsSource: argumentsSourceCode.
	].! !

!MethodFinder methodsFor: 'private' stamp: 'FC 7/30/2025 02:48:30'!
selectorsFor: receiverObject arguments: argCount
	"Answer all selectors on the receiver object that take a given number of arguments."
	
	| selectors |

	selectors := receiverObject class allSelectors.

	"Return only the selectors that take the number of arguments provided,
	and skip those that have bad side effects."
	^​ selectors reject: [ :selector |
		selector numArgs ~= argCount ::
			or: [ SkipSet includes: selector ] ::
			or: [ Behavior canUnderstand: selector] ::
			or: [ ChangeSet canUnderstand: selector] ::
			or: [ ClassDescription canUnderstand: selector] ::
			or: [ selector asLowercase includesSubString: 'halt' ] ::
			or: [ selector beginsWith: 'fileOut' ] ::
			or: [ selector beginsWith: 'handleFailing' ].
	].! !

!MethodFinder methodsFor: 'private' stamp: 'JB 7/29/2025 10:35:36'!
selectorsFor: receiverObject arguments: argCount inCategory: aCategory
	"Answer all selectors on the receiver object that take a given number of arguments
	and belong to the specified category."
	| selectors |

	"Find all the selectors in the receiver class and its subclasses."	
	selectors := self selectorsFor: receiverObject arguments: argCount.
	
	"Return only the selectors in the specified category."
	^selectors select: [:aSelector | 
		| method |
		method := receiverObject class lookupSelector: aSelector.
		method category = aCategory ].! !

!MethodFinder class methodsFor: 'class initialization' stamp: 'RMV 1/21/2025 07:16:30'!
initialize
	"Populate the SkipSet class variable."
	
	"Skip these selectors because they have
	side effects that are bad for this method.
	In addition to these, the ? method also skips all methods
	defined in the Behavior, ChangeSet, and ClassDescription classes."
	SkipSet := IdentitySet newFrom: #(
		#addSharedPool:
		#allBroadcastAccessesTo:
		#at:
		#basicInspect
		#become
		#benchmark
		#browseClassHierarchy
		#caseError
		#changed:
		#chooseAlignment
		#chooseColor
		#chooseInstanceVariable
		#chooseRecentClipping
		#confirm:
		#confirm:orCancel:
		#copyToClipboard
		#deprecatedMethod
		#edit
		#editLabel:
		#errorImproperStore
		#executeMethod:
		#explore
		#inboundPointers
		#inform:
		#inspect
		#inspectWithLabel:
		#logAs:
		#longPrintString
		#longPrintText
		#mourn
		#mustBeBoolean
		#newFrom:
		#nextInstance
		#nextObject
  		#notify:
		#notYetImplemented
		#outboundPointers
		#pin
		#print
		#primitiveError:
		#profilerFriendlyCall:
		#removeFromSystem
		#removeFromSystem:
		#removeFromSystemUnlogged
		#removeUnmodifiedCategories
		#removeUnmodifiedClasses
		#removeUnmodifiedMethods
		#removeUnmodifiedMethods:
		#removeUnreferencedKeys
		#removeUnusedTempRange:with:
		#removeUnusedTempsOf:
		#removeUnusedTempsRanges:
		#removeUpToDate
		#setName:
		#shouldFileOutPool:
		#shouldFileOutPools
		#shouldNotHappen
		#shouldNotImplement
		#shutdown
		#someObject
		#subclassResponsibility
		#tinyBenchmarks
		#tryPrimitive:withArgs:
		#unload
		#unpin
		#withCaption:chooseFrom:
		#yourself
		#zapSourcePointer
		#->
	).! !

!LabelledInput methodsFor: 'accessing' stamp: 'RMV 1/14/2025 19:27:40'!
input

	^ textModelMorph! !

!LabelledInput methodsFor: 'accessing' stamp: 'RMV 1/14/2025 19:28:26'!
keystrokeAction: aBlock

	^ textModelMorph keystrokeAction: aBlock! !

!LabelledInput methodsFor: 'accessing' stamp: 'RMV 1/13/2025 08:39:07'!
model

	^ textModelMorph model! !

!LabelledInput methodsFor: 'accessing' stamp: 'RMV 1/10/2025 18:40:24'!
text

	^ textModelMorph model actualContents! !

!LabelledInput methodsFor: 'accessing' stamp: 'RMV 1/12/2025 08:05:30'!
text: aString

	textModelMorph model actualContents: aString! !

!LabelledInput methodsFor: 'private' stamp: 'RMV 1/10/2025 18:30:21'!
label: aString

	label := aString! !

!LabelledInput methodsFor: 'initialization' stamp: 'RMV 1/12/2025 10:18:01'!
buildMorph: labelString
	
	label := LabelMorph contents: labelString.
	
	textModelMorph := TextModelMorph withModel: (TextModel withText: '').
	textModelMorph askBeforeDiscardingEdits: false.
	
	"self borderColor: Color red; borderWidth: 1."
	self separation: 10.
	self padding: 0. "must set AFTER separation"
	self addMorph: label.
	self addMorph: textModelMorph proportionalWidth: 1.! !

!LabelledInput class methodsFor: 'instance creation' stamp: 'RMV 1/10/2025 18:41:00'!
label: aString

	| instance |
	instance := self newRow.
	instance buildMorph: aString.
	^ instance.
! !

!MethodFinderWindow methodsFor: 'GUI building' stamp: 'JB 7/23/2025 12:08:27'!
buildMorphicWindow
	"This was copied from the SearchBrowserWindow class and searchBar was modified."

	| findButtonRow searchBar listPane |
	
	searchBar := LayoutMorph newColumn.
	searchBar separation: 5.
	
	findButton := PluggableButtonMorph
		model: self
		action: #findMethods
		label: 'Find Methods'.
	findButton disable.
	findButtonRow := LayoutMorph newRow.
	findButtonRow addMorph: findButton.
	findButtonRow addMorph: statusLabel.
	
	searchBar addMorph: receiverInput.
	searchBar addMorph: argumentsInput.
	searchBar addMorph: expectedInput.
	searchBar addMorph: findButtonRow.

	listPane := self buildMorphicMessageList.

	self layoutMorph
		addMorph: searchBar fixedHeight: 0; "using minimum height that contains children"
		addAdjusterAndMorph: listPane proportionalHeight: 0.40;
		addAdjusterAndMorph: self buildLowerPanes layoutSpec: LayoutSpec useAll.! !

!MethodFinderWindow methodsFor: 'GUI building' stamp: 'JB 7/29/2025 11:04:36'!
optionalButtonTuples

	| buttonTuples |
	buttonTuples := super optionalButtonTuples.
	
	^ #((10 'debug' debugMethod 'debug selected method')), buttonTuples.
! !

!MethodFinderWindow methodsFor: 'GUI building' stamp: 'JB 7/23/2025 12:08:08'!
windowColor

	^ Color yellow twiceDarker! !

!MethodFinderWindow methodsFor: 'private - GUI handling' stamp: 'JB 7/29/2025 11:03:16'!
clearResults

	model clearResults.! !

!MethodFinderWindow methodsFor: 'private - GUI handling' stamp: 'JB 7/29/2025 11:03:45'!
clearStatusLabel

	statusLabel contents isEmpty ifFalse: [ statusLabel contents: '' ].! !

!MethodFinderWindow methodsFor: 'private - GUI handling' stamp: 'JB 7/29/2025 11:03:38'!
handleKeyboardEvent: anEvent
	
	self updateFindButton.
	self clearStatusLabel.! !

!MethodFinderWindow methodsFor: 'private - GUI handling' stamp: 'JB 7/29/2025 11:03:59'!
updateFindButton

	| hasReceiver hasExpected |
	
	hasReceiver := receiverInput text isEmpty not.
	hasExpected := expectedInput text isEmpty not.

	(hasReceiver and: hasExpected)
		ifTrue: [ findButton enable ]
		ifFalse: [ findButton disable ].! !

!MethodFinderWindow methodsFor: 'private - method finder' stamp: 'FC 7/30/2025 21:54:44'!
arguments

	| arguments argumentSource |

	argumentSource := argumentsInput text veryDeepCopy replaceAll: $; with: $..
	argumentSource := '{', argumentSource, '}' .
	
	arguments := [ self evaluate: argumentSource]
					on: Error
					do: [ :ex |
						statusLabel contents: ex messageText.
						^ nil.
						].


	arguments ifNil: [ statusLabel contents: 'Arguments expression is invalid.' ].

	^ arguments.! !

!MethodFinderWindow methodsFor: 'private - method finder' stamp: 'FC 7/30/2025 22:17:59'!
argumentsSourceCode

	| argumentsSource |
	
	argumentsSource := argumentsInput text copy asString subStrings: ';'.
	
	^argumentsSource! !

!MethodFinderWindow methodsFor: 'private - method finder' stamp: 'JB 7/29/2025 11:19:53'!
debugMethod

	model debugSelectedMethod.! !

!MethodFinderWindow methodsFor: 'private - method finder' stamp: 'RMV 1/18/2025 13:53:20'!
evaluate: aString
		
	^ [ Compiler evaluate: aString ]
		on: Notification do: [ :ex |
			"Prevent Notification from being written to Transcript."
			ex resume: false.
			nil.
		]
		on: Error do: [ :ex | nil ].
! !

!MethodFinderWindow methodsFor: 'private - method finder' stamp: 'JB 7/29/2025 09:50:14'!
expected

	| expected |
	
	[ expected := self evaluate: expectedInput text ] on: Error do: [ :ex |
		statusLabel contents: ex messageText.
		^ nil.
	].

	expected ifNil: [
		statusLabel contents: 'Expected expression is invalid.'.
		^ nil.
	].

	^ expected.! !

!MethodFinderWindow methodsFor: 'private - method finder' stamp: 'FC 7/30/2025 21:10:07'!
findMethods

	| receiver arguments expected count |
	
	receiver := self receiver.
	receiver ifNil: [ ^ nil ].
	
	arguments := self arguments.
	arguments ifNil: [ ^ nil ].
	
	expected := self expected.
	expected ifNil: [ ^ nil ].

	statusLabel contents: 'Finding methods...'.
	
	"The remaining code is in a block and run in a new process by sending it `#fork`.
	This is necessary to allow the change to statusLabel above to be seen before the code in this block finishes executing."
	[
		count := model
					findMethodsOf: receiver
					withArguments: arguments
					expecting: expected
					withReceiverSource: self receiverSourceCode
					andArgumentSources: self argumentsSourceCode.
	
		statusLabel contents: (
			count caseOf: {
					[0] -> [ 'No matching methods were found.' ].
					[1] -> [ '1 method was found.' ]
				} otherwise: [ '{1} methods were found.' format: { count } ]
		).
	] fork.! !

!MethodFinderWindow methodsFor: 'private - method finder' stamp: 'JB 7/29/2025 09:49:31'!
receiver

	| receiver |
		
	[ receiver := self evaluate: receiverInput text ] on: Error do: [ :ex |
		statusLabel contents: ex messageText.
		^ nil.
	].
	
	receiver ifNil: [
		statusLabel contents: 'Receiver expression is invalid.'.
		^ nil.
	].

	^ receiver.! !

!MethodFinderWindow methodsFor: 'private - method finder' stamp: 'FC 7/30/2025 03:43:36'!
receiverSourceCode

	^receiverInput text asString! !

!MethodFinderWindow methodsFor: 'initialization' stamp: 'JB 7/29/2025 11:04:18'!
initialize

	super initialize.

	receiverInput := LabelledInput label: 'Receiver:'.
	argumentsInput := LabelledInput label: 'Arguments (dot-separated):'.
	expectedInput := LabelledInput label: 'Expected:'.
	statusLabel := LabelMorph contents: ''.
	
	receiverInput keystrokeAction: [ :evt | self handleKeyboardEvent: evt ].
	argumentsInput keystrokeAction: [ :evt | self handleKeyboardEvent: evt ].
	expectedInput keystrokeAction: [ :evt | self handleKeyboardEvent: evt ].

! !

!MethodFinderWindow class methodsFor: 'menu-world' stamp: 'RMV 1/24/2025 06:37:49'!
worldMenuOptions
	^ `{{
			#submenuOf -> TheWorldMenu openLabel.
			#itemGroup -> 10.
			
			"Text Editor is 10.
			Workspace is 20.
			Browser is 30.
			SearchBrowser is 40.
			MessageNames is 40.
			Transcript is 50."
			#itemOrder -> 41.
			
			#label -> 'Method Finder'.
			#object -> MethodFinderWindow.
			#selector -> #open.
			#icon -> #inspectIcon.
			#balloonText -> 'A tool for finding methods that return a given answer.'.
		} asDictionary}`! !

!MethodFinderWindow class methodsFor: 'ui' stamp: 'JB 6/27/2025 21:55:40'!
open

	^ self open: MethodFinder new label: 'Method Finder'! !

!MethodEvaluationReference methodsFor: 'setting' stamp: 'FC 7/30/2025 20:54:46'!
setStandardClass: aClass methodSymbol: methodSym receiver: aReceiverSource arguments: anArgumentSources

	self
		setClass: aClass
		methodSymbol: methodSym
		stringVersion: aClass name , ' ' , methodSym.
	
	receiverSource := aReceiverSource.
	argumentsSources := anArgumentSources.
	! !

!MethodEvaluationReference methodsFor: 'debugging' stamp: 'FC 7/30/2025 21:14:33'!
debug

	"Debugs the method evaluation with the current arguments."
	| method methodNode |
	
	methodNode := Compiler new
						compileNoPattern: self evaluationSourceCode
						in: nil class
						context: nil
						notifying: nil
						ifFail: [self error: 'Fallo al compilar el metodo' ].
	
	" Esto es para sacar el nombre DoIt y el simbolo de return (^) al dev"			
	methodNode block returnLast.
	method := methodNode generate.
	method methodNode: methodNode.
	
	"Para investigar: SmalltalkEditor verifica que el metodo no sea nil ni sea 'quick'.
	 No me queda claro por que puede suceder si lo estamos generando de forma dinamica.
	 Ademas, tenemos la certeza de que el metodo con dichos argumentos compila y es ejecutable."
	
	(method notNil and: [method isQuick not]) ifTrue:
		[
			Debugger
				openDebugging: [method valueWithReceiver: nil arguments: #()]
				to: method
				label: 'Debugging ', self methodSymbol.
		].! !

!MethodEvaluationReference methodsFor: 'debugging' stamp: 'FC 7/30/2025 22:16:22'!
evaluationSourceCode
	
	| selector sourceCode |
	selector := self methodSymbol.
	sourceCode := receiverSource.
	
	selector isUnary 
		ifTrue:  [ sourceCode := sourceCode , ' ', selector ]
		ifFalse: [ sourceCode := sourceCode , self infixArgumentsIntoKeywords].
	^sourceCode! !

!MethodEvaluationReference methodsFor: 'debugging' stamp: 'FC 7/30/2025 22:16:01'!
infixArgumentsIntoKeywords
	| keywords source |
	
	source := ''.
	keywords := self methodSymbol keywords.
	
	keywords with: argumentsSources do:
		[:aKeyword :anArgumentSource |
			source := source, ' ', aKeyword, ' ', anArgumentSource
		].

	^source! !

!MethodEvaluationReference methodsFor: 'comparisons' stamp: 'JB 7/29/2025 13:21:34'!
= anotherMethodReference 
	
	^ super = anotherMethodReference and: [ self arguments == anotherMethodReference arguments ].! !

!MethodEvaluationReference methodsFor: 'comparisons' stamp: 'FC 7/30/2025 04:02:45'!
hash
	
	^ super hash bitXor: argumentsSources hash! !

!MethodEvaluationReference methodsFor: 'string version' stamp: 'FC 7/30/2025 22:18:45'!
addToRepresentation: aSourceCode

	self assertSourceIsFromThisEvaluation: aSourceCode.
	
	stringVersion := stringVersion,aSourceCode.! !

!MethodEvaluationReference methodsFor: 'assertions' stamp: 'FC 7/30/2025 20:44:38'!
assertSourceIsFromThisEvaluation: aSourceCode

	^ argumentsSources includes: aSourceCode :: ifFalse: [self error: 'Argument to add to representation must be of this method evaluation']! !

!MethodEvaluationReference methodsFor: 'queries' stamp: 'FC 7/30/2025 04:14:28'!
arguments
	^ argumentsSources! !

!MethodEvaluationReference class methodsFor: 'instance creation' stamp: 'FC 7/30/2025 20:54:27'!
class: aClass selector: aSelector receiverSource: aReceiverSource argumentsSource: argumentsArray

	^ self new
		setStandardClass: aClass
		methodSymbol: aSelector
		receiver: aReceiverSource
		arguments: argumentsArray! !

!MethodEvaluationReference class methodsFor: 'instance creation' stamp: 'FC 7/30/2025 20:53:31'!
ofMethod: aCompiledMethod withReceiverSource: aReceiverSource andArgumentsSource: argumentsArray

	^ self
		class: aCompiledMethod methodClass
		selector: aCompiledMethod selector
		receiverSource: aReceiverSource
		argumentsSource: argumentsArray! !

!PluggableButtonMorph methodsFor: '*MethodFinder' stamp: 'RMV 1/16/2025 07:57:30'!
enable: aBoolean

	aBoolean ifTrue: [ self enable ] ifFalse: [ self disable ]! !
MethodFinder initialize!
