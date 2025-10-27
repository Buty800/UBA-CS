'From Cuis7.5 [latest update: #7641] on 7 October 2025 at 9:57:12 am'!
'Description Rename Red to RedTDDState, etc.'!
!provides: 'TDDGuru' 1 66!
!requires: '__TDDGuru-TestData__' 1 0 nil!
!requires: 'TDDGuruSecondBootstrapping' 1 0 nil!
SystemOrganization addCategory: #'TDDGuru-Tests'!
SystemOrganization addCategory: #'TDDGuru-Model'!
SystemOrganization addCategory: #'TDDGuru-Tools'!


!classDefinition: #ChangeListMorph category: #'TDDGuru-Tools'!
PluggableListMorph subclass: #ChangeListMorph
	instanceVariableNames: 'analysisResult'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tools'!
!classDefinition: 'ChangeListMorph class' category: #'TDDGuru-Tools'!
ChangeListMorph class
	instanceVariableNames: ''!

!classDefinition: #PickAChangeWindow category: #'TDDGuru-Tools'!
ChangeListWindow subclass: #PickAChangeWindow
	instanceVariableNames: 'changesFileStartPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tools'!
!classDefinition: 'PickAChangeWindow class' category: #'TDDGuru-Tools'!
PickAChangeWindow class
	instanceVariableNames: ''!

!classDefinition: #AnalysisResultWindow category: #'TDDGuru-Tools'!
SystemWindow subclass: #AnalysisResultWindow
	instanceVariableNames: 'changeDetail index changeDetailTitle changeCode tddGuru'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tools'!
!classDefinition: 'AnalysisResultWindow class' category: #'TDDGuru-Tools'!
AnalysisResultWindow class
	instanceVariableNames: ''!

!classDefinition: #InnerChangeListMorph category: #'TDDGuru-Tools'!
InnerListMorph subclass: #InnerChangeListMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tools'!
!classDefinition: 'InnerChangeListMorph class' category: #'TDDGuru-Tools'!
InnerChangeListMorph class
	instanceVariableNames: ''!

!classDefinition: #AnalysisResult category: #'TDDGuru-Model'!
Object subclass: #AnalysisResult
	instanceVariableNames: 'errors changes currentSelection selectedChange timeline'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'AnalysisResult class' category: #'TDDGuru-Model'!
AnalysisResult class
	instanceVariableNames: ''!

!classDefinition: #Change category: #'TDDGuru-Model'!
Object subclass: #Change
	instanceVariableNames: 'changeRecord'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'Change class' category: #'TDDGuru-Model'!
Change class
	instanceVariableNames: ''!

!classDefinition: #ClassChange category: #'TDDGuru-Model'!
Change subclass: #ClassChange
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'ClassChange class' category: #'TDDGuru-Model'!
ClassChange class
	instanceVariableNames: ''!

!classDefinition: #ClassRenamed category: #'TDDGuru-Model'!
ClassChange subclass: #ClassRenamed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'ClassRenamed class' category: #'TDDGuru-Model'!
ClassRenamed class
	instanceVariableNames: ''!

!classDefinition: #ModelClassRemoved category: #'TDDGuru-Model'!
ClassChange subclass: #ModelClassRemoved
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'ModelClassRemoved class' category: #'TDDGuru-Model'!
ModelClassRemoved class
	instanceVariableNames: ''!

!classDefinition: #NewModelClass category: #'TDDGuru-Model'!
ClassChange subclass: #NewModelClass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'NewModelClass class' category: #'TDDGuru-Model'!
NewModelClass class
	instanceVariableNames: ''!

!classDefinition: #NewTestClass category: #'TDDGuru-Model'!
ClassChange subclass: #NewTestClass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'NewTestClass class' category: #'TDDGuru-Model'!
NewTestClass class
	instanceVariableNames: ''!

!classDefinition: #TestClassRemoved category: #'TDDGuru-Model'!
ClassChange subclass: #TestClassRemoved
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TestClassRemoved class' category: #'TDDGuru-Model'!
TestClassRemoved class
	instanceVariableNames: ''!

!classDefinition: #MethodChange category: #'TDDGuru-Model'!
Change subclass: #MethodChange
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'MethodChange class' category: #'TDDGuru-Model'!
MethodChange class
	instanceVariableNames: ''!

!classDefinition: #MethodRemoved category: #'TDDGuru-Model'!
MethodChange subclass: #MethodRemoved
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'MethodRemoved class' category: #'TDDGuru-Model'!
MethodRemoved class
	instanceVariableNames: ''!

!classDefinition: #ModelMethodChanged category: #'TDDGuru-Model'!
MethodChange subclass: #ModelMethodChanged
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'ModelMethodChanged class' category: #'TDDGuru-Model'!
ModelMethodChanged class
	instanceVariableNames: ''!

!classDefinition: #NewModelMethod category: #'TDDGuru-Model'!
MethodChange subclass: #NewModelMethod
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'NewModelMethod class' category: #'TDDGuru-Model'!
NewModelMethod class
	instanceVariableNames: ''!

!classDefinition: #NewTest category: #'TDDGuru-Model'!
MethodChange subclass: #NewTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'NewTest class' category: #'TDDGuru-Model'!
NewTest class
	instanceVariableNames: ''!

!classDefinition: #TestChanged category: #'TDDGuru-Model'!
MethodChange subclass: #TestChanged
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TestChanged class' category: #'TDDGuru-Model'!
TestChanged class
	instanceVariableNames: ''!

!classDefinition: #TestRemoved category: #'TDDGuru-Model'!
MethodChange subclass: #TestRemoved
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TestRemoved class' category: #'TDDGuru-Model'!
TestRemoved class
	instanceVariableNames: ''!

!classDefinition: #TestUtilityChanged category: #'TDDGuru-Model'!
MethodChange subclass: #TestUtilityChanged
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TestUtilityChanged class' category: #'TDDGuru-Model'!
TestUtilityChanged class
	instanceVariableNames: ''!

!classDefinition: #TestRenamed category: #'TDDGuru-Model'!
Change subclass: #TestRenamed
	instanceVariableNames: 'newTestChangeRecord testRemovedChangeRecord'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TestRenamed class' category: #'TDDGuru-Model'!
TestRenamed class
	instanceVariableNames: ''!

!classDefinition: #TestRun category: #'TDDGuru-Model'!
Change subclass: #TestRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TestRun class' category: #'TDDGuru-Model'!
TestRun class
	instanceVariableNames: ''!

!classDefinition: #TestFailed category: #'TDDGuru-Model'!
TestRun subclass: #TestFailed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TestFailed class' category: #'TDDGuru-Model'!
TestFailed class
	instanceVariableNames: ''!

!classDefinition: #TestPassed category: #'TDDGuru-Model'!
TestRun subclass: #TestPassed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TestPassed class' category: #'TDDGuru-Model'!
TestPassed class
	instanceVariableNames: ''!

!classDefinition: #UnknownChange category: #'TDDGuru-Model'!
Change subclass: #UnknownChange
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'UnknownChange class' category: #'TDDGuru-Model'!
UnknownChange class
	instanceVariableNames: ''!

!classDefinition: #ChangeDetector category: #'TDDGuru-Model'!
Object subclass: #ChangeDetector
	instanceVariableNames: 'changeClass lookahead changeDetectedBlock detectBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'ChangeDetector class' category: #'TDDGuru-Model'!
ChangeDetector class
	instanceVariableNames: ''!

!classDefinition: #ChangeLog category: #'TDDGuru-Model'!
Object subclass: #ChangeLog
	instanceVariableNames: 'changeList inventory changeDetectors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'ChangeLog class' category: #'TDDGuru-Model'!
ChangeLog class
	instanceVariableNames: ''!

!classDefinition: #TDDGuru category: #'TDDGuru-Model'!
Object subclass: #TDDGuru
	instanceVariableNames: 'changeLog changesFile state analysisResult currentChange inventory initialState initialTestClasses startingPoint previousChange changesFileStartPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TDDGuru class' category: #'TDDGuru-Model'!
TDDGuru class
	instanceVariableNames: ''!

!classDefinition: #TDDState category: #'TDDGuru-Model'!
Object subclass: #TDDState
	instanceVariableNames: 'context passedTests'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TDDState class' category: #'TDDGuru-Model'!
TDDState class
	instanceVariableNames: ''!

!classDefinition: #GreenTDDState category: #'TDDGuru-Model'!
TDDState subclass: #GreenTDDState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'GreenTDDState class' category: #'TDDGuru-Model'!
GreenTDDState class
	instanceVariableNames: ''!

!classDefinition: #MoreThanOneTestWrittenTDDState category: #'TDDGuru-Model'!
TDDState subclass: #MoreThanOneTestWrittenTDDState
	instanceVariableNames: 'firstTest secondTest errorWasReported testAddedChange isCorrect'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'MoreThanOneTestWrittenTDDState class' category: #'TDDGuru-Model'!
MoreThanOneTestWrittenTDDState class
	instanceVariableNames: ''!

!classDefinition: #NotDoingTDD category: #'TDDGuru-Model'!
TDDState subclass: #NotDoingTDD
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'NotDoingTDD class' category: #'TDDGuru-Model'!
NotDoingTDD class
	instanceVariableNames: ''!

!classDefinition: #NotStartedTDDState category: #'TDDGuru-Model'!
TDDState subclass: #NotStartedTDDState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'NotStartedTDDState class' category: #'TDDGuru-Model'!
NotStartedTDDState class
	instanceVariableNames: ''!

!classDefinition: #RedTDDState category: #'TDDGuru-Model'!
TDDState subclass: #RedTDDState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'RedTDDState class' category: #'TDDGuru-Model'!
RedTDDState class
	instanceVariableNames: ''!

!classDefinition: #RefactorTDDState category: #'TDDGuru-Model'!
TDDState subclass: #RefactorTDDState
	instanceVariableNames: 'newMethods changedMethods'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'RefactorTDDState class' category: #'TDDGuru-Model'!
RefactorTDDState class
	instanceVariableNames: ''!

!classDefinition: #WritingAFailingTestTDDState category: #'TDDGuru-Model'!
TDDState subclass: #WritingAFailingTestTDDState
	instanceVariableNames: 'test'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'WritingAFailingTestTDDState class' category: #'TDDGuru-Model'!
WritingAFailingTestTDDState class
	instanceVariableNames: ''!

!classDefinition: #TestInventory category: #'TDDGuru-Model'!
Object subclass: #TestInventory
	instanceVariableNames: 'testClasses tests'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TestInventory class' category: #'TDDGuru-Model'!
TestInventory class
	instanceVariableNames: ''!

!classDefinition: #TimeLine category: #'TDDGuru-Model'!
Object subclass: #TimeLine
	instanceVariableNames: 'events selectedEvent changes statesAfterChanges analysisResult currentSection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TimeLine class' category: #'TDDGuru-Model'!
TimeLine class
	instanceVariableNames: ''!

!classDefinition: #TimeLineEvent category: #'TDDGuru-Model'!
Object subclass: #TimeLineEvent
	instanceVariableNames: 'timeline'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'TimeLineEvent class' category: #'TDDGuru-Model'!
TimeLineEvent class
	instanceVariableNames: ''!

!classDefinition: #ChangeEvent category: #'TDDGuru-Model'!
TimeLineEvent subclass: #ChangeEvent
	instanceVariableNames: 'change'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'ChangeEvent class' category: #'TDDGuru-Model'!
ChangeEvent class
	instanceVariableNames: ''!

!classDefinition: #StateTransitionEvent category: #'TDDGuru-Model'!
TimeLineEvent subclass: #StateTransitionEvent
	instanceVariableNames: 'fromState toState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'StateTransitionEvent class' category: #'TDDGuru-Model'!
StateTransitionEvent class
	instanceVariableNames: ''!

!classDefinition: #UninstalledMethodReference category: #'TDDGuru-Model'!
Object subclass: #UninstalledMethodReference
	instanceVariableNames: 'selector className sourceCode overrides'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Model'!
!classDefinition: 'UninstalledMethodReference class' category: #'TDDGuru-Model'!
UninstalledMethodReference class
	instanceVariableNames: ''!

!classDefinition: #TDDStateIcon category: #'TDDGuru-Tools'!
Object subclass: #TDDStateIcon
	instanceVariableNames: 'tddState width height'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tools'!
!classDefinition: 'TDDStateIcon class' category: #'TDDGuru-Tools'!
TDDStateIcon class
	instanceVariableNames: ''!

!classDefinition: #TDDGuruTest category: #'TDDGuru-Tests'!
DynamicallyCodeCreationTest subclass: #TDDGuruTest
	instanceVariableNames: 'tddGuru previousUserChangesExtension'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'TDDGuruTest class' category: #'TDDGuru-Tests'!
TDDGuruTest class
	instanceVariableNames: ''!

!classDefinition: #GreenTest category: #'TDDGuru-Tests'!
TDDGuruTest subclass: #GreenTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'GreenTest class' category: #'TDDGuru-Tests'!
GreenTest class
	instanceVariableNames: ''!

!classDefinition: #MoreThanOneTestWrittenTest category: #'TDDGuru-Tests'!
TDDGuruTest subclass: #MoreThanOneTestWrittenTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'MoreThanOneTestWrittenTest class' category: #'TDDGuru-Tests'!
MoreThanOneTestWrittenTest class
	instanceVariableNames: ''!

!classDefinition: #NotDoingTDDTest category: #'TDDGuru-Tests'!
TDDGuruTest subclass: #NotDoingTDDTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'NotDoingTDDTest class' category: #'TDDGuru-Tests'!
NotDoingTDDTest class
	instanceVariableNames: ''!

!classDefinition: #NotStartedTest category: #'TDDGuru-Tests'!
TDDGuruTest subclass: #NotStartedTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'NotStartedTest class' category: #'TDDGuru-Tests'!
NotStartedTest class
	instanceVariableNames: ''!

!classDefinition: #OtherTest category: #'TDDGuru-Tests'!
TDDGuruTest subclass: #OtherTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'OtherTest class' category: #'TDDGuru-Tests'!
OtherTest class
	instanceVariableNames: ''!

!classDefinition: #RedTest category: #'TDDGuru-Tests'!
TDDGuruTest subclass: #RedTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'RedTest class' category: #'TDDGuru-Tests'!
RedTest class
	instanceVariableNames: ''!

!classDefinition: #RefactorTest category: #'TDDGuru-Tests'!
TDDGuruTest subclass: #RefactorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'RefactorTest class' category: #'TDDGuru-Tests'!
RefactorTest class
	instanceVariableNames: ''!

!classDefinition: #WritingAFailingTestTest category: #'TDDGuru-Tests'!
TDDGuruTest subclass: #WritingAFailingTestTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'WritingAFailingTestTest class' category: #'TDDGuru-Tests'!
WritingAFailingTestTest class
	instanceVariableNames: ''!

!classDefinition: #TestChangesTest category: #'TDDGuru-Tests'!
DynamicallyCodeCreationTest subclass: #TestChangesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'TestChangesTest class' category: #'TDDGuru-Tests'!
TestChangesTest class
	instanceVariableNames: ''!

!classDefinition: #LogTestChangesTest category: #'TDDGuru-Tests'!
TestChangesTest subclass: #LogTestChangesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'LogTestChangesTest class' category: #'TDDGuru-Tests'!
LogTestChangesTest class
	instanceVariableNames: ''!

!classDefinition: #ScanTestChangesTest category: #'TDDGuru-Tests'!
TestChangesTest subclass: #ScanTestChangesTest
	instanceVariableNames: 'mockClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuru-Tests'!
!classDefinition: 'ScanTestChangesTest class' category: #'TDDGuru-Tests'!
ScanTestChangesTest class
	instanceVariableNames: ''!


!ChangeListMorph methodsFor: 'as yet unclassified' stamp: 'MGD 6/21/2019 08:03:33'!
analysisResult
	^ analysisResult! !

!ChangeListMorph methodsFor: 'as yet unclassified' stamp: 'MGD 6/21/2019 08:03:50'!
analysisResult: anAnalysisResult
	analysisResult := anAnalysisResult ! !

!ChangeListMorph methodsFor: 'as yet unclassified' stamp: 'MGD 6/17/2019 19:40:25'!
innerMorphClass
	^ InnerChangeListMorph ! !

!ChangeListMorph methodsFor: 'as yet unclassified' stamp: 'MGD 11/5/2019 12:12:39'!
update: aSection
	owner update: aSection.
	super update: aSection.! !

!PickAChangeWindow methodsFor: 'GUI building' stamp: 'jmv 7/30/2024 15:18:24'!
buildMorphicWindow
	| listPane |
	listPane := PluggableListMorph 
		withModel: model
		listGetter: #list
		indexGetter: #listIndex
		indexSetter: #toggleListIndex:.
	
	self layoutMorph
		addMorph: listPane proportionalHeight: 0.4;
		addAdjusterAndMorph: self buildLowerPanes proportionalHeight: 0.6! !

!PickAChangeWindow methodsFor: 'GUI building' stamp: 'MGD 9/26/2019 22:03:06'!
optionalButtonRow
	| row runButton  buttonColor |
	
	buttonColor _ self buttonColor.
	runButton := PluggableButtonMorph 
					model: self
					stateGetter: nil
					action: #runFromSelectedChange.
	runButton color: buttonColor.
	runButton label: 'Run from here'.
	
	row _ LayoutMorph newRow.
	row doAdoptWidgetsColor.
	row color: buttonColor.
	row addMorph: runButton.
	^row! !

!PickAChangeWindow methodsFor: 'GUI building' stamp: 'MGD 4/7/2020 17:02:16'!
runFromSelectedChange
	| userChangesFileName tddGuru |
	
	model listIndex > 0 ifTrue: [
		userChangesFileName := model file name.
		tddGuru := TDDGuru on: userChangesFileName from: changesFileStartPosition.
		tddGuru startingFromChange: model listIndex.
		tddGuru run; showAnalysisResult.
		self delete ].! !

!PickAChangeWindow methodsFor: 'initialization' stamp: 'MGD 4/7/2020 17:01:55'!
startPosition: startPosition
	changesFileStartPosition := startPosition! !

!PickAChangeWindow class methodsFor: 'instance creation' stamp: 'MGD 4/7/2020 17:00:37'!
open: model startPosition: startPosition
	| window |
	window := self open: model label: 'Pick a Change'.
	window startPosition: startPosition.
	^ window! !

!AnalysisResultWindow methodsFor: 'GUI building' stamp: 'MGD 11/7/2019 19:46:40'!
buildMorphicWindow			
	self layoutMorph 
		addMorph: self timeline proportionalHeight: 0.70;
		addAdjusterAndMorph: self details proportionalHeight: 0.15;
		addAdjusterAndMorph: self code proportionalHeight: 0.15;
		addAdjusterAndMorph: self buttonPanel fixedHeight: self defaultButtonPaneHeight.! !

!AnalysisResultWindow methodsFor: 'GUI building' stamp: 'MGD 11/7/2019 19:38:38'!
buttonPanel
	| buttonColor row rerunButton |
	
	buttonColor _ self buttonColor.
	rerunButton := PluggableButtonMorph 
					model: self
					stateGetter: nil
					action: #rerun.
	rerunButton color: buttonColor.
	rerunButton label: 'Refresh'.
	
	row _ LayoutMorph newRow.
	row doAdoptWidgetsColor.
	row color: buttonColor.
	row addMorph: rerunButton.
	^ row! !

!AnalysisResultWindow methodsFor: 'GUI building' stamp: 'MGD 11/7/2019 19:29:17'!
code
	changeCode := TextModelMorph textProvider: model timeline textGetter: #selectedCode.
	changeCode disableEditing.
	
	^ changeCode! !

!AnalysisResultWindow methodsFor: 'GUI building' stamp: 'MGD 1/22/2020 18:31:17'!
details
	changeDetail := TextModelMorph textProvider: model timeline textGetter: #selectedChangeDetail.
	model timeline when: #detailChanged send: #refetch to: changeDetail model.
	changeDetail disableEditing.
	
	^ changeDetail! !

!AnalysisResultWindow methodsFor: 'GUI building' stamp: 'MGD 11/7/2019 19:18:40'!
displayChange: aChange
	| detail |
	
	(model isCorrect: aChange)
		ifTrue: [ changeDetailTitle contents: 'CORRECT'. changeDetailTitle color: self class successColor ]
		ifFalse: [ changeDetailTitle contents: 'ERROR'. changeDetailTitle color: self class errorColor ].
		
	detail := ''.
	(model hasError: aChange) ifTrue: [ 
		detail := detail append: (model errorIn: aChange). 
		detail := detail append: String newLineString ].

	changeDetail contents: detail.
! !

!AnalysisResultWindow methodsFor: 'GUI building' stamp: 'MGD 6/27/2019 10:38:13'!
displayStateTransition: anEvent
	changeDetailTitle contents: anEvent stateTo printString. 
	changeDetailTitle color: (self class stateTransitionColor: anEvent stateTo).
	
	anEvent stateFrom ifNotNil:  [
		changeDetail contents: (anEvent stateFrom printString, ' -> ', anEvent stateTo printString) ]
	! !

!AnalysisResultWindow methodsFor: 'GUI building' stamp: 'jmv 7/19/2024 12:23:37'!
timeline
	| timeline |
	
	timeline := ChangeListMorph withModel: model timeline listGetter: #changeEvents indexGetter: #selectionIndex indexSetter: #selectionIndex:.
	timeline analysisResult: model.

	^ timeline
! !

!AnalysisResultWindow methodsFor: 'GUI building' stamp: 'MGD 1/21/2020 19:32:10'!
update: aSection
	self updateCodeSection.! !

!AnalysisResultWindow methodsFor: 'GUI building' stamp: 'MGD 1/4/2020 19:29:55'!
updateCodeSection
	changeCode update: #acceptedContents! !

!AnalysisResultWindow methodsFor: 'actions' stamp: 'MGD 11/7/2019 20:36:32'!
analyzedBy: aTDDGuru
	tddGuru := aTDDGuru
	! !

!AnalysisResultWindow methodsFor: 'actions' stamp: 'MGD 11/7/2019 21:30:26'!
rerun
	tddGuru rerun; showAnalysisResult.
	self delete.

	! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'MGD 11/21/2019 17:19:05'!
analyzeWholeFile: userChangesFileName
	(TDDGuru on: userChangesFileName) run; showAnalysisResult
	! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'MGD 10/3/2019 19:23:58'!
errorColor
	^ Color fromHexString: '#dc3545'! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'MGD 11/24/2019 10:03:58'!
lastSnapshotPosition: userChangesFileName	
	| end done block positions prevBlock |
	userChangesFileName asFileEntry readStreamDo: [ :changesFile |
		positions _ SortedCollection new.
		end _ changesFile size.
		prevBlock _ end.
		block _ end - 1024 max: 0.
		done _ false.
		[ done or: [ positions size > 0 ]]
			whileFalse: [
				changesFile position: block.
				"ignore first fragment"
				changesFile nextChunk.
				[ changesFile position < prevBlock ]
					whileTrue: [
						| pos chunk |
						pos _ changesFile position.
						chunk _ changesFile nextChunk.
						((Smalltalk isQuitRecord: chunk) or: [ Smalltalk isSnapshotRecord: chunk ])
							ifTrue: [ positions add: pos ]].
				block = 0
					ifTrue: [done _ true]
					ifFalse: [
						prevBlock _ block.
						block _ block - 1024 max: 0]].
	].

	^ positions isEmpty ifTrue: [0] ifFalse: [positions last]
	
! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'MGD 11/7/2019 20:35:29'!
openFor: anAnalysisResult analyzedBy: tddGuru
	| window |
	window := self open: anAnalysisResult label: 'TDDGuru'.
	window analyzedBy: tddGuru
	
	! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'MGD 4/7/2020 16:59:06'!
pickAChangeAndAnalyze: userChangesFileName	
	| changeList fileStream startPosition |

	startPosition := self pickStartPositionFromSnapshots: userChangesFileName.
	
	startPosition ifNotNil: [
		fileStream := userChangesFileName asFileEntry readStream.
		changeList := ChangeList new scanFile: fileStream from: startPosition to: fileStream size .
		PickAChangeWindow open: changeList startPosition: startPosition ]
	! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'MGD 11/24/2019 09:54:53'!
pickStartPositionFromSnapshots: userChangesFileName	
	
	"Prompt with a menu of how far back to go when browsing a changes file."

	| banners positions pos chunk i startPosition |
	
	startPosition := self lastSnapshotPosition: userChangesFileName.
	userChangesFileName asFileEntry readStreamDo: [ :changesFile |
		banners _ OrderedCollection new.
		positions _ OrderedCollection new.
		pos _ startPosition.
		[pos = 0
			or: [banners size > 20]] 		"Go back at most 20 image exits"
			whileFalse: [
				changesFile position: pos.
				chunk _ changesFile nextChunk.
				i _ chunk indexOfSubCollection: 'priorSource: ' startingAt: 1.
				i > 0
					ifTrue: [
						positions addLast: pos.
						banners addLast: (chunk copyFrom: 5 to: i - 2).
						pos _ Number readFrom: (chunk copyFrom: i + 13 to: chunk size)]
					ifFalse: [
						pos _ 0]].
	].
	positions addLast: 0.
	banners addLast: 'Whole file'.
	^ (SelectionMenu labelList: banners selections: positions)
				startUpWithCaption: 'Browse as far back as...'.
! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'HAW 5/14/2025 10:02:44'!
startAnalysis
	| selected changesFile userChangesFileName |
	
	userChangesFileName := self 
		request: 'Where are the changes logged?' 
		initialAnswer: (DirectoryEntry userChangesDirectory // Smalltalk userChangesFileName) pathName
		orCancel: [ ^ nil ]. 	
	changesFile := userChangesFileName asFileEntry.
	
	changesFile exists ifTrue: [
		selected := (SelectionMenu labels: { 'The whole change log' . 'From a specific change'} selections: { #all . #pick }) startUpWithCaption: 'TDDGuru should analyze...'.
		selected = #pick ifTrue: [ self pickAChangeAndAnalyze: userChangesFileName ].
		selected = #all ifTrue: [ self analyzeWholeFile: userChangesFileName ] 
	]! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'HAW 10/7/2025 09:48:32'!
stateTransitionColor: aTDDState
	aTDDState = GreenTDDState ifTrue: [ ^ Color fromHexString: '#28a745' ].
	aTDDState = RedTDDState ifTrue: [ ^ Color fromHexString: '#dc3545' ].
	aTDDState = WritingAFailingTestTDDState ifTrue: [ ^ Color fromHexString: '#ffc107' ].
	aTDDState = MoreThanOneTestWrittenTDDState ifTrue: [ ^ Color fromHexString: '#ffc107' ].
	aTDDState = NotDoingTDD ifTrue: [ ^ Color fromHexString: '#343a40' ].
	aTDDState = RefactorTDDState ifTrue: [ ^ Color fromHexString: '#007bff' ].
	aTDDState = NotStartedTDDState ifTrue: [ ^ Color fromHexString: '#17a2b8' ].
	
	^ Color green! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'MGD 6/20/2019 15:42:35'!
successColor
	^ Color fromHexString: '#006200'! !

!AnalysisResultWindow class methodsFor: 'colors' stamp: 'HAW 7/28/2022 18:47:16'!
worldMenuOptions
	^ `{{
			#submenuOf -> TheWorldMenu openLabel.
			#itemGroup 		-> 		40.
			#itemOrder 		-> 		30.
			#label 			->			'TDDGuru'.
			#object 			-> 		AnalysisResultWindow .
			#selector 		-> 		#startAnalysis.
			#icon 			-> 		#worldIcon.
			#balloonText 	-> 		'Learn TDD by analyzing your change log'.
		} asDictionary}`! !

!InnerChangeListMorph methodsFor: 'as yet unclassified' stamp: 'MGD 10/3/2019 19:16:38'!
colorForChange: aChange	
	(owner analysisResult isCorrect: aChange) ifTrue: [ ^ AnalysisResultWindow successColor ] ifFalse: [ ^ AnalysisResultWindow errorColor ]! !

!InnerChangeListMorph methodsFor: 'as yet unclassified' stamp: 'MGD 9/29/2019 19:37:26'!
colorForStateTransition: aTDDState
	^ AnalysisResultWindow stateTransitionColor: aTDDState 
! !

!InnerChangeListMorph methodsFor: 'as yet unclassified' stamp: 'MGD 10/15/2019 18:53:17'!
drawChangeRow: aRow on: aCanvas	
	self drawIconFor: aRow in: aCanvas.
	self drawChangeTextFor: aRow in: aCanvas.

		
	
! !

!InnerChangeListMorph methodsFor: 'as yet unclassified' stamp: 'HAW 5/14/2025 10:11:30'!
drawChangeTextFor: aRow in: aCanvas
	aCanvas
		drawString: (self item: aRow) displayStringOrText
		at: 45 @ (self drawYForRow: aRow)
		font: font
		color: (self colorForRow: aRow).
		
	
! !

!InnerChangeListMorph methodsFor: 'as yet unclassified' stamp: 'HAW 5/14/2025 10:10:58'!
drawIconFor: aRow in: aCanvas
	| currentEvent stateAfterChange icon |
		
	currentEvent := owner model changeAt: aRow.
	stateAfterChange := owner model stateAfter: currentEvent change.
	icon := TDDStateIcon for: stateAfterChange width: 40 height: (font lineSpacing - 1).
	icon drawAt: (0 @ (self drawYForRow: aRow)) on: aCanvas.
	icon setBalloonText: stateAfterChange asString 
! !

!InnerChangeListMorph methodsFor: 'as yet unclassified' stamp: 'MGD 9/29/2019 19:20:09'!
drawRow: aRow on: aCanvas
	| currentEvent |
	currentEvent := owner model changeAt: aRow.
	
	currentEvent type = #change ifTrue: [ self drawChangeRow: aRow on: aCanvas ].
	currentEvent type = #stateTransition ifTrue: [ self drawStateTransitionRow: aRow on: aCanvas ].
	
! !

!InnerChangeListMorph methodsFor: 'as yet unclassified' stamp: 'MGD 9/29/2019 19:34:10'!
drawStateTransitionRow: aRow on: aCanvas
	| currentEvent stateName stringWidth stateNamePosition |
	currentEvent := owner model changeAt: aRow.
	
	stateName := currentEvent stateTo printString.
	stringWidth := font widthOfString: stateName.
	stateNamePosition := (self desiredWidth - stringWidth) / 2.
	aCanvas drawString: stateName at: (stateNamePosition @ (self drawYForRow: aRow)) font: font color: Color white
	
	
! !

!InnerChangeListMorph methodsFor: 'drawing' stamp: 'MGD 9/29/2019 19:20:09'!
colorForRow: row
	| event |
	event := owner model changeAt: row.
	
	(event type = #change) ifTrue: [ ^ self colorForChange: event change ].
	(event type = #stateTransition) ifTrue: [ ^ self colorForStateTransition: event ].

	^ super colorForRow: row! !

!InnerChangeListMorph methodsFor: 'drawing' stamp: 'MGD 9/17/2019 19:51:21'!
drawOn: aCanvas

	listItems size = 0 ifTrue: [ ^self ].
 
	self drawHighlightOn: aCanvas.
	self drawSelectionOn: aCanvas.
	

	(self topVisibleRowForCanvas: aCanvas)
		to: (self bottomVisibleRowForCanvas: aCanvas)
		do: [ :row |
			(owner itemSelectedAmongMultiple:  row) ifTrue: [
				self drawBackgroundForMulti: row on: aCanvas. ].
			self drawRow: row on: aCanvas ]! !

!AnalysisResult methodsFor: 'initialization' stamp: 'MGD 1/3/2020 08:41:52'!
initialize
	timeline := TimeLine for: self.
	errors := Dictionary new.
	
	timeline addDependent: self.! !

!AnalysisResult methodsFor: 'errors' stamp: 'MGD 5/14/2019 10:49:41'!
addError: anErrorString in: aChange
	errors at: aChange put: anErrorString! !

!AnalysisResult methodsFor: 'errors' stamp: 'MGD 8/30/2019 08:55:09'!
changeAt: index
	^ self changeEvents at: index
! !

!AnalysisResult methodsFor: 'errors' stamp: 'MGD 8/7/2019 20:02:50'!
errorIn: aChange
	^ errors at: aChange.! !

!AnalysisResult methodsFor: 'errors' stamp: 'MGD 12/1/2018 14:50:12'!
errors
	^ errors! !

!AnalysisResult methodsFor: 'errors' stamp: 'MGD 6/20/2019 18:22:50'!
hasError: aChange
	^ errors includesKey: aChange.! !

!AnalysisResult methodsFor: 'errors' stamp: 'MGD 10/3/2019 19:15:08'!
isCorrect: aChange
	| stateAfterChange |
	
	stateAfterChange := self timeline stateAfter: aChange.
	
	^ stateAfterChange isCorrect and: [ (self hasError: aChange) not ]! !

!AnalysisResult methodsFor: 'changes' stamp: 'MGD 6/20/2019 18:18:28'!
addChange: aChange
	timeline addChange: aChange ! !

!AnalysisResult methodsFor: 'changes' stamp: 'MGD 8/30/2019 08:56:40'!
changeEvents
	^ timeline changeEvents! !

!AnalysisResult methodsFor: 'timeline' stamp: 'MGD 6/20/2019 18:57:39'!
stateAfter: aChange 
	^ timeline stateAfter: aChange! !

!AnalysisResult methodsFor: 'timeline' stamp: 'MGD 6/21/2019 07:31:17'!
timeline
	^ timeline! !

!AnalysisResult methodsFor: 'timeline' stamp: 'MGD 6/25/2019 09:28:49'!
update: aSection
	self changed: aSection! !

!AnalysisResult methodsFor: 'states' stamp: 'MGD 6/27/2019 10:19:24'!
stateTransitionFrom: previousTDDState to: currentTDDState
	timeline stateTransitionFrom: previousTDDState to: currentTDDState! !

!AnalysisResult methodsFor: 'accessing' stamp: 'MGD 11/12/2019 16:42:07'!
changeWhenMethodWasAdded: aSelector in: className 
	^ timeline changeWhenMethodWasAdded: aSelector in: className! !

!AnalysisResult methodsFor: 'accessing' stamp: 'MGD 8/30/2019 09:02:51'!
changes
	
	^ timeline changes! !

!Change methodsFor: 'accessing' stamp: 'MGD 5/31/2019 07:28:53'!
category
	self subclassResponsibility ! !

!Change methodsFor: 'accessing' stamp: 'MGD 9/18/2019 20:40:55'!
code
	
	^ changeRecord string.
	! !

!Change methodsFor: 'accessing' stamp: 'MGD 12/26/2019 19:48:15'!
dateString
	^ self stamp substrings second! !

!Change methodsFor: 'accessing' stamp: 'MGD 5/16/2019 20:08:13'!
description
	self subclassResponsibility.! !

!Change methodsFor: 'accessing' stamp: 'MGD 5/16/2019 19:34:59'!
isRecognized
	^ true! !

!Change methodsFor: 'accessing' stamp: 'HAW 11/12/2021 12:33:07'!
time
	| timeParts hours minutes seconds date time |
	
	date := FixedGregorianDate fromDate: self dateString asDate.
	timeParts := self timeString findTokens: ':'.
	"Some timestamps have only hour and minutes without seconds, so we add 0 to fix that problem - Hernan"
	timeParts add: 0.
	timeParts size < 3 ifTrue: [ self error: 'Incorrect time format ', self timeString ].
	
	hours := timeParts first asNumber.
	minutes := timeParts second asNumber.
	seconds := timeParts third asNumber.
	
	time := TimeOfDay hours: hours minutes: minutes seconds: seconds.	
	
	^ GregorianDateTime date: date timeOfDay: time.
	! !

!Change methodsFor: 'accessing' stamp: 'MGD 11/27/2019 19:06:57'!
timeString
	^ self stamp substrings third! !

!Change methodsFor: 'printing' stamp: 'MGD 6/20/2019 15:19:42'!
printOn: aStream
	(self category printString, ' - ', self description) printOn: aStream.! !

!Change methodsFor: 'printing' stamp: 'MGD 11/26/2019 16:09:29'!
printString	
	^ '[', self category printString, '] ', self description.! !

!Change methodsFor: 'printing' stamp: 'MGD 5/23/2019 11:02:32'!
stamp
	^ changeRecord stamp! !

!Change methodsFor: 'initialization' stamp: 'MGD 5/1/2019 16:13:26'!
changeRecord: aChangeRecord
	changeRecord := aChangeRecord ! !

!Change methodsFor: 'reporting' stamp: 'MGD 3/18/2020 20:55:55'!
reportChangeTo: tddGuru 
	self subclassResponsibility ! !

!Change class methodsFor: 'instance creation' stamp: 'MGD 7/12/2019 12:37:43'!
newFor: aChangeRecord
	^ self new changeRecord: aChangeRecord! !

!ClassChange methodsFor: 'accessing' stamp: 'MGD 4/10/2020 16:45:39'!
changeClass
	^ changeRecord changeClass! !

!ClassChange methodsFor: 'accessing' stamp: 'MGD 4/10/2020 16:45:53'!
changeClassName
	^ changeRecord changeClassName ! !

!ClassRenamed methodsFor: 'accessing' stamp: 'MGD 12/19/2019 20:45:49'!
category
	^ #classRenamed! !

!ClassRenamed methodsFor: 'accessing' stamp: 'MGD 12/19/2019 19:49:20'!
currentName
	^ changeRecord newClassName ! !

!ClassRenamed methodsFor: 'accessing' stamp: 'MGD 12/19/2019 20:46:38'!
description
	^ self previousName , ' was renamed to ', self currentName.! !

!ClassRenamed methodsFor: 'accessing' stamp: 'MGD 12/19/2019 19:49:03'!
previousName
	^ changeRecord changeClassName ! !

!ClassRenamed methodsFor: 'reporting' stamp: 'MGD 3/18/2020 20:55:38'!
reportChangeTo: tddGuru 
	tddGuru classRenamedFrom: self previousName to: self currentName! !

!ModelClassRemoved methodsFor: 'accessing' stamp: 'MGD 7/15/2019 07:40:25'!
category
	^ #classRemoved! !

!ModelClassRemoved methodsFor: 'printing' stamp: 'MGD 10/2/2019 19:39:53'!
description
	^ self changeClassName, ' was removed'! !

!ModelClassRemoved methodsFor: 'reporting' stamp: 'MGD 10/14/2019 16:24:29'!
reportChangeTo: tddGuru
	tddGuru modelClassRemoved: changeRecord changeClassName! !

!NewModelClass methodsFor: 'accessing' stamp: 'MGD 8/16/2019 09:58:58'!
category
	^ #newModelClass! !

!NewModelClass methodsFor: 'printing' stamp: 'MGD 8/16/2019 10:07:20'!
description
	^ 'New model class ', self changeClassName! !

!NewModelClass methodsFor: 'reporting' stamp: 'MGD 3/18/2020 20:39:14'!
reportChangeTo: tddGuru
	tddGuru newModelClass: self changeClassName! !

!NewTestClass methodsFor: 'accessing' stamp: 'MGD 5/11/2019 15:47:31'!
category
	^ #newTestClass! !

!NewTestClass methodsFor: 'printing' stamp: 'MGD 5/16/2019 20:10:25'!
description
	^ 'New test class ', self changeClassName.! !

!NewTestClass methodsFor: 'reporting' stamp: 'MGD 10/15/2019 17:47:12'!
reportChangeTo: tddGuru
	tddGuru newTestClass: self changeClassName! !

!TestClassRemoved methodsFor: 'accessing' stamp: 'MGD 10/14/2019 16:19:30'!
category
	^ #testClassRemoved! !

!TestClassRemoved methodsFor: 'printing' stamp: 'MGD 10/14/2019 16:19:44'!
description
	^ self changeClassName, ' was removed'! !

!TestClassRemoved methodsFor: 'reporting' stamp: 'MGD 10/14/2019 16:16:48'!
reportChangeTo: aTDDGuru 
	aTDDGuru testClassRemoved: self changeClassName ! !

!MethodChange methodsFor: 'accessing' stamp: 'MGD 4/10/2020 16:34:29'!
changeClass
	^ changeRecord changeClass! !

!MethodChange methodsFor: 'accessing' stamp: 'MGD 4/10/2020 16:45:59'!
changeClassName
	^ changeRecord changeClassName ! !

!MethodChange methodsFor: 'accessing' stamp: 'MGD 3/18/2020 20:09:33'!
methodReference
	^ UninstalledMethodReference selector: self methodSelector class: self changeClassName sourceCode: self code overrides: self overridesASuperclassMethod! !

!MethodChange methodsFor: 'accessing' stamp: 'MGD 3/17/2020 20:14:15'!
methodSelector
	^ changeRecord methodSelector! !

!MethodChange methodsFor: 'accessing' stamp: 'MGD 3/17/2020 20:11:57'!
overridesASuperclassMethod
	^ changeRecord overridesASuperclassMethod ! !

!MethodRemoved methodsFor: 'accessing' stamp: 'MGD 6/26/2019 19:12:27'!
category
	^ #methodRemoved! !

!MethodRemoved methodsFor: 'accessing' stamp: 'MGD 10/15/2019 16:25:44'!
description
	^ self changeClassName, '>>', self methodSelector, ' was removed'! !

!MethodRemoved methodsFor: 'accessing' stamp: 'MGD 3/18/2020 21:05:10'!
methodReference
	^ UninstalledMethodReference selector: self methodSelector class: self changeClassName sourceCode: self code! !

!MethodRemoved methodsFor: 'reporting' stamp: 'MGD 3/18/2020 20:13:15'!
reportChangeTo: tddGuru
	tddGuru modelMethodRemoved: self methodReference! !

!ModelMethodChanged methodsFor: 'accessing' stamp: 'MGD 8/16/2019 09:58:50'!
category
	^ #modelMethodChanged! !

!ModelMethodChanged methodsFor: 'accessing' stamp: 'HAW 4/5/2020 18:57:47'!
code
	| changeClass sourceString |
	sourceString := changeRecord string.
	changeClass := changeRecord changeClass.
	changeClass ifNil: [ ^ sourceString ].
	
	^ [changeClass compilerClass new
		format: sourceString in: changeClass notifying: nil]
		on: InMidstOfFileinNotification
		do: [ :anException | anException resume: true ]! !

!ModelMethodChanged methodsFor: 'accessing' stamp: 'MGD 10/15/2019 16:26:56'!
description
	^ self changeClassName, '>>', self methodSelector, ' was modified'! !

!ModelMethodChanged methodsFor: 'reporting' stamp: 'MGD 3/18/2020 20:14:18'!
reportChangeTo: tddGuru
	tddGuru modelMethodChanged: self methodReference ! !

!NewModelMethod methodsFor: 'accessing' stamp: 'MGD 8/16/2019 10:08:12'!
category
	^ #newModelMethod! !

!NewModelMethod methodsFor: 'accessing' stamp: 'MGD 9/18/2019 20:41:35'!
code
	| changeClass sourceString |
	sourceString := changeRecord string.
	changeClass := changeRecord changeClass.
	changeClass ifNil: [ ^ sourceString ].
	
	^ changeClass compilerClass new
		format: sourceString in: changeClass notifying: nil! !

!NewModelMethod methodsFor: 'accessing' stamp: 'MGD 10/15/2019 16:27:52'!
description
	^ self changeClassName, '>>', self methodSelector, ' was added'! !

!NewModelMethod methodsFor: 'reporting' stamp: 'MGD 4/2/2020 19:15:50'!
reportChangeTo: tddGuru
	tddGuru newModelMethod: self methodReference ! !

!NewTest methodsFor: 'accessing' stamp: 'MGD 5/24/2019 11:48:13'!
category
	^ #newTest! !

!NewTest methodsFor: 'accessing' stamp: 'MGD 9/18/2019 20:41:29'!
code
	| changeClass sourceString |
	sourceString := changeRecord string.
	changeClass := changeRecord changeClass.
	changeClass ifNil: [ ^ sourceString ].
	
	^ changeClass compilerClass new
		format: sourceString in: changeClass notifying: nil! !

!NewTest methodsFor: 'accessing' stamp: 'MGD 10/15/2019 16:28:13'!
description
	^ self changeClassName, '>>', self methodSelector, ' was added'! !

!NewTest methodsFor: 'reporting' stamp: 'MGD 4/2/2020 19:47:57'!
reportChangeTo: tddGuru
	tddGuru newTest: self methodReference! !

!TestChanged methodsFor: 'accessing' stamp: 'MGD 5/16/2019 20:15:49'!
category
	^ #testChanged! !

!TestChanged methodsFor: 'accessing' stamp: 'MGD 9/18/2019 20:40:31'!
code
	| changeClass sourceString |
	sourceString := changeRecord string.
	changeClass := changeRecord changeClass.
	changeClass ifNil: [ ^ sourceString ].
	
	^ changeClass compilerClass new
		format: sourceString in: changeClass notifying: nil! !

!TestChanged methodsFor: 'accessing' stamp: 'MGD 10/15/2019 16:28:38'!
description
	^ self changeClassName, '>>', self methodSelector, ' was modified'! !

!TestChanged methodsFor: 'reporting' stamp: 'MGD 3/18/2020 20:18:33'!
reportChangeTo: tddGuru
	tddGuru testChanged: self methodReference ! !

!TestRemoved methodsFor: 'accessing' stamp: 'MGD 10/14/2019 13:18:52'!
category
	^ #testRemoved! !

!TestRemoved methodsFor: 'accessing' stamp: 'MGD 3/17/2020 20:15:39'!
description
	^ self changeClassName, '>>', self methodSelector, ' was removed'! !

!TestRemoved methodsFor: 'accessing' stamp: 'MGD 3/18/2020 21:08:34'!
methodReference
	^ UninstalledMethodReference selector: self methodSelector class: self changeClassName sourceCode: self code! !

!TestRemoved methodsFor: 'reporting' stamp: 'MGD 3/18/2020 20:18:50'!
reportChangeTo: tddGuru
	tddGuru testRemoved: self methodReference ! !

!TestUtilityChanged methodsFor: 'accessing' stamp: 'MGD 6/13/2019 18:34:45'!
category
	^ #testRefactor! !

!TestUtilityChanged methodsFor: 'accessing' stamp: 'MGD 9/18/2019 20:41:54'!
code
	| changeClass sourceString |
	sourceString := changeRecord string.
	changeClass := changeRecord changeClass.
	changeClass ifNil: [ ^ sourceString ].
	
	^ changeClass compilerClass new
		format: sourceString in: changeClass notifying: nil! !

!TestUtilityChanged methodsFor: 'printing' stamp: 'MGD 10/22/2019 20:36:38'!
description
	^ self changeClassName, '>>', self methodSelector, ' was added or modified'! !

!TestUtilityChanged methodsFor: 'reporting' stamp: 'MGD 3/18/2020 20:20:05'!
reportChangeTo: aTDDGuru 
	aTDDGuru testUtilityChanged: self methodReference.! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 8/8/2019 19:39:34'!
category
	^ #testRenamed! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 11/5/2019 11:27:22'!
changeClass
	^ newTestChangeRecord changeClass ! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 9/5/2019 08:58:43'!
changeClassName
	^ newTestChangeRecord changeClassName ! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 11/5/2019 11:26:08'!
code
	^ newTestChangeRecord string ! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 10/15/2019 16:34:38'!
description
	^ 'Test was renamed from ', self from, ' to ', self to, ' in ', self changeClassName.! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 7/21/2019 12:35:10'!
from
	^ testRemovedChangeRecord methodSelector ! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 3/18/2020 20:53:31'!
newTestReference
	^ UninstalledMethodReference selector: self to class: self changeClassName sourceCode: self code.! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 3/18/2020 20:52:34'!
oldTestReference
	^ UninstalledMethodReference selector: self from class: self changeClassName ! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 8/8/2019 19:39:07'!
stamp
	^ newTestChangeRecord stamp ! !

!TestRenamed methodsFor: 'accessing' stamp: 'MGD 7/21/2019 12:35:29'!
to
	^ newTestChangeRecord methodSelector ! !

!TestRenamed methodsFor: 'initialization' stamp: 'MGD 7/20/2019 17:27:20'!
newTestChangeRecord: aChangeRecord 
	newTestChangeRecord := aChangeRecord! !

!TestRenamed methodsFor: 'initialization' stamp: 'MGD 7/20/2019 17:27:40'!
testRemovedChangeRecord: aMethodDeletionChangeRecord 
	testRemovedChangeRecord := aMethodDeletionChangeRecord! !

!TestRenamed methodsFor: 'reporting' stamp: 'MGD 3/18/2020 20:53:51'!
reportChangeTo: aTDDGuru 
	aTDDGuru testRenamedFrom: self oldTestReference to: self newTestReference! !

!TestRenamed class methodsFor: 'instance creation' stamp: 'MGD 7/20/2019 17:26:40'!
newFor: aNewTestChangeRecord and: aTestRemovedChangeRecord
	^ self new newTestChangeRecord: aNewTestChangeRecord; testRemovedChangeRecord: aTestRemovedChangeRecord! !

!TestRun methodsFor: 'accessing' stamp: 'MGD 4/10/2020 16:34:38'!
changeClass
	^ changeRecord changeClass! !

!TestRun methodsFor: 'accessing' stamp: 'MGD 4/10/2020 16:46:10'!
changeClassName
	^ changeRecord changeClassName ! !

!TestRun methodsFor: 'accessing' stamp: 'MGD 3/18/2020 20:37:19'!
testReference
	^ UninstalledMethodReference selector: self testSelector class: self changeClassName sourceCode: self code.! !

!TestRun methodsFor: 'accessing' stamp: 'MGD 3/18/2020 20:36:39'!
testSelector
	^ changeRecord methodSelector ! !

!TestFailed methodsFor: 'accessing' stamp: 'MGD 5/16/2019 20:16:02'!
category
	^ #testRun! !

!TestFailed methodsFor: 'accessing' stamp: 'MGD 10/15/2019 16:29:05'!
description
	^ self changeClassName, '>>', self testSelector, ' FAILED'! !

!TestFailed methodsFor: 'reporting' stamp: 'MGD 3/18/2020 21:00:07'!
reportChangeTo: tddGuru
	tddGuru testFailed: self testReference ! !

!TestPassed methodsFor: 'accessing' stamp: 'MGD 5/31/2019 07:29:27'!
category
	^ #testRun! !

!TestPassed methodsFor: 'printing' stamp: 'MGD 10/15/2019 16:29:20'!
description
	^ self changeClassName, '>>', self testSelector, ' PASSED'! !

!TestPassed methodsFor: 'reporting' stamp: 'MGD 3/18/2020 21:00:39'!
reportChangeTo: tddGuru
	tddGuru testPassed: self testReference! !

!UnknownChange methodsFor: 'accessing' stamp: 'MGD 6/27/2019 11:51:17'!
category
	^ #unknown! !

!UnknownChange methodsFor: 'accessing' stamp: 'MGD 6/27/2019 11:52:01'!
description
	^ 'Unknown change'! !

!UnknownChange methodsFor: 'accessing' stamp: 'MGD 5/16/2019 19:35:17'!
isRecognized
	^ false! !

!ChangeDetector methodsFor: 'initialization' stamp: 'MGD 7/17/2019 08:52:54'!
changeClass: aChangeClass
	changeClass := aChangeClass ! !

!ChangeDetector methodsFor: 'initialization' stamp: 'MGD 7/17/2019 09:11:06'!
detectBlock: aBlock
	detectBlock := aBlock ! !

!ChangeDetector methodsFor: 'initialization' stamp: 'MGD 7/17/2019 08:53:43'!
lookahead: numberOfLookaheadChanges
	lookahead := numberOfLookaheadChanges.! !

!ChangeDetector methodsFor: 'detect changes' stamp: 'MGD 7/17/2019 11:58:16'!
canBeDetectedIn: lookaheadChangeRecords
	^ detectBlock valueWithArguments: lookaheadChangeRecords asArray! !

!ChangeDetector methodsFor: 'detect changes' stamp: 'MGD 9/8/2019 15:15:05'!
detectChangeIn: aChangeList ifTrue: aBlock
	| changeRecordsToInspect |

	changeRecordsToInspect := self lookaheadRecordsFrom: aChangeList.
	
	(self canBeDetectedIn: changeRecordsToInspect) 
		ifTrue: [ 
			aChangeList removeAll: changeRecordsToInspect.
			aBlock value: (self newChangeFrom: changeRecordsToInspect) ]! !

!ChangeDetector methodsFor: 'detect changes' stamp: 'MGD 7/17/2019 10:13:12'!
lookaheadRecordsFrom: aChangeList
	| lookaheads |
	
	lookaheads := OrderedCollection new.
	
	1 to: lookahead do: [ :index | lookaheads add: (aChangeList at: index ifAbsent: [ nil ]) ].
	
	^ lookaheads 
! !

!ChangeDetector methodsFor: 'detect changes' stamp: 'MGD 7/17/2019 10:47:59'!
newChangeFrom: changeRecords
	(changeRecords size = 1) ifTrue: [ ^ changeClass newFor: changeRecords first ].
	(changeRecords size = 2) ifTrue: [ ^ changeClass newFor: changeRecords first and: changeRecords second ].! !

!ChangeDetector class methodsFor: 'instance creation' stamp: 'MGD 4/14/2020 18:20:45'!
for: aChangeClass withLookahead: lookaheadNumber detectsWhen: detectionBlock
	^ self new changeClass: aChangeClass; lookahead: lookaheadNumber; detectBlock: detectionBlock.
	! !

!ChangeLog methodsFor: 'initialization' stamp: 'MGD 7/12/2019 11:11:28'!
changeList: anOrderedCollection 
	changeList := anOrderedCollection .! !

!ChangeLog methodsFor: 'initialization' stamp: 'MGD 12/19/2019 19:43:54'!
initialize
	changeDetectors := OrderedCollection new.
	
	changeDetectors add: self testRenamedDetector.
	changeDetectors add: self testClassRemovedDetector.
	changeDetectors add: self classRemovedDetector.
	changeDetectors add: self classRenamedDetector.
	changeDetectors add: self testRemovedDetector.
	changeDetectors add: self modelMethodRemovedDetector.
	changeDetectors add: self newProductionClassDetector.
	changeDetectors add: self newProductionMethodDetector.
	changeDetectors add: self newTestDetector.
	changeDetectors add: self newTestClassDetector.
	changeDetectors add: self productionMethodChangedDetector.
	changeDetectors add: self testChangedDetector.
	changeDetectors add: self testFailedDetector.
	changeDetectors add: self testPassedDetector.
	changeDetectors add: self testUtilityChangeDetector.
	changeDetectors add: self unknownChangeDetector.	! !

!ChangeLog methodsFor: 'initialization' stamp: 'MGD 7/12/2019 11:12:49'!
inventory: aCodeInventory 
	inventory := aCodeInventory ! !

!ChangeLog methodsFor: 'accessing changes' stamp: 'MGD 4/14/2020 16:37:16'!
do: aBlockClosure 
	
	[ changeList isEmpty ] 		
	whileFalse: [ | nextChange |  
		nextChange := self nextChange.
		aBlockClosure value: nextChange ].! !

!ChangeLog methodsFor: 'accessing changes' stamp: 'MGD 4/14/2020 16:37:08'!
nextChange 

	changeDetectors do: [ :changeDetector | 
		changeDetector detectChangeIn: changeList ifTrue: [ :change | ^ change ] ].
	
	self error: 'No change detected'

	! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 4/9/2020 17:21:45'!
classRemovedDetector
	^ ChangeDetector for: ModelClassRemoved withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord isClassDeletion ]! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 12/19/2019 19:45:49'!
classRenamedDetector
	^ ChangeDetector for: ClassRenamed withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord changeType = #classRenamed ]! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 10/14/2019 13:12:59'!
modelMethodRemovedDetector
	^ ChangeDetector for: MethodRemoved withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord isMethodDeletion ]! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 8/16/2019 09:58:01'!
newProductionClassDetector
	^ ChangeDetector for: NewModelClass withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord changeType = #classDefinition and: [ aChangeRecord isTestClassChange not ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 6/1/2021 21:27:22'!
newProductionMethodDetector
	^ ChangeDetector for: NewModelMethod withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord changeType = #method 
		and: [ aChangeRecord isMethodDeletion not ] 
		and: [ (self isATestClass: aChangeRecord changeClassName) not ]
		and: [ aChangeRecord prior isNil ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 7/17/2019 11:46:15'!
newTestClassDetector
	^ ChangeDetector for: NewTestClass withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord changeType = #classDefinition and: [ aChangeRecord isTestClassChange ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'HAW 10/25/2022 16:28:25'!
newTestDetector
	^ ChangeDetector for: NewTest withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord changeType = #method 
		and: [ aChangeRecord isMethodDeletion not ] 
		and: [ aChangeRecord methodSelector isTestSelector ]
		and: [ aChangeRecord prior isNil ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'HAW 10/25/2022 16:28:34'!
productionMethodChangedDetector
	^ ChangeDetector for: ModelMethodChanged withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord changeType = #method 
		and: [ aChangeRecord isMethodDeletion not ] 
		and: [ (aChangeRecord methodSelector isTestSelector) not ]
		and: [ aChangeRecord prior notNil ]
		and: [ (self isATestClass: aChangeRecord changeClassName) not ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'HAW 10/25/2022 16:28:43'!
testChangedDetector
	^ ChangeDetector for: TestChanged withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord changeType = #method 
		and: [ self isATestClass: aChangeRecord changeClassName ]
		and: [ aChangeRecord methodSelector isTestSelector ]
		and: [ aChangeRecord prior isNil not ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 6/1/2021 21:28:56'!
testClassRemovedDetector
	^ ChangeDetector for: TestClassRemoved withLookahead: 1 detectsWhen: [ :aChangeRecord | 
		aChangeRecord isClassDeletion 
		and: [ self isATestClass: aChangeRecord changeClassName ] ]! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 6/1/2021 21:22:16'!
testFailedDetector
	^ ChangeDetector for: TestFailed withLookahead: 1 detectsWhen: [ :aChangeRecord | 
		aChangeRecord changeType = #testRun 
			and: [ aChangeRecord isFailure or: aChangeRecord isError ]
			and: [ self testIsTracked: aChangeRecord methodSelector class: aChangeRecord changeClassName ]]
		! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 6/1/2021 21:20:18'!
testPassedDetector
	^ ChangeDetector for: TestPassed withLookahead: 1 detectsWhen: [ :aChangeRecord | 
		aChangeRecord changeType = #testRun 
			and: [ aChangeRecord isPassed ]
			and: [ self testIsTracked: aChangeRecord methodSelector class: aChangeRecord changeClassName ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 6/1/2021 21:29:28'!
testRemovedDetector
	| isATest |
	isATest := [ :changeRecord | self testIsTracked: changeRecord methodSelector class: changeRecord changeClassName].
	
	^ ChangeDetector for: TestRemoved withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord isMethodDeletion and: [ isATest value: aChangeRecord ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'HAW 10/25/2022 16:28:56'!
testRenamedDetector
	| isANewTestChange isAMethodRemovedChange sameClassAndStamp testExists |

	isANewTestChange := [ :changeRecord | 
		changeRecord changeType = #method 
		and: [ changeRecord isMethodDeletion not ] 
		and: [ changeRecord methodSelector isTestSelector ]
		and: [ changeRecord prior isNil ]].
	isAMethodRemovedChange := [ :changeRecord | changeRecord isMethodDeletion].
	sameClassAndStamp := [ :previous :current | 
		previous changeClassName = current changeClassName
		and: [ previous stamp = current stamp ]].
	testExists := [ :changeRecord | self testIsTracked: changeRecord methodSelector class: changeRecord changeClassName].
			
	^ ChangeDetector for: TestRenamed withLookahead: 2 detectsWhen: [ :changeRecord1 :changeRecord2 |
		changeRecord2 notNil
		and: [ isANewTestChange value: changeRecord1 ]
		and: [ isAMethodRemovedChange value: changeRecord2 ]
		and: [ sameClassAndStamp value: changeRecord1 value: changeRecord2 ]
		and: [ testExists value: changeRecord2 ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'HAW 10/25/2022 16:29:07'!
testUtilityChangeDetector
	^ ChangeDetector for: TestUtilityChanged withLookahead: 1 detectsWhen: [ :aChangeRecord | aChangeRecord changeType = #method 
		and: [ self isATestClass: aChangeRecord changeClassName ]
		and: [ (aChangeRecord methodSelector isTestSelector) not ]]! !

!ChangeLog methodsFor: 'detectors' stamp: 'MGD 7/17/2019 11:55:23'!
unknownChangeDetector
	^ ChangeDetector for: UnknownChange withLookahead: 1 detectsWhen: [ :aChangeRecord | true ]! !

!ChangeLog methodsFor: 'test tracking' stamp: 'MGD 6/1/2021 21:27:12'!
isATestClass: className

	^ inventory hasATestClassNamed: className! !

!ChangeLog methodsFor: 'test tracking' stamp: 'MGD 6/1/2021 21:32:42'!
testIsTracked: selector class: className
	^ inventory hasTestWithSelector: selector andClass: className! !

!ChangeLog class methodsFor: 'instance creation' stamp: 'MGD 4/14/2020 15:54:50'!
from: aChangeCollection using: aTestInventory 
	^ self new changeList: aChangeCollection; inventory: aTestInventory! !

!TDDGuru methodsFor: 'initialization' stamp: 'MGD 4/7/2020 17:05:41'!
changesFile: aFileName 
	changesFile := aFileName.
	! !

!TDDGuru methodsFor: 'initialization' stamp: 'MGD 4/7/2020 17:11:58'!
changesFile: aFileName from: startPosition
	changesFileStartPosition := startPosition.
	self changesFile: aFileName.
	! !

!TDDGuru methodsFor: 'initialization' stamp: 'MGD 6/20/2019 20:45:32'!
initialState: aTDDState
	initialState := aTDDState! !

!TDDGuru methodsFor: 'initialization' stamp: 'MGD 10/14/2019 15:22:47'!
initialTestClasses: anArray 
	inventory := TestInventory withTestClasses: anArray ! !

!TDDGuru methodsFor: 'initialization' stamp: 'HAW 10/7/2025 09:48:11'!
initialize
	self initializeInventory.
	self initialState: NotStartedTDDState new.
	changesFileStartPosition := 0.
	startingPoint := 1.! !

!TDDGuru methodsFor: 'initialization' stamp: 'MGD 4/7/2020 17:06:02'!
initializeChangeLog
	| fileStream changeList file changes |
	
	changeLog := OrderedCollection new.
	file := changesFile asFileEntry.
	
	file exists ifTrue: [
		fileStream := file readStream.
		changeList := (ChangeList new scanFile: fileStream from: changesFileStartPosition to: fileStream size) changeList.
		changes := changeList copyFrom: startingPoint to: changeList size.
		changeLog := ChangeLog from: changes using: inventory.
	]
	
	
	! !

!TDDGuru methodsFor: 'initialization' stamp: 'MGD 11/7/2019 20:54:18'!
initializeInventory

	^ inventory := TestInventory new! !

!TDDGuru methodsFor: 'initialization' stamp: 'MGD 9/26/2019 20:45:11'!
startingFromChange: changeIndex 
	startingPoint := changeIndex ! !

!TDDGuru methodsFor: 'running' stamp: 'MGD 10/9/2019 16:05:45'!
analyzeChange: aChange	
	previousChange := currentChange.
	currentChange := aChange.

	currentChange isRecognized ifTrue: [
		analysisResult addChange: currentChange.
		currentChange reportChangeTo: self. ]! !

!TDDGuru methodsFor: 'running' stamp: 'MGD 11/7/2019 20:54:35'!
rerun
	self initializeInventory.
	self initializeChangeLog.
	^ self run
	! !

!TDDGuru methodsFor: 'running' stamp: 'MGD 11/26/2019 15:08:35'!
run	
	analysisResult := AnalysisResult new.
	
	self setState: initialState.
	
	self changeLog do: [ :change | self analyzeChange: change ].
	
	self currentState analysisFinished.
	
	^ analysisResult! !

!TDDGuru methodsFor: 'running' stamp: 'MGD 11/7/2019 20:33:56'!
showAnalysisResult	
	AnalysisResultWindow openFor: analysisResult analyzedBy: self.
! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 12/19/2019 20:09:11'!
classRenamedFrom: previousName to: currentName 
	inventory classRenamedFrom: previousName to: currentName.
	self currentState classRenamedFrom: previousName to: currentName ! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 10/14/2019 16:24:29'!
modelClassRemoved: className
	self currentState modelClassRemoved: className! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 3/18/2020 20:14:41'!
modelMethodChanged: aMethodReference
	self currentState modelMethodChanged: aMethodReference ! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 3/18/2020 20:13:00'!
modelMethodRemoved: aMethodReference
	self currentState modelMethodRemoved: aMethodReference.
! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:50'!
newModelClass: className
	self currentState newModelClass: className! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 4/2/2020 19:15:50'!
newModelMethod: aMethodReference
	self currentState newModelMethod: aMethodReference.
	! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 4/2/2020 19:47:57'!
newTest: aTestReference
	inventory newTest: aTestReference. 
	self currentState newTest: aTestReference! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 6/20/2019 16:49:46'!
newTestClass: className
	inventory newTestClass: className.
	self currentState newTestClass: className! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 3/18/2020 20:18:14'!
testChanged: aTestReference
	self currentState testChanged: aTestReference! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 10/14/2019 19:24:28'!
testClassRemoved: aSymbol 
	state testClassRemoved: aSymbol.
	inventory testClassRemoved: aSymbol.
	
	self noTestsLeft ifTrue: [ self currentState noMoreTests ]! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 3/18/2020 21:00:25'!
testFailed: aTestReference
	self currentState testFailed: aTestReference ! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 3/18/2020 21:00:56'!
testPassed: aTestReference
	self currentState testPassed: aTestReference! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 3/18/2020 20:19:21'!
testRemoved: aTestReference
	self currentState testRemoved: aTestReference.
	inventory testRemoved: aTestReference.
	
	self noTestsLeft ifTrue: [ self currentState noMoreTests ]! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 3/18/2020 20:54:12'!
testRenamedFrom: previousTestReference to: newTestReference
	inventory testRenamedFrom: previousTestReference to: newTestReference.
	state testRenamedFrom: previousTestReference to: newTestReference ! !

!TDDGuru methodsFor: 'events' stamp: 'MGD 3/18/2020 20:20:25'!
testUtilityChanged: aMethodReference
	! !

!TDDGuru methodsFor: 'state transitioning' stamp: 'MGD 3/19/2019 08:58:53'!
currentState
	^ state! !

!TDDGuru methodsFor: 'state transitioning' stamp: 'MGD 8/6/2019 12:09:45'!
setState: aTDDState 
	| previousState |
	previousState := state.
	state := aTDDState.
	state context: self.
	
	analysisResult stateTransitionFrom: previousState to: state.! !

!TDDGuru methodsFor: 'error handling' stamp: 'MGD 5/14/2019 10:48:55'!
reportError: description
	analysisResult addError: description in: currentChange.! !

!TDDGuru methodsFor: 'error handling' stamp: 'MGD 10/10/2019 19:03:59'!
reportErrorIn: aChange with: errorMessage
	analysisResult addError: errorMessage in: aChange.! !

!TDDGuru methodsFor: 'error handling' stamp: 'MGD 10/9/2019 16:05:08'!
reportErrorInPreviousChange: description
	analysisResult addError: description in: previousChange.! !

!TDDGuru methodsFor: 'accessing' stamp: 'MGD 6/20/2019 16:51:00'!
allTests
	^ inventory allTests ! !

!TDDGuru methodsFor: 'accessing' stamp: 'MGD 11/7/2019 19:10:38'!
analysisResult
	^ analysisResult ! !

!TDDGuru methodsFor: 'accessing' stamp: 'MGD 12/1/2018 16:53:36'!
changeLog
	changeLog ifNil: [
		self initializeChangeLog
	].

	^ changeLog! !

!TDDGuru methodsFor: 'accessing' stamp: 'MGD 10/10/2019 19:11:19'!
currentChange
	^currentChange! !

!TDDGuru methodsFor: 'private' stamp: 'MGD 3/17/2020 19:49:42'!
methodReferenceWith: selector andClass: className
	^ UninstalledMethodReference selector: selector class: className sourceCode: currentChange code overrides: currentChange overridesASuperclassMethod.! !

!TDDGuru methodsFor: 'private' stamp: 'MGD 10/14/2019 19:21:17'!
noTestsLeft
	^ inventory allTests isEmpty! !

!TDDGuru class methodsFor: 'instance creation' stamp: 'MGD 12/1/2018 10:55:10'!
on: aFileName 
	^ self new changesFile: aFileName.! !

!TDDGuru class methodsFor: 'instance creation' stamp: 'MGD 4/7/2020 17:03:47'!
on: aFileName from: startPosition
	^ self new changesFile: aFileName from: startPosition.! !

!TDDGuru class methodsFor: 'instance creation' stamp: 'MGD 6/27/2019 11:07:02'!
on: aString initialTestClasses: anArray 
	^ self new changesFile: aString; initialTestClasses: anArray.! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 3/3/2020 17:03:50'!
classRemovedBeforeRunningTests: className 
	^ 'Class ', className, ' was removed before running the tests first'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/10/2019 17:02:06'!
methodAddedBeforeTest: aSelector class: className 
	^ 'Method ', (self printMethod: aSelector class: className), ' was added before writing a test'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/10/2019 17:02:38'!
methodChangedBeforeTest: aSelector class: className 
	^ 'Method ', (self printMethod: aSelector class: className), ' was changed before writing a test'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 3/3/2020 17:01:24'!
methodRemovedBeforeRunningTests: methodSelector class: className 
	^ (self printMethod: methodSelector class: className), ' was removed before running the tests first'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/14/2019 12:15:44'!
methodRemovedWhileWritingATest: aSymbol class: aSymbol2 
	^ (self printMethod: aSymbol class: aSymbol2), ' was removed while writing a test'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 3/3/2020 18:31:09'!
modelMethodAddedBeforeRunningTests: aSymbol class: aSymbol2 
	^ 'Model method ', (self printMethod: aSymbol class: aSymbol2), ' was added before running the tests first'.! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 3/3/2020 18:31:06'!
modelMethodChangedBeforeRunningTests: aSelector class: className 
	^ 'Model method ', (self printMethod: aSelector class: className), ' was changed before running the tests first'.! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 11/12/2019 11:09:52'!
modelMethodWasNotUsedDuringRefactor: aSymbol class: aSymbol2 
	^ (self printMethod: aSymbol class: aSymbol2), ' was added but never used during Refactor. Probably not doing TDD.'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/10/2019 17:08:39'!
printMethod: selector class: className
	^ className, '>>', selector ! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/10/2019 17:05:16'!
testAddedBeforeRunningTheRestOfTheTests: aSymbol class: className
	^ 'Test ', (self printMethod: aSymbol class: className), ' was added without running the rest of the tests first'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/10/2019 17:04:25'!
testAddedErrorMessage: aTestSelector class: className
	^ 'Test ', (self printMethod: aTestSelector class: className), ' was added in Red'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/10/2019 17:00:03'!
testAddedWhileWritingAnother: aSymbol class: className
	^ (self printMethod: aSymbol class: className), ' was added while writing another test'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/14/2019 14:56:57'!
testChangedWhileInRed: aSymbol class: aSymbol2 
	self shouldBeImplemented.! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/10/2019 17:07:22'!
testChangedWhileThisTestWasBeingWritten: testSelector in: className 
	^ (self printMethod: testSelector class: className), ' was changed while other test was being written'.! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/14/2019 16:12:25'!
testClassRemovedWhileInRed: aSymbol 
	^ 'Test class ', aSymbol, ' was removed while in Red'.! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/10/2019 17:07:57'!
testDidNotFail: testSelector class: className 
	^ (self printMethod: testSelector class: className), ' passed but it should have failed'! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/14/2019 15:46:30'!
testRemovedWhileInRed: aSymbol class: aSymbol2 
	^ (self printMethod: aSymbol class: aSymbol2), ' was removed while in Red'.! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/14/2019 11:18:08'!
testRenamedBeforeRunningTheTests: aSymbol class: aSymbol2 
	^ (self printMethod: aSymbol class: aSymbol2), ' was renamed before running the tests'.! !

!TDDGuru class methodsFor: 'error messages' stamp: 'MGD 10/10/2019 16:57:55'!
testUnexpectedlyFailedErrorMessage: aSymbol class: className
	| testAsString |
	testAsString := self printMethod: aSymbol class: className.
	^ 'Test ', testAsString,' had passed and failed unexpectedly'! !

!TDDState methodsFor: 'accessing' stamp: 'MGD 8/1/2019 17:21:26'!
isCorrect
	self subclassResponsibility ! !

!TDDState methodsFor: 'accessing' stamp: 'MGD 10/12/2019 12:43:32'!
name
	^ self className ! !

!TDDState methodsFor: 'events' stamp: 'MGD 11/26/2019 15:09:04'!
analysisFinished
! !

!TDDState methodsFor: 'events' stamp: 'MGD 12/19/2019 20:31:51'!
classRenamedFrom: aSymbol to: aSymbol2
	! !

!TDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 16:24:29'!
modelClassRemoved: className
	self subclassResponsibility! !

!TDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:33'!
modelMethodChanged: methodSelector
	self subclassResponsibility! !

!TDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:24:44'!
modelMethodRemoved: aSymbol
	self subclassResponsibility! !

!TDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:50'!
newModelClass: className
	self subclassResponsibility! !

!TDDState methodsFor: 'events' stamp: 'MGD 4/2/2020 19:15:50'!
newModelMethod: methodSelector
	self subclassResponsibility! !

!TDDState methodsFor: 'events' stamp: 'MGD 4/2/2020 19:47:57'!
newTest: methodSelector
	self subclassResponsibility! !

!TDDState methodsFor: 'events' stamp: 'MGD 3/19/2019 09:44:50'!
newTestClass: className
	self subclassResponsibility! !

!TDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:47:39'!
noMoreTests
	self transitionTo: GreenTDDState new! !

!TDDState methodsFor: 'events' stamp: 'MGD 5/24/2019 11:38:23'!
testChanged: methodSelector
	self subclassResponsibility! !

!TDDState methodsFor: 'events' stamp: 'MGD 4/6/2019 18:20:38'!
testFailed: methodSelector
	self subclassResponsibility! !

!TDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:47:39'!
testPassed: aTestReference 
	passedTests add: aTestReference.
	
	self allTestsPassed ifTrue: [ self transitionTo: GreenTDDState new ]! !

!TDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 19:14:25'!
testRemoved: methodSelector
	self subclassResponsibility ! !

!TDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 11:25:12'!
testRenamedFrom: fromMethodReference to: toMethodReference 
	self subclassResponsibility! !

!TDDState methodsFor: 'initialization' stamp: 'MGD 3/19/2019 09:45:31'!
context: aContext
	context := aContext! !

!TDDState methodsFor: 'initialization' stamp: 'MGD 10/15/2019 16:41:50'!
initialize
	passedTests := Set new.! !

!TDDState methodsFor: 'comparing' stamp: 'MGD 3/21/2019 07:22:29'!
= anObject
	^ self class = anObject! !

!TDDState methodsFor: 'comparing' stamp: 'MGD 10/12/2019 12:43:12'!
hash
	^ super hash bitXor: self name hash! !

!TDDState methodsFor: 'state transitioning' stamp: 'MGD 5/30/2019 18:35:22'!
reportError: aString 
	context reportError: aString! !

!TDDState methodsFor: 'state transitioning' stamp: 'MGD 5/30/2019 18:40:54'!
reportError: errorDescription andTransitionTo: newState
	self reportError: errorDescription.
	self transitionTo: newState.! !

!TDDState methodsFor: 'state transitioning' stamp: 'MGD 10/10/2019 19:12:21'!
reportErrorIn: aChange with: errorMessage
	context reportErrorIn: aChange with: errorMessage! !

!TDDState methodsFor: 'state transitioning' stamp: 'MGD 6/13/2019 21:32:59'!
transitionTo: newState 
	context setState: newState.! !

!TDDState methodsFor: 'printing' stamp: 'MGD 6/21/2019 07:48:31'!
printString
	self subclassResponsibility ! !

!TDDState methodsFor: 'private' stamp: 'MGD 8/6/2019 11:53:38'!
allTests
	^ context allTests ! !

!TDDState methodsFor: 'private' stamp: 'MGD 10/10/2019 16:48:52'!
allTestsPassed
	^ passedTests = self allTests! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
classRenamedFrom: aSymbol to: aSymbol2 
	self transitionTo: RefactorTDDState new! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
modelClassRemoved: aSymbol 
	self transitionTo: RefactorTDDState new! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
modelMethodChanged: aMethodReference 
	self transitionTo: (RefactorTDDState modelMethodChanged: aMethodReference).! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
modelMethodRemoved: aSymbol 
	self transitionTo: RefactorTDDState new! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
newModelClass: aSymbol 
	self transitionTo: RefactorTDDState new! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
newModelMethod: aMethodReference 
	self transitionTo: (RefactorTDDState newModelMethod: aMethodReference)! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:32'!
newTest: aTestReference 
	self transitionTo: (WritingAFailingTestTDDState currentTest: aTestReference).! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
newTestClass: aSymbol 
	self transitionTo: RefactorTDDState new! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
testChanged: aSymbol 
	self transitionTo: RefactorTDDState new! !

!GreenTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 16:24:29'!
testClassRemoved: aSymbol 
	self modelClassRemoved: aSymbol! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:17'!
testFailed: aTestReference 
	self reportError: (TDDGuru testUnexpectedlyFailedErrorMessage: aTestReference selector class: aTestReference methodClass) andTransitionTo: RedTDDState new.! !

!GreenTDDState methodsFor: 'events' stamp: 'MGD 6/14/2019 13:04:09'!
testPassed: aSymbol 
	! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
testRemoved: aSymbol 
	self transitionTo: RefactorTDDState new! !

!GreenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:24'!
testRenamedFrom: aSymbol to: aSymbol2 
	self transitionTo: RefactorTDDState new! !

!GreenTDDState methodsFor: 'printing' stamp: 'MGD 6/21/2019 07:49:05'!
printString
	^ 'Green'! !

!GreenTDDState methodsFor: 'accessing' stamp: 'MGD 8/1/2019 17:23:55'!
isCorrect
	^ true! !

!MoreThanOneTestWrittenTDDState methodsFor: 'initialization' stamp: 'MGD 10/10/2019 19:10:16'!
context: aContext
	super context: aContext.
	testAddedChange := aContext currentChange.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'initialization' stamp: 'MGD 10/15/2019 16:05:09'!
firstTest: aMethodReference secondTest: anotherMethodReference
	firstTest := aMethodReference.
	secondTest := anotherMethodReference.
	isCorrect := true.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 16:24:28'!
modelClassRemoved: aSymbol 
	self reportErrorWhenSecondTestWasAdded.
	self transitionTo: NotDoingTDD new.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:33'!
modelMethodChanged: anUninstalledMethodReference 
	self reportErrorWhenSecondTestWasAdded.
	self transitionTo: NotDoingTDD new.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:24:44'!
modelMethodRemoved: aMethodReference 
	self reportErrorWhenSecondTestWasAdded.
	self transitionTo: NotDoingTDD new! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:50'!
newModelClass: aSymbol 
	self reportErrorWhenSecondTestWasAdded.
	self transitionTo: NotDoingTDD new.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 4/2/2020 19:15:50'!
newModelMethod: anUninstalledMethodReference 
	self reportErrorWhenSecondTestWasAdded.
	self transitionTo: NotDoingTDD new.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 4/2/2020 19:47:57'!
newTest: anUninstalledMethodReference 
	self reportErrorWhenSecondTestWasAdded.
	self transitionTo: NotDoingTDD new.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 10/9/2019 17:15:04'!
newTestClass: aSymbol 
	self reportErrorWhenSecondTestWasAdded.
	self transitionTo: NotDoingTDD new.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 10/9/2019 17:15:27'!
testChanged: anUninstalledMethodReference 
	(self isOneOfTheCurrentTests: anUninstalledMethodReference) ifFalse: [ 
		self reportErrorWhenSecondTestWasAdded.
		self transitionTo: NotDoingTDD new ]! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 16:24:29'!
testClassRemoved: aSymbol 
	self modelClassRemoved: aSymbol! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:17'!
testFailed: anUninstalledMethodReference 
	self reportErrorWhenSecondTestWasAdded.
	self transitionTo: RedTDDState new.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 10/10/2019 19:06:31'!
testPassed: aTestReference 
	self reportErrorWhenSecondTestWasAdded.
	self testDidNotFailErrorInCurrentTest: aTestReference.
	super testPassed: aTestReference.! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:32'!
testRemoved: aMethodReference 
	| remainingTest |
	
	(self isOneOfTheCurrentTests: aMethodReference)
		ifTrue: [ 
			remainingTest := self remainingTest: aMethodReference.
			self transitionTo: (WritingAFailingTestTDDState currentTest: remainingTest) ]
		ifFalse: [ 
			self reportErrorWhenSecondTestWasAdded.
			self transitionTo: NotDoingTDD new ]! !

!MoreThanOneTestWrittenTDDState methodsFor: 'events' stamp: 'MGD 10/10/2019 18:49:53'!
testRenamedFrom: previousTestReference to: currentTestReference 
	(self isOneOfTheCurrentTests: previousTestReference)
		ifTrue: [ self renameTestFrom: previousTestReference to: currentTestReference ]
		ifFalse: [ 
			self reportErrorWhenSecondTestWasAdded.
			self transitionTo: NotDoingTDD new ]! !

!MoreThanOneTestWrittenTDDState methodsFor: 'private' stamp: 'MGD 10/9/2019 16:09:00'!
isOneOfTheCurrentTests: aMethodReference 
	^ firstTest = aMethodReference or: [ secondTest  = aMethodReference ]! !

!MoreThanOneTestWrittenTDDState methodsFor: 'private' stamp: 'MGD 10/9/2019 15:57:20'!
remainingTest: anUninstalledMethodReference 
	firstTest = anUninstalledMethodReference ifTrue: [ ^ secondTest ].
	secondTest = anUninstalledMethodReference ifTrue: [ ^ firstTest ].
	
	self error: 'Test is not one of the state tests'
	! !

!MoreThanOneTestWrittenTDDState methodsFor: 'private' stamp: 'MGD 10/10/2019 18:50:37'!
renameTestFrom: previousTestReference to: currentTestReference
	firstTest = previousTestReference ifTrue: [ firstTest = currentTestReference ].
	secondTest = previousTestReference ifTrue: [ secondTest = currentTestReference ].! !

!MoreThanOneTestWrittenTDDState methodsFor: 'private' stamp: 'MGD 10/15/2019 16:07:05'!
reportErrorWhenSecondTestWasAdded 
	| errorMessage |
	
	isCorrect := false.
	errorMessage := TDDGuru testAddedWhileWritingAnother: secondTest selector class: secondTest methodClass.
	self reportErrorIn: testAddedChange with: errorMessage.
! !

!MoreThanOneTestWrittenTDDState methodsFor: 'private' stamp: 'MGD 10/10/2019 20:16:08'!
testDidNotFailErrorInCurrentTest: aTestReference
	(self isOneOfTheCurrentTests: aTestReference) ifTrue: [ 
		self reportError: (TDDGuru testDidNotFail: aTestReference selector class: aTestReference methodClass)
	].! !

!MoreThanOneTestWrittenTDDState methodsFor: 'printing' stamp: 'MGD 11/5/2019 14:18:23'!
printString
	^ 'Writing a failing test - More than one test written'! !

!MoreThanOneTestWrittenTDDState methodsFor: 'accessing' stamp: 'MGD 10/15/2019 16:05:23'!
isCorrect
	^ isCorrect ! !

!MoreThanOneTestWrittenTDDState class methodsFor: 'instance creation' stamp: 'MGD 10/9/2019 15:53:36'!
with: anUninstalledMethodReference and: anUninstalledMethodReference2 
	^ self new firstTest: anUninstalledMethodReference secondTest: anUninstalledMethodReference2! !

!NotDoingTDD methodsFor: 'printing' stamp: 'MGD 6/21/2019 07:49:29'!
printString
	^ 'Not doing TDD'! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 10/14/2019 16:24:28'!
modelClassRemoved: className
	! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:33'!
modelMethodChanged: aSelector
	! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 10/14/2019 14:24:44'!
modelMethodRemoved: aSymbol
! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:50'!
newModelClass: className
	! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 4/2/2020 19:15:50'!
newModelMethod: aSymbol 
	! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 4/2/2020 19:47:57'!
newTest: methodSelector
	! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 8/1/2019 09:30:40'!
newTestClass: className
	! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 7/22/2019 15:03:54'!
testChanged: aSymbol 
	! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 10/14/2019 19:35:33'!
testClassRemoved: aSymbol 
	! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 8/1/2019 11:01:15'!
testFailed: aTestSelector
	! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 10/14/2019 14:16:15'!
testRemoved: aMethodReference
! !

!NotDoingTDD methodsFor: 'events' stamp: 'MGD 8/6/2019 11:54:54'!
testRenamedFrom: aTestSelector to: aTestSelector2
! !

!NotDoingTDD methodsFor: 'accessing' stamp: 'MGD 8/1/2019 17:25:54'!
isCorrect
	^ false! !

!NotStartedTDDState methodsFor: 'events' stamp: 'MGD 3/3/2020 17:03:22'!
modelClassRemoved: className
	self reportError: (TDDGuru classRemovedBeforeRunningTests: className) andTransitionTo: NotDoingTDD new.! !

!NotStartedTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:33'!
modelMethodChanged: methodReference
	self reportError: (TDDGuru methodChangedBeforeTest: methodReference selector class: methodReference methodClass) andTransitionTo: NotDoingTDD new.! !

!NotStartedTDDState methodsFor: 'events' stamp: 'MGD 3/3/2020 17:01:24'!
modelMethodRemoved: methodReference 
	self reportError: (TDDGuru methodRemovedBeforeRunningTests: methodReference selector class: methodReference methodClass) andTransitionTo: NotDoingTDD new.! !

!NotStartedTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:32'!
newModelClass: className
	self transitionTo: WritingAFailingTestTDDState new.! !

!NotStartedTDDState methodsFor: 'events' stamp: 'MGD 4/2/2020 19:15:50'!
newModelMethod: methodReference 
	self reportError: (TDDGuru methodAddedBeforeTest: methodReference selector class: methodReference methodClass) andTransitionTo: NotDoingTDD new.! !

!NotStartedTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:32'!
newTest: testReference
	self transitionTo: (WritingAFailingTestTDDState currentTest: testReference).! !

!NotStartedTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:32'!
newTestClass: className
	context setState: WritingAFailingTestTDDState new.! !

!NotStartedTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:32'!
testChanged: aTestReference
	self transitionTo: (WritingAFailingTestTDDState currentTest: aTestReference).! !

!NotStartedTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 16:24:29'!
testClassRemoved: className
	self modelClassRemoved: className ! !

!NotStartedTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:17'!
testFailed: aSymbol 
	self transitionTo: RedTDDState new.! !

!NotStartedTDDState methodsFor: 'events' stamp: 'MGD 3/3/2020 17:01:24'!
testRemoved: methodReference 
	self reportError: (TDDGuru methodRemovedBeforeRunningTests: methodReference selector class: methodReference methodClass) andTransitionTo: NotDoingTDD new.! !

!NotStartedTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 11:19:39'!
testRenamedFrom: fromMethodReference to: toMethodReference 
	| errorMessage |
	
	errorMessage := TDDGuru testRenamedBeforeRunningTheTests: fromMethodReference selector class: toMethodReference methodClass.
	self reportError: errorMessage andTransitionTo: NotDoingTDD new.! !

!NotStartedTDDState methodsFor: 'printing' stamp: 'MGD 6/21/2019 07:50:00'!
printString
	^ 'Started'! !

!NotStartedTDDState methodsFor: 'accessing' stamp: 'MGD 8/1/2019 17:24:38'!
isCorrect
	^ true! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 16:24:29'!
modelClassRemoved: aSymbol 
	! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:33'!
modelMethodChanged: aSymbol 
	! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:24:44'!
modelMethodRemoved: anUninstalledMethodReference 
	! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:50'!
newModelClass: aSymbol 
	! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 4/2/2020 19:15:50'!
newModelMethod: aSymbol 
	! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 4/16/2020 18:51:37'!
newTest: aTestReference
	| errorMessage |
	
	errorMessage := TDDGuru testAddedErrorMessage: aTestReference selector class: aTestReference methodClass.
	self reportError: errorMessage andTransitionTo: NotDoingTDD new.! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 11/2/2019 16:44:33'!
newTestClass: aSymbol 
	! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:59:17'!
testChanged: aTestReference 
	! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 3/8/2020 14:49:54'!
testClassRemoved: aSymbol 
	| errorMessage |
	errorMessage := TDDGuru testClassRemovedWhileInRed: aSymbol.
	self reportError: errorMessage andTransitionTo: NotDoingTDD new.
	! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 6/14/2019 09:19:31'!
testFailed: aSymbol 
	passedTests remove: aSymbol ifAbsent: [].! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 3/8/2020 14:48:08'!
testRemoved: anUninstalledMethodReference 
	self reportError: (TDDGuru testRemovedWhileInRed: anUninstalledMethodReference selector class: anUninstalledMethodReference methodClass) andTransitionTo: NotDoingTDD new.! !

!RedTDDState methodsFor: 'events' stamp: 'MGD 9/5/2019 08:31:07'!
testRenamedFrom: previousTestReference to: currentTestReference
! !

!RedTDDState methodsFor: 'printing' stamp: 'MGD 6/21/2019 07:50:18'!
printString
	^ 'Red'! !

!RedTDDState methodsFor: 'accessing' stamp: 'MGD 8/1/2019 17:25:18'!
isCorrect
	^ true! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 11/26/2019 15:09:33'!
analysisFinished
	self checkIfItWasAValidRefactor ! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 16:24:29'!
modelClassRemoved: aSymbol 
	! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 6/9/2021 19:49:44'!
modelMethodChanged: aMethodReference 
	self markAsChanged: aMethodReference ! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 6/9/2021 19:51:23'!
modelMethodRemoved: aMethodReference 
	self unmarkAsNew: aMethodReference.! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:50'!
newModelClass: aSymbol 
	! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 6/9/2021 19:50:10'!
newModelMethod: aMethodReference 
	self markAsNew: aMethodReference ! !

!RefactorTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:32'!
newTest: aTestReference 
	| errorMessage |
	
	errorMessage := TDDGuru testAddedBeforeRunningTheRestOfTheTests: aTestReference selector class: aTestReference methodClass.
	self reportError: errorMessage andTransitionTo: (WritingAFailingTestTDDState currentTest: aTestReference).! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 8/15/2019 17:20:50'!
newTestClass: aSymbol 
	! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 6/9/2021 19:49:44'!
testChanged: aTestReference
	self markAsChanged: aTestReference! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 16:22:46'!
testClassRemoved: aSymbol 
	! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 8/15/2019 18:39:20'!
testFailed: aSymbol 
	passedTests remove: aSymbol ifAbsent: [].! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 19:14:40'!
testRemoved: methodSelector! !

!RefactorTDDState methodsFor: 'events' stamp: 'MGD 8/15/2019 17:08:12'!
testRenamedFrom: aSymbol to: aSymbol2 
	! !

!RefactorTDDState methodsFor: 'printing' stamp: 'MGD 8/16/2019 08:26:32'!
isCorrect
	^ true! !

!RefactorTDDState methodsFor: 'printing' stamp: 'MGD 8/16/2019 08:25:44'!
printString
	^ 'Refactor'! !

!RefactorTDDState methodsFor: 'initialization' stamp: 'MGD 6/9/2021 19:37:59'!
initialize
	newMethods := Set new.
	changedMethods := Set new.
	
	super initialize ! !

!RefactorTDDState methodsFor: 'state transitioning' stamp: 'MGD 3/15/2020 14:37:27'!
transitionTo: aTDDState
	self checkIfItWasAValidRefactor.
	super transitionTo: aTDDState.	! !

!RefactorTDDState methodsFor: 'valid refactor' stamp: 'MGD 6/9/2021 19:37:59'!
checkIfItWasAValidRefactor
	newMethods do: [ :aMethodReference | 
		(self isUsed: aMethodReference) ifFalse: [ self methodWasNotUsedError: aMethodReference ] ]! !

!RefactorTDDState methodsFor: 'valid refactor' stamp: 'MGD 3/17/2020 19:44:34'!
isUsed: aMethodReference

	^ (self overridesASuperclassMethod: aMethodReference) or: [self isUsedInOneOfTheChangedMethods: aMethodReference ]! !

!RefactorTDDState methodsFor: 'valid refactor' stamp: 'MGD 6/9/2021 19:37:50'!
isUsedInOneOfTheChangedMethods: aMethodReference
	^ changedMethods anySatisfy: [ :aChangedMethod | aChangedMethod sendsMessageWithSelector: aMethodReference selector ].! !

!RefactorTDDState methodsFor: 'valid refactor' stamp: 'MGD 6/9/2021 19:49:44'!
markAsChanged: aMethodReference

	changedMethods remove: aMethodReference ifAbsent: [].
	changedMethods add: aMethodReference! !

!RefactorTDDState methodsFor: 'valid refactor' stamp: 'MGD 6/9/2021 19:50:10'!
markAsNew: aMethodReference

	newMethods remove: aMethodReference ifAbsent: [].
	newMethods add: aMethodReference! !

!RefactorTDDState methodsFor: 'valid refactor' stamp: 'MGD 11/20/2019 19:14:22'!
methodWasNotUsedError: aMethodReference
	| changeWhenMethodWasAdded errorMessage |
	changeWhenMethodWasAdded := context analysisResult changeWhenMethodWasAdded: aMethodReference selector in: aMethodReference methodClass.
	errorMessage := TDDGuru modelMethodWasNotUsedDuringRefactor: aMethodReference selector class: aMethodReference methodClass.
	
	self reportErrorIn: changeWhenMethodWasAdded with: errorMessage ! !

!RefactorTDDState methodsFor: 'valid refactor' stamp: 'MGD 3/17/2020 19:45:12'!
overridesASuperclassMethod: aMethodReference

	^ aMethodReference overridesASuperclassMethod! !

!RefactorTDDState methodsFor: 'valid refactor' stamp: 'MGD 6/9/2021 19:53:00'!
unmarkAsNew: aMethodReference

	newMethods remove: aMethodReference ifAbsent: []! !

!RefactorTDDState class methodsFor: 'instance creation' stamp: 'MGD 11/20/2019 17:48:01'!
modelMethodChanged: aMethodReference
	^ self new modelMethodChanged: aMethodReference ! !

!RefactorTDDState class methodsFor: 'instance creation' stamp: 'MGD 4/2/2020 19:15:50'!
newModelMethod: aMethodReference
	^ self new newModelMethod: aMethodReference ! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'MGD 3/7/2020 17:24:44'!
modelClassRemoved: aSymbol 
	self reportError: (TDDGuru classRemovedBeforeRunningTests: aSymbol) andTransitionTo: NotDoingTDD new.! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'MGD 3/7/2020 17:02:23'!
modelMethodChanged: methodReference 
	| errorMessage |
	errorMessage := TDDGuru methodChangedBeforeTest: methodReference selector class: methodReference methodClass.
	
	self currentTestIsDefined ifTrue: [ 
		errorMessage := TDDGuru modelMethodChangedBeforeRunningTests: methodReference selector class: methodReference methodClass ].
	
	self reportError: errorMessage andTransitionTo: NotDoingTDD new ! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:24:44'!
modelMethodRemoved: aMethodReference 
	| errorMessage |
	
	errorMessage := TDDGuru methodRemovedWhileWritingATest: aMethodReference selector class: aMethodReference methodClass.
	self reportError: errorMessage andTransitionTo: NotDoingTDD new
	! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'MGD 10/14/2019 14:25:50'!
newModelClass: className
! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'MGD 4/2/2020 19:15:50'!
newModelMethod: methodReference 
	| errorMessage |
	
	errorMessage := TDDGuru methodAddedBeforeTest: methodReference selector class: methodReference methodClass.
	
	self currentTestIsDefined ifTrue: [ 
		errorMessage := TDDGuru modelMethodAddedBeforeRunningTests: methodReference selector class: methodReference methodClass ].
	
	self reportError: errorMessage andTransitionTo: NotDoingTDD new.
! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:47:49'!
newTest: aTestReference 
	self currentTestIsDefined ifTrue: [ self transitionTo: (MoreThanOneTestWrittenTDDState with: test and: aTestReference) ].
	
	self currentTest: aTestReference 
! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'MGD 5/2/2019 20:23:47'!
newTestClass: aSymbol 
	! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'MGD 10/10/2019 20:16:08'!
testChanged: aTestReference
	 
	| errorMessage |
	aTestReference ~= self currentTest ifTrue: [ 
		errorMessage := TDDGuru testChangedWhileThisTestWasBeingWritten: aTestReference selector in: aTestReference methodClass.
		self reportError: errorMessage andTransitionTo: NotDoingTDD new ]! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'MGD 3/7/2020 17:31:52'!
testClassRemoved: aSymbol 
	self modelClassRemoved: aSymbol! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:48:17'!
testFailed: aSymbol 
	self transitionTo: RedTDDState new.! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:47:39'!
testPassed: aTestReference 
	| errorMessage |
	
	aTestReference = test ifTrue: [
		errorMessage := TDDGuru testDidNotFail: aTestReference selector class: aTestReference methodClass.
		self reportError: errorMessage andTransitionTo: GreenTDDState new ]! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'HAW 10/7/2025 09:47:39'!
testRemoved: aMethodReference 
	| errorMessage |
	
	test = aMethodReference ifTrue: [ ^ self transitionTo: GreenTDDState new ].
	
	errorMessage := TDDGuru methodRemovedWhileWritingATest: aMethodReference selector class: aMethodReference methodClass.
	self reportError: errorMessage.

	! !

!WritingAFailingTestTDDState methodsFor: 'events' stamp: 'MGD 10/2/2019 21:36:54'!
testRenamedFrom: previousTestReference to: currentTestReference 
	test = previousTestReference ifTrue: [ self currentTest: currentTestReference ]! !

!WritingAFailingTestTDDState methodsFor: 'printing' stamp: 'MGD 11/5/2019 14:17:42'!
printString
	^ 'Writing a failing test'! !

!WritingAFailingTestTDDState methodsFor: 'accessing' stamp: 'MGD 9/3/2019 10:34:31'!
currentTest
	^ test! !

!WritingAFailingTestTDDState methodsFor: 'accessing' stamp: 'MGD 8/1/2019 17:25:40'!
isCorrect
	^ true! !

!WritingAFailingTestTDDState methodsFor: 'initialization' stamp: 'MGD 9/3/2019 10:33:36'!
currentTest: aSelector
	test := aSelector ! !

!WritingAFailingTestTDDState methodsFor: 'private' stamp: 'MGD 3/3/2020 18:56:15'!
currentTestIsDefined
	^ test isNil not! !

!WritingAFailingTestTDDState class methodsFor: 'instance creation' stamp: 'MGD 9/3/2019 10:36:10'!
currentTest: aTestReference
	^ self new currentTest: aTestReference ! !

!TestInventory methodsFor: 'entries' stamp: 'MGD 12/19/2019 20:20:35'!
classRenamedFrom: previousClassName to: currentClassName 
	(testClasses includes: previousClassName) ifTrue: [
		testClasses remove: previousClassName.
		testClasses add: currentClassName.
		self replaceTestOf: previousClassName with: currentClassName ]
	! !

!TestInventory methodsFor: 'entries' stamp: 'MGD 9/3/2019 10:56:39'!
newTest: aTestReference	
	tests add: aTestReference.
! !

!TestInventory methodsFor: 'entries' stamp: 'MGD 10/15/2019 17:47:23'!
newTestClass: aSymbol 
	testClasses add: aSymbol! !

!TestInventory methodsFor: 'entries' stamp: 'MGD 10/14/2019 16:28:01'!
testClassRemoved: className 
	(testClasses includes: className) ifTrue: [ 
		self removeTestsOf: className.
		testClasses remove: className.
	].! !

!TestInventory methodsFor: 'entries' stamp: 'MGD 10/14/2019 14:12:54'!
testRemoved: aMethodReference 
	tests remove: aMethodReference ifAbsent: [].! !

!TestInventory methodsFor: 'entries' stamp: 'HAW 9/20/2025 18:09:15'!
testRenamedFrom: previousTestReference to: currentTestReference
	tests remove: previousTestReference.
	tests add: currentTestReference ! !

!TestInventory methodsFor: 'initialization' stamp: 'MGD 6/14/2019 07:24:36'!
initialize
	testClasses := Set new.
	tests := Set new.! !

!TestInventory methodsFor: 'initialization' stamp: 'MGD 9/5/2019 09:02:02'!
initializeTestsOf: aCollectionOfTestClasses
	aCollectionOfTestClasses do: [ :testClass | self addTestsOf: testClass ].! !

!TestInventory methodsFor: 'initialization' stamp: 'MGD 7/20/2019 17:24:18'!
testClasses: aCollectionOfTestClasses
	| classNames |
	classNames := aCollectionOfTestClasses collect: [ :aClass | aClass name ].
	testClasses := Set withAll: classNames.
		
	self initializeTestsOf: aCollectionOfTestClasses.! !

!TestInventory methodsFor: 'querying' stamp: 'MGD 6/14/2019 07:24:56'!
allTests
	^ tests! !

!TestInventory methodsFor: 'querying' stamp: 'MGD 7/20/2019 16:54:46'!
hasATestClassNamed: aSymbol
	^ testClasses includes: aSymbol! !

!TestInventory methodsFor: 'querying' stamp: 'MGD 11/15/2019 09:17:15'!
hasTestWithSelector: aSymbol andClass: className
	^ tests includes: (UninstalledMethodReference selector: aSymbol class: className)! !

!TestInventory methodsFor: 'private' stamp: 'MGD 10/3/2019 18:21:46'!
addTestsOf: aClass 
	| testReference |
	
	aClass allTestSelectors do: [ :selector |
		testReference := UninstalledMethodReference selector: selector class: aClass name.
		self newTest: testReference
	]! !

!TestInventory methodsFor: 'private' stamp: 'MGD 10/10/2019 20:16:08'!
removeTestsOf: className 
	tests select: [ :testReference | testReference methodClass = className ] thenDo: [ :testReference | tests remove: testReference ].
	! !

!TestInventory methodsFor: 'private' stamp: 'MGD 12/19/2019 20:29:46'!
replaceTestOf: previousClassName with: currentClassName
	tests 
		select: [ :testReference | testReference methodClass = previousClassName ] 
		thenDo: [ :testReference | 
			tests remove: testReference.
			tests add: (testReference copyWith: currentClassName) ].! !

!TestInventory class methodsFor: 'as yet unclassified' stamp: 'MGD 6/27/2019 11:23:34'!
withTestClasses: aCollection
	^ self new testClasses: aCollection.! !

!TimeLine methodsFor: 'accessing' stamp: 'MGD 11/27/2019 20:14:09'!
changeEvents
	^ self eventsWithType: #change.

	! !

!TimeLine methodsFor: 'accessing' stamp: 'MGD 11/25/2019 20:45:37'!
changes
	changes ifNil: [ changes := self changeEvents collect: [ :changeEvent | changeEvent change ] ].
	
	^ changes ! !

!TimeLine methodsFor: 'accessing' stamp: 'MGD 8/19/2019 11:46:25'!
events
	^ events 
	! !

!TimeLine methodsFor: 'accessing' stamp: 'MGD 8/30/2019 08:56:40'!
states
	^ self changeEvents collect: [ :changeEvent | self stateAfter: changeEvent change ]
	! !

!TimeLine methodsFor: 'initialization' stamp: 'MGD 1/3/2020 08:42:56'!
analysisResult: anAnalysisResult
	analysisResult := anAnalysisResult.
! !

!TimeLine methodsFor: 'initialization' stamp: 'MGD 11/25/2019 20:46:44'!
initialize
	events := OrderedCollection new.
	statesAfterChanges := Dictionary new.! !

!TimeLine methodsFor: 'querying' stamp: 'MGD 11/12/2019 16:58:11'!
changeWhenMethodWasAdded: aSelector in: className 
	^ self changes detect: [ :aChange | 
		aChange category = #newModelMethod 	 
			and: [ aChange methodSelector = aSelector ]
			and: [ aChange changeClassName = className ] ]! !

!TimeLine methodsFor: 'querying' stamp: 'MGD 11/27/2019 20:13:19'!
eventBefore: anEvent

	^ (self eventsWithType: anEvent type) before: anEvent ifNone: [ ^ nil ].! !

!TimeLine methodsFor: 'querying' stamp: 'MGD 11/27/2019 20:14:33'!
eventsWithType: aSymbol

	^ self events select: [ :anEvent | anEvent type = aSymbol ]! !

!TimeLine methodsFor: 'querying' stamp: 'MGD 6/20/2019 20:27:31'!
lastStateTransitionBefore: aChange 
	| indexOfEvent stateTransitionsBefore eventsUpToChangeEvent |
	
	indexOfEvent := events findLast: [ :event | event type = #change and: [ event change = aChange ]].
	eventsUpToChangeEvent := events copyFrom: 1 to: (indexOfEvent - 1).
	stateTransitionsBefore := eventsUpToChangeEvent select: [ :event | event type = #stateTransition ].
	
	^ stateTransitionsBefore last
	
	! !

!TimeLine methodsFor: 'querying' stamp: 'MGD 11/25/2019 20:40:51'!
stateAfter: aChange 
	| eventForChange eventAfter stateAfter |
	
	statesAfterChanges at: aChange ifPresent: [ :aState | ^ aState ].
	
	eventForChange := events detect: [ :event | event type = #change and: [ event change = aChange ]].
	eventAfter := events after: eventForChange ifNone: [ ^ (self lastStateTransitionBefore: aChange) stateTo ]. 
	
	(eventAfter type = #stateTransition) 
		ifTrue: [ stateAfter := eventAfter stateTo ] 
		ifFalse: [ stateAfter := (self lastStateTransitionBefore: aChange) stateTo ].
		
	statesAfterChanges at: aChange put: stateAfter.
	^ stateAfter 
	! !

!TimeLine methodsFor: 'register events' stamp: 'MGD 11/27/2019 20:10:23'!
addChange: aChange
	self addEvent: (ChangeEvent for: aChange in: self)! !

!TimeLine methodsFor: 'register events' stamp: 'MGD 11/25/2019 20:50:48'!
addEvent: anEvent
	events add: anEvent.
	changes := nil.
	statesAfterChanges := Dictionary new.! !

!TimeLine methodsFor: 'register events' stamp: 'MGD 11/27/2019 20:10:30'!
stateTransitionFrom: previousTDDState to: currentTDDState
	self addEvent: (StateTransitionEvent from: previousTDDState to: currentTDDState in: self)! !

!TimeLine methodsFor: 'selection' stamp: 'MGD 9/29/2019 19:20:21'!
changeAt: index
	^ self changeEvents at: index! !

!TimeLine methodsFor: 'selection' stamp: 'MGD 1/22/2020 18:46:39'!
selectedChangeDetail

	| detail currentChange correctLabel errorLabel |
	
	detail := ''.
	correctLabel := 'CORRECT' asText addAttribute: (TextColor color: AnalysisResultWindow successColor).
	errorLabel := 'ERROR' asText addAttribute: (TextColor color: AnalysisResultWindow errorColor) .
	
	self selectedEvent ifNotNil: [
		currentChange := selectedEvent change.
		(analysisResult isCorrect: currentChange)
			ifTrue: [ detail := correctLabel, String newLineString. ]
			ifFalse: [ detail := errorLabel, String newLineString. ].
		
		(analysisResult hasError: currentChange) ifTrue: [ 
			detail := detail, (analysisResult errorIn: currentChange) ].
	].

	^ detail asText! !

!TimeLine methodsFor: 'selection' stamp: 'HAW 7/11/2022 20:07:02'!
selectedCode
	| sourceCode |
	sourceCode := ''.
	
	(selectedEvent notNil and: [ selectedEvent type = #change ]) ifTrue: [ sourceCode := selectedEvent change code ].
	
	^ Text 
		initialFont: (Preferences at: #standardCodeFont)
		stringOrText: sourceCode ! !

!TimeLine methodsFor: 'selection' stamp: 'MGD 6/21/2019 07:35:29'!
selectedEvent
	^ selectedEvent ! !

!TimeLine methodsFor: 'selection' stamp: 'MGD 9/29/2019 19:16:19'!
selectionIndex
 	^ self changeEvents indexOf: selectedEvent.! !

!TimeLine methodsFor: 'selection' stamp: 'MGD 1/21/2020 19:31:55'!
selectionIndex: anInteger
	selectedEvent := anInteger = 0 ifFalse: [ self changeEvents at: anInteger ].
	
	self changed: #codeSection.
	self triggerEvent: #detailChanged! !

!TimeLine methodsFor: 'styling' stamp: 'MGD 1/21/2020 19:47:35'!
shouldStyle: aText with: aSHTextStylerST80 
	| changeClass |
		
	(self selectedEvent notNil and: [ self selectedEvent type = #change ]) 
		ifTrue: [ 
			changeClass := self selectedEvent change changeClass.
			changeClass ifNotNil: [ 
				aSHTextStylerST80 classOrMetaClass: changeClass. 
				^ true ] ].

	^ false! !

!TimeLine methodsFor: 'styling' stamp: 'MGD 1/21/2020 19:47:21'!
textStylerClassFor: textGetter
	textGetter = #selectedCode ifTrue: [ ^SHTextStylerST80 ].
	^ super textStylerClassFor: textGetter ! !

!TimeLine methodsFor: 'as yet unclassified' stamp: 'HAW 5/14/2025 10:04:30'!
allowsStylingFor: selector isTextDirty: hasUnsavedEdits
	
	^false! !

!TimeLine class methodsFor: 'as yet unclassified' stamp: 'MGD 1/3/2020 08:42:25'!
for: anAnalysisResult
	^ self new analysisResult: anAnalysisResult ! !

!TimeLineEvent methodsFor: 'accessing' stamp: 'MGD 11/27/2019 20:08:45'!
timeline
	^ timeline ! !

!TimeLineEvent methodsFor: 'accessing' stamp: 'MGD 6/20/2019 19:17:36'!
type
	self subclassResponsibility ! !

!TimeLineEvent methodsFor: 'printing' stamp: 'MGD 6/21/2019 07:38:48'!
printString
	self subclassResponsibility ! !

!TimeLineEvent methodsFor: 'as yet unclassified' stamp: 'MGD 11/27/2019 19:41:58'!
previousEvent
	^ self timeline eventBefore: self ! !

!TimeLineEvent methodsFor: 'as yet unclassified' stamp: 'MGD 11/27/2019 20:08:08'!
timeline: aTimeline
	timeline := aTimeline ! !

!ChangeEvent methodsFor: 'initialization' stamp: 'MGD 11/27/2019 20:07:19'!
change: aChange
	change := aChange! !

!ChangeEvent methodsFor: 'accessing' stamp: 'MGD 6/20/2019 20:14:01'!
change
	^ change! !

!ChangeEvent methodsFor: 'accessing' stamp: 'MGD 6/20/2019 20:17:56'!
type
	^ #change! !

!ChangeEvent methodsFor: 'displaying' stamp: 'MGD 11/26/2019 16:33:57'!
changeCategory

	^ self change category printString! !

!ChangeEvent methodsFor: 'displaying' stamp: 'MGD 11/26/2019 16:34:08'!
changeDescription

	^ self change description! !

!ChangeEvent methodsFor: 'displaying' stamp: 'MGD 11/27/2019 19:07:42'!
changeTime

	^ self change timeString! !

!ChangeEvent methodsFor: 'displaying' stamp: 'MGD 6/25/2019 09:42:14'!
displayOn: aMorph
	aMorph displayChange: self change! !

!ChangeEvent methodsFor: 'displaying' stamp: 'MGD 1/2/2020 08:57:47'!
minutesAsString: timeDifference
	| inMinutes |
	
	timeDifference > (TimeUnits minute with: 1) 
		ifTrue: [ inMinutes := ((timeDifference convertTo: TimeUnits minute) floor) amount. ]
		ifFalse: [ inMinutes := 0 ].
		
	^ String streamContents: [ :aStream | inMinutes printOn: aStream integerDigits: 2 fractionDigits: 0 ]! !

!ChangeEvent methodsFor: 'displaying' stamp: 'MGD 11/27/2019 19:42:17'!
printString
	^ '[', self changeTime, ' ', self timeDifferenceWithPreviousChange, '] [', self changeCategory, '] ', self changeDescription.! !

!ChangeEvent methodsFor: 'displaying' stamp: 'MGD 1/2/2020 08:57:58'!
secondsAsString: timeDifference
	| inMinutes inSeconds |
	
	inMinutes := ((timeDifference convertTo: TimeUnits minute) floor).
	inSeconds := ((timeDifference - inMinutes) convertTo: TimeUnits second) abs amount.

	^ String streamContents: [ :aStream | inSeconds printOn: aStream integerDigits: 2 fractionDigits: 0 ]! !

!ChangeEvent methodsFor: 'displaying' stamp: 'MGD 1/2/2020 08:57:37'!
timeDifferenceWithPreviousChange
	| previousEvent timeDifference |
	
	previousEvent := self previousEvent.
	previousEvent ifNil: [ ^ '00m00s' ].
	
	timeDifference := self change time distanceFrom: previousEvent change time.

	timeDifference > (TimeUnits hour with: 1)
		ifTrue: [ ^ '>1 hour' ] 
		ifFalse: [ ^ (self minutesAsString: timeDifference), 'm', (self secondsAsString: timeDifference), 's' ] ! !

!ChangeEvent class methodsFor: 'instance creation' stamp: 'MGD 11/27/2019 20:07:35'!
for: aChange in: aTimeline
	^ self new 
		change: aChange; 
		timeline: aTimeline! !

!StateTransitionEvent methodsFor: 'accessing' stamp: 'MGD 6/27/2019 10:26:58'!
stateFrom
	^ fromState ! !

!StateTransitionEvent methodsFor: 'accessing' stamp: 'MGD 6/27/2019 10:26:33'!
stateTo
	^ toState ! !

!StateTransitionEvent methodsFor: 'accessing' stamp: 'MGD 6/20/2019 20:17:38'!
type
	^ #stateTransition! !

!StateTransitionEvent methodsFor: 'initialization' stamp: 'MGD 6/27/2019 10:24:25'!
from: aTDDState
	fromState := aTDDState ! !

!StateTransitionEvent methodsFor: 'initialization' stamp: 'MGD 6/20/2019 20:15:11'!
tddState: aTDDState
	tddState := aTDDState ! !

!StateTransitionEvent methodsFor: 'initialization' stamp: 'MGD 6/27/2019 10:24:36'!
to: aTDDState
	toState := aTDDState ! !

!StateTransitionEvent methodsFor: 'displaying' stamp: 'MGD 6/25/2019 09:41:34'!
displayOn: aMorph
	aMorph displayStateTransition: self! !

!StateTransitionEvent methodsFor: 'displaying' stamp: 'MGD 6/27/2019 10:26:33'!
printString
	^ self stateTo printString! !

!StateTransitionEvent class methodsFor: 'instance creation' stamp: 'MGD 11/27/2019 20:09:52'!
from: previousTDDState to: currentTDDState in: aTimeline
	^ self new 
		from: previousTDDState; 
		to: currentTDDState;
		timeline: aTimeline! !

!StateTransitionEvent class methodsFor: 'instance creation' stamp: 'MGD 6/20/2019 20:16:42'!
with: aTDDState
	^ self new tddState: aTDDState ! !

!UninstalledMethodReference methodsFor: 'printing' stamp: 'MGD 9/4/2019 21:07:02'!
printOn: aStream
	aStream nextPutAll: 'TestReference '.
	aStream nextPutAll: className.
	aStream nextPutAll: '>>'.
	selector printOn: aStream ! !

!UninstalledMethodReference methodsFor: 'initialization' stamp: 'MGD 9/2/2019 20:06:32'!
class: aSymbol 
	className := aSymbol ! !

!UninstalledMethodReference methodsFor: 'initialization' stamp: 'MGD 3/17/2020 19:50:37'!
initialize
	overrides := false.! !

!UninstalledMethodReference methodsFor: 'initialization' stamp: 'MGD 3/17/2020 19:49:26'!
overrides: aBoolean
	overrides := aBoolean.! !

!UninstalledMethodReference methodsFor: 'initialization' stamp: 'MGD 9/2/2019 20:06:12'!
selector: aSymbol 
	selector := aSymbol ! !

!UninstalledMethodReference methodsFor: 'initialization' stamp: 'MGD 11/15/2019 09:14:55'!
sourceCode: aString
	sourceCode := aString ! !

!UninstalledMethodReference methodsFor: 'accessing' stamp: 'MGD 10/10/2019 20:16:08'!
methodClass
	^ className! !

!UninstalledMethodReference methodsFor: 'accessing' stamp: 'MGD 3/17/2020 19:51:31'!
overridesASuperclassMethod
	^ overrides ! !

!UninstalledMethodReference methodsFor: 'accessing' stamp: 'MGD 9/2/2019 20:12:47'!
selector
	^selector! !

!UninstalledMethodReference methodsFor: 'comparing' stamp: 'MGD 10/10/2019 20:16:08'!
= anObject
	(anObject class == self class) ifFalse: [ ^ false ].
	
	^ anObject selector = selector and: anObject methodClass = className! !

!UninstalledMethodReference methodsFor: 'comparing' stamp: 'MGD 10/10/2019 20:16:08'!
hash
	^ self methodClass hash + self selector hash! !

!UninstalledMethodReference methodsFor: 'inspecting' stamp: 'MGD 11/15/2019 09:34:36'!
methodClassIfInstalled
	^ (Smalltalk classNamed: self methodClass) ifNil: [ ^ UndefinedObject ]! !

!UninstalledMethodReference methodsFor: 'inspecting' stamp: 'HAW 4/5/2020 19:00:44'!
sendsMessageWithSelector: aSymbol
	| methodNode |
	methodNode :=  [ Parser parse: sourceCode class: self methodClassIfInstalled ]
		on: InMidstOfFileinNotification
		do: [ :anException | anException resume: true ].
	
	methodNode nodesDo: [ :aNode | 
		(aNode isMessageNode and: [ aNode isMessageNamed: aSymbol ]) ifTrue: [ ^ true ]].
	
	^ false! !

!UninstalledMethodReference methodsFor: 'copying' stamp: 'MGD 3/17/2020 19:51:13'!
copyWith: newClassName  
	^ self class selector: self selector class: newClassName sourceCode: sourceCode overrides: overrides.! !

!UninstalledMethodReference class methodsFor: 'instance creation' stamp: 'MGD 9/2/2019 20:05:36'!
selector: testSelector class: className 
	^ self new selector: testSelector; class: className ! !

!UninstalledMethodReference class methodsFor: 'instance creation' stamp: 'MGD 3/18/2020 20:37:10'!
selector: testSelector class: className sourceCode: aSourceCodeString
	^ self new selector: testSelector; class: className; sourceCode: aSourceCodeString.! !

!UninstalledMethodReference class methodsFor: 'instance creation' stamp: 'MGD 3/17/2020 19:48:00'!
selector: testSelector class: className sourceCode: aSourceCodeString overrides: anOverridenMethodOrNil
	^ self new selector: testSelector; class: className; sourceCode: aSourceCodeString; overrides: anOverridenMethodOrNil.! !

!TDDStateIcon methodsFor: 'initialization' stamp: 'MGD 10/1/2019 18:34:17'!
for: aTDDState width: widthNumber height: heightNumber
	tddState := aTDDState.
	width := widthNumber.
	height := heightNumber.! !

!TDDStateIcon methodsFor: 'drawing' stamp: 'MGD 10/1/2019 17:29:09'!
color
	^ AnalysisResultWindow stateTransitionColor: tddState ! !

!TDDStateIcon methodsFor: 'drawing' stamp: 'MGD 10/3/2019 19:22:55'!
drawAt: aPoint on: aCanvas
	| stateName stateNamePosition stringWidth topLeft bottomRight |
	
	topLeft := aPoint.
	bottomRight := ((aPoint x + width) @ (aPoint y + height)).
	aCanvas roundRect: (topLeft corner: bottomRight) color: self color radius: 0.8.
	
	stateName := tddState printString copyFrom: 1 to: 1.
	stringWidth := self font widthOfString: stateName.
	stateNamePosition := (width - stringWidth) / 2.
	aCanvas drawString: stateName at: (stateNamePosition @ aPoint y) font: self font color: Color white! !

!TDDStateIcon methodsFor: 'drawing' stamp: 'HAW 7/11/2022 20:07:22'!
font
	^ Preferences at: #standardListFont! !

!TDDStateIcon methodsFor: 'as yet unclassified' stamp: 'JA 5/19/2021 22:33:49'!
setBalloonText: stringTextOrSymbol! !

!TDDStateIcon class methodsFor: 'instance creation' stamp: 'MGD 10/1/2019 18:34:55'!
for: aTDDState width: widthNumber height: heightNumber
	^ self new for: aTDDState width: widthNumber height: heightNumber.! !

!TDDGuruTest methodsFor: 'assertions' stamp: 'HAW 1/20/2024 13:11:14'!
assert: expected equals: actual
	"This tests assumes the order of arguments used by Cuis before July 31, 2023,
	and also used by Squeak."

	super assert: actual equals: expected! !

!TDDGuruTest methodsFor: 'assertions' stamp: 'MGD 5/20/2019 19:40:16'!
assert: aResult hasErrorWithDescription: aDescription
	self assert: (aResult errors includes: aDescription)! !

!TDDGuruTest methodsFor: 'assertions' stamp: 'MGD 5/20/2019 19:40:20'!
assert: aResult hasNErrors: count
	self assert: aResult errors size equals: count! !

!TDDGuruTest methodsFor: 'assertions' stamp: 'MGD 6/26/2019 18:06:02'!
assert: aResult hasNWarnings: count
	self assert: aResult warnings size equals: count! !

!TDDGuruTest methodsFor: 'assertions' stamp: 'MGD 5/20/2019 19:51:11'!
assertCurrentStateIs: aState
	self assert: tddGuru currentState equals: aState! !

!TDDGuruTest methodsFor: 'assertions' stamp: 'MGD 5/20/2019 19:40:25'!
assertHasNoErrors: aResult
	self assert: aResult hasNErrors: 0.! !

!TDDGuruTest methodsFor: 'logging' stamp: 'HAW 1/20/2024 12:59:07'!
changeFileWithExtension: fileExtension

	^(DirectoryEntry userChangesDirectory // ((FileIOAccessor default baseNameFor: Smalltalk imageName pathAndLocalName second), fileExtension)) pathName! !

!TDDGuruTest methodsFor: 'logging' stamp: 'MGD 12/19/2019 16:59:28'!
changesFileForTests

	^ self changeFileWithExtension: self userChangesForTestFileExtension! !

!TDDGuruTest methodsFor: 'logging' stamp: 'HAW 7/11/2022 20:05:28'!
logChangesWhile: aBlockClosure 

	^Preferences
		withTemporaryValue: self userChangesForTestFileExtension
		of: #userChangesFileNameExtension
		do: aBlockClosure! !

!TDDGuruTest methodsFor: 'logging' stamp: 'MGD 12/19/2019 17:09:28'!
tddGuruTestChangesFileExtension

	^ '.tddguru.test.changes'! !

!TDDGuruTest methodsFor: 'logging' stamp: 'MGD 12/19/2019 17:11:03'!
tddGuruTestDefaultChangesFile

	^ self changeFileWithExtension: self tddGuruTestChangesFileExtension ! !

!TDDGuruTest methodsFor: 'logging' stamp: 'HAW 10/31/2019 16:12:34'!
userChangesForTestFileExtension

	^'.test.changes'! !

!TDDGuruTest methodsFor: 'helpers' stamp: 'HAW 4/4/2025 16:41:29'!
classNamed: className 

	^ Smalltalk classNamed: className! !

!TDDGuruTest methodsFor: 'helpers' stamp: 'MGD 9/9/2019 20:25:59'!
compileMethod: aString in: className 
	| class |
	class := self classNamed: className.
	
	class compile: aString.! !

!TDDGuruTest methodsFor: 'helpers' stamp: 'HAW 4/4/2025 16:43:28'!
newClassNamed: aClassName subclassOf: aSuperclass
 
	| newClass superclass |
	
	"This is to avoid generating changes for model classes - Hernan"
	superclass := aSuperclass = Object 
		ifTrue: [ self defaultSuperclass ] 
		ifFalse: [ aSuperclass ].
		
	newClass := self 
		createClassNamed: aClassName 
		subclassOf: superclass 
		category: self classCategoryOfTestData.
	
	^ newClass! !

!TDDGuruTest methodsFor: 'helpers' stamp: 'HAW 4/4/2025 16:42:30'!
removeClass: aClassName 

	| class |
	
	class := self classNamed: aClassName.
	class removeFromSystem.
	! !

!TDDGuruTest methodsFor: 'helpers' stamp: 'MGD 9/9/2019 20:25:59'!
removeMethodWithSelector: aSymbol from: className 
	(self classNamed: className) removeSelector: aSymbol ! !

!TDDGuruTest methodsFor: 'helpers' stamp: 'HAW 4/4/2025 16:43:08'!
renameClass: aFromClassName to: aToClassName 
	
	| fromClass |
	
	fromClass := self classNamed: aFromClassName.
	
	fromClass rename: aToClassName.! !

!TDDGuruTest methodsFor: 'helpers' stamp: 'MGD 9/14/2019 11:35:49'!
runAllTestsOf: aSymbol 
	| testClass |
	
	testClass := self classNamed: aSymbol.
	[ testClass buildSuiteFromAllSelectors run ] on: Exception do: [].! !

!TDDGuruTest methodsFor: 'helpers' stamp: 'MGD 9/9/2019 20:25:59'!
runTest: aTestSelector class: className 
	| class |
	class := self classNamed: className.
	[ class run: aTestSelector ] on: Exception do: []! !

!TDDGuruTest methodsFor: 'initialization' stamp: 'HAW 11/1/2019 15:48:48'!
classCategoryOfTestData

	^ '__TDDGuru-TestData__'! !

!TDDGuruTest methodsFor: 'initialization' stamp: 'HAW 4/4/2025 16:43:55'!
setUp
	
	super setUp.
	
	tddGuru := TDDGuru on: self changesFileForTests.
	previousUserChangesExtension := Preferences at: #userChangesFileNameExtension.
	Preferences at: #userChangesFileNameExtension put: self tddGuruTestChangesFileExtension
! !

!TDDGuruTest methodsFor: 'finalization' stamp: 'HAW 4/7/2025 17:39:07'!
tearDown
	
	| testDataChangeSet testDataPackage |
	
	super tearDown.
	
	self changesFileForTests asFileEntry delete.
	self tddGuruTestDefaultChangesFile asFileEntry delete.
	
	Preferences at: #userChangesFileNameExtension put: previousUserChangesExtension.
	
	testDataPackage := CodePackage packageOfSystemCategory: self classCategoryOfTestData ifNone: [ ^self ].
	testDataChangeSet := ChangeSet changeSetForPackage: testDataPackage.
	testDataChangeSet ifNotNil: [ ChangeSet removeChangeSet: testDataChangeSet ].
		
! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test01WhenANewTestIsAddedThenIsWritingAFailingTest
	| result |

	self newClassNamed: #TestSomething subclassOf: TestCase.
	tddGuru initialState: GreenTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestSomething }.
	
	self logChangesWhile: [ self compileMethod: 'test02 self assert: false.' in: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: WritingAFailingTestTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test02WhenAProductionMethodIsAddedThenIsRefactoring
	
	self newClassNamed: #ProductionClass subclassOf: Object. 
	tddGuru initialState: GreenTDDState new.
	
	self logChangesWhile: [ self compileMethod: 'm1 ^ 1' in: #ProductionClass. ].
		
	tddGuru run.
		
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test03WhenAProductionMethodIsChangedThenIsRefactoring
	| result |
	
	self newClassNamed: #ProductionClass subclassOf: Object. 
	self compileMethod: 'm1 ^ 1' in: #ProductionClass.
	tddGuru initialState: GreenTDDState new.
	
	self logChangesWhile: [ self compileMethod: 'm1 ^ 2' in: #ProductionClass. ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test04WhenAProductionClassIsAddedThenIsRefactoring
	| result |
	
	tddGuru initialState: GreenTDDState new.
	
	self logChangesWhile: [ self newClassNamed: #ProductionClass subclassOf: Object ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test05WhenAProductionClassIsRemovedThenIsRefactoring
	| result |
	
	self newClassNamed: #ProductionClass subclassOf: Object.
	tddGuru initialState: GreenTDDState new.
	
	self logChangesWhile: [ self removeClass: #ProductionClass ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test06WhenATestIsChangedThenIsRefactoring
	| result |
	
	self newClassNamed: #TestClass subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClass.
	tddGuru initialState: GreenTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClass }.
	
	self logChangesWhile: [ self compileMethod: 'test01 self assert: true' in: #TestClass. ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test07WhenATestPassesNothingHappens
	| result |
	
	self newClassNamed: #TestClass subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClass.
	tddGuru initialState: GreenTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClass }.
	
	self logChangesWhile: [ self runTest: #test01 class: #TestClass ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: GreenTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test08WhenAMethodIsRemovedIsRefactoring
	| result |
	
	self newClassNamed: #ProductionClass subclassOf: Object.
	self compileMethod: 'm1 ^ 1' in: #ProductionClass.
	tddGuru initialState: GreenTDDState new.
	
	self logChangesWhile: [ self removeMethodWithSelector: #m1 from: #ProductionClass ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test09WhenATestHasAnErrorAnErrorIsReportedAndTransitionsToRed
	| result |
	
	self newClassNamed: #TestClass subclassOf: TestCase.
	self compileMethod: 'test01 self error' in: #TestClass. 
	tddGuru initialState: GreenTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClass }.
	
	self logChangesWhile: [ self runTest: #test01 class: #TestClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testUnexpectedlyFailedErrorMessage: #test01 class: #TestClass).
	self assert: tddGuru currentState equals: RedTDDState.
	! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test10WhenATestIsRenamedThenIsRefactoring
	| result |
	
	self newClassNamed: #TestClass subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClass.
	tddGuru initialState: GreenTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClass }.
	
	self logChangesWhile: [ 
		self compileMethod: 'test01A self assert: true' in: #TestClass.
		self removeMethodWithSelector: #test01 from: #TestClass ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test11WhenATestFailsAnErrorIsReportedAndTransitionsToRed
	| result |
	
	self newClassNamed: #TestClass subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClass.
	tddGuru initialState: GreenTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClass }.
	
	self logChangesWhile: [ self runTest: #test01 class: #TestClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testUnexpectedlyFailedErrorMessage: #test01 class: #TestClass).
	self assert: tddGuru currentState equals: RedTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test12WhenATestIsRemovedThenIsRefactoring
	| result |
	
	self newClassNamed: #TestClass subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClass.
	self compileMethod: 'test02 self assert: false' in: #TestClass.
	tddGuru initialState: GreenTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClass }.
	
	self logChangesWhile: [ self removeMethodWithSelector: #test02 from: #TestClass ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test13WhenATestClassIsRemovedThenIsRefactoring
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self newClassNamed: #TestClassB subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClassA.
	self compileMethod: 'test01 self assert: false' in: #TestClassB.
	tddGuru initialState: GreenTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA. self classNamed: #TestClassB }.
	
	self logChangesWhile: [ self removeClass: #TestClassB ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test14WhenATestClassIsAddedThenIsRefactoring
	| result |
	
	tddGuru initialState: GreenTDDState new.
	
	self logChangesWhile: [ self newClassNamed: #TestClassA subclassOf: TestCase. ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!GreenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test15WhenATestClassIsRenamedThenIsRefactoring
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	tddGuru initialState: GreenTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	self logChangesWhile: [ self renameClass: #TestClassA to: #TestClassB ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 12/19/2019 17:21:42'!
test01WhenAClassIsRemovedIsNotDoingTDD
	| result |	
	
	self newClassNamed: #Something subclassOf: Object.

	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self removeClass: #Something.
	].

	result := tddGuru run.
	
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA).
	self assertCurrentStateIs: NotDoingTDD.
	! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test02WhenTheLastOfTheTestsIsRemovedIsBackToWritingAFailingTest
	| result |

	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self removeMethodWithSelector: #test02 from:  #TestClassA.
	].

	result := tddGuru run.
	
	self assertHasNoErrors: result.
	self assertCurrentStateIs: WritingAFailingTestTDDState.
	self assert: tddGuru currentState currentTest selector equals: #test01
	! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test03WhenTheFirstOfTheTestsIsRemovedIsBackToWritingAFailingTest
	| result |

	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self removeMethodWithSelector: #test01 from:  #TestClassA.
	].

	result := tddGuru run.
	
	self assertHasNoErrors: result.
	self assertCurrentStateIs: WritingAFailingTestTDDState.
	self assert: tddGuru currentState currentTest selector equals: #test02
	! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:00:28'!
test04WhenAnotherTestIsRemovedIsNotDoingTDD
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClassA.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.

	self logChangesWhile: [
		self newClassNamed: #TestClassB subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassB.
		self compileMethod: 'test02 self assert: false' in: #TestClassB.
		self removeMethodWithSelector: #test01 from:  #TestClassA.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1. 
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother:  #test02 class: #TestClassB).! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:00:31'!
test05WhenAMethodIsRemovedIsNotDoingTDD
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	self compileMethod: 'm1 ^ 1' in: #ModelClass.

	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self removeMethodWithSelector: #m1 from:  #ModelClass.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1. 
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA).! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:00:34'!
test06WhenAModelMethodIsChangedIsNotDoingTDD
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	self compileMethod: 'm1 ^ 1' in: #ModelClass.

	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self compileMethod: 'm1 ^ 2' in: #ModelClass.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1. 
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA).! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:00:38'!
test07WhenAModelClassIsAddedIsNotDoingTDD
	| result |

	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self newClassNamed: #ModelClass subclassOf: Object.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1. 
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA).
	! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:00:42'!
test08WhenAModelMethodIsAddedIsNotDoingTDD
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.

	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self compileMethod: 'm1 ^ 1' in: #ModelClass	
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA)
	! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:00:44'!
test09WhenATestIsAddedIsNotDoingTDD
	| result |
	
	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self compileMethod: 'test03 self assert: false' in: #TestClassA.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA)! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:00:47'!
test10WhenATestClassIsAddedIsNotDoingTDD
	| result |
	
	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self newClassNamed: #TestClassB subclassOf: TestCase.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA)! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:49'!
test11WhenOneOfTheTestTheTestsIsChangedIsStillInThisState
	| result |
	
	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: MoreThanOneTestWrittenTDDState.
	self assertHasNoErrors: result.! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:00:52'!
test12WhenAnotherTestIsChangedIsNotDoingTDD
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	self compileMethod: 'test01 self assert: false' in: #TestClassA.
	
	self logChangesWhile: [
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self compileMethod: 'test03 self assert: false' in: #TestClassA.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test03 class: #TestClassA)! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test13WhenATestFailsAnErrorIsReportedAndGoesToRed
	| result |
	
	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self runTest: #test01 class: #TestClassA
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: RedTDDState.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA)! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:49'!
test14WhenOneOfTheTestsPassesTwoErrorsAreReported
	| result |
	
	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: true' in: #TestClassA.
		self compileMethod: 'test02 self assert: true' in: #TestClassA.
		self runTest: #test01 class: #TestClassA.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: MoreThanOneTestWrittenTDDState.
	self assert: result hasNErrors: 2.
	self assert: result hasErrorWithDescription: (TDDGuru testDidNotFail: #test01 class: #TestClassA).
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA)! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test15WhenAllOfTheTestsPassErrorsAreReportedAndGoesToGreen
	| result |
	
	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: true' in: #TestClassA.
		self compileMethod: 'test02 self assert: true' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: GreenTDDState.
	self assert: result hasNErrors: 3.
	self assert: result hasErrorWithDescription: (TDDGuru testDidNotFail: #test01 class: #TestClassA).
	self assert: result hasErrorWithDescription: (TDDGuru testDidNotFail: #test02 class: #TestClassA).
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test02 class: #TestClassA)! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:49'!
test16WhenOneOfTheTestsIsRenamedIsStillInThisState
	| result |
	
	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: true' in: #TestClassA.
		self compileMethod: 'test02 self assert: true' in: #TestClassA.
		self compileMethod: 'test02bla self assert: true' in: #TestClassA.
		self removeMethodWithSelector: #test02 from: #TestClassA.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: MoreThanOneTestWrittenTDDState.
	self assertHasNoErrors: result.! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 18:42:10'!
test17WhenAnotherTestIsRenamedIsNotDoingTDD
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	self logChangesWhile: [
		self compileMethod: 'test02 self assert: true' in: #TestClassA.
		self compileMethod: 'test03 self assert: true' in: #TestClassA.
		self compileMethod: 'test01bla self assert: true' in: #TestClassA.
		self removeMethodWithSelector: #test01 from: #TestClassA.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testAddedWhileWritingAnother: #test03 class: #TestClassA)! !

!MoreThanOneTestWrittenTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:49'!
test18WhenATestUtilityIsChangedNothingHappens
	| result |
	
	self logChangesWhile: [
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
		self compileMethod: 'setUp ^ 1' in: #TestClassA.
		self compileMethod: 'setUp ^ 2' in: #TestClassA.
	].

	result := tddGuru run.
	
	self assertCurrentStateIs: MoreThanOneTestWrittenTDDState.
	self assertHasNoErrors: result.! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 7/28/2019 17:18:03'!
test01WhenAProductionClassIsAddedIsStillNotDoingTDD
	tddGuru initialState: NotDoingTDD new.
	
	self logChangesWhile: [ self newClassNamed: #ProdClassA subclassOf: Object ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 9/14/2019 11:30:44'!
test02WhenAProductionMethodIsAddedIsStillNotDoingTDD
	tddGuru initialState: NotDoingTDD new.
	self newClassNamed: #ProdClassA subclassOf: Object.
	
	self logChangesWhile: [ self compileMethod: 'm1 ^ 1' in: #ProdClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 9/14/2019 11:31:10'!
test03WhenATestIsAddedIsStillNotDoingTDD

	tddGuru initialState: NotDoingTDD new.
	self newClassNamed: #ProdClassA subclassOf: TestCase.
	
	self logChangesWhile: [ self compileMethod: 'test01 ^ self assert: false' in: #ProdClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 8/1/2019 09:30:02'!
test04WhenATestClassIsAddedIsStillNotDoingTDD
	tddGuru initialState: NotDoingTDD new.
	
	self logChangesWhile: [ self newClassNamed: #TestClassA subclassOf: TestCase ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 9/14/2019 11:31:48'!
test05WhenATestIsChangedIsStillNotDoingTDD

	tddGuru initialState: NotDoingTDD new.
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClassA.
	
	self logChangesWhile: [self compileMethod: 'test01 self assert: true' in: #TestClassA. ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 9/14/2019 11:32:20'!
test06WhenAProductionMethodIsChangedIsStillNotDoingTDD
	tddGuru initialState: NotDoingTDD new.
	self newClassNamed: #ProductionClassA subclassOf: Object.
	self compileMethod: 'm1 ^ 1' in: #ProductionClassA.
	
	self logChangesWhile: [ self compileMethod: 'm1 ^ 2' in: #ProductionClassA. ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 9/14/2019 11:32:42'!
test07WhenAClassIsRemovedIsStillNotDoingTDD

	tddGuru initialState: NotDoingTDD new.
	self newClassNamed: #ProductionClassA subclassOf: Object.
	
	self logChangesWhile: [ self removeClass: #ProductionClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test08WhenThereIsOneTestAndPassesThenIsInGreen
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	tddGuru initialTestClasses: { self classNamed: #TestClassA}.
	tddGuru initialState: (NotDoingTDD new).
	
	self logChangesWhile: [ self runTest: #test01 class: #TestClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: GreenTDDState ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 9/14/2019 11:34:23'!
test09WhenOneOfTheTestFailsThenIsStillNotDoingTDD
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 ^ self assert: true' in: #TestClassA.
	self compileMethod: 'test02 ^ self assert: false' in: #TestClassA.
	tddGuru initialTestClasses: { self classNamed: #TestClassA}.
	tddGuru initialState: NotDoingTDD new.
	
	self logChangesWhile: [ self runAllTestsOf: #TestClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 9/14/2019 11:37:13'!
test10WhenOneOfTheTestIsNotRunThenIsStillNotDoingTDD
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 ^ self assert: true' in: #TestClassA.
	self compileMethod: 'test02 ^ self assert: true' in: #TestClassA.

	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	tddGuru initialState: NotDoingTDD new.
	
	self logChangesWhile: [ self runTest: #test01 class: #TestClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'MGD 9/14/2019 11:38:21'!
test11WhenATestIsRenamedIsStillNotDoingTDD
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClassA.
	tddGuru initialState: NotDoingTDD new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	self logChangesWhile: [ 
		self compileMethod: 'test01bla self assert: false' in: #TestClassA.
		self removeMethodWithSelector: #test01 from: #TestClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: NotDoingTDD ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test12WhenThereIsMoreThanOneTestAndAllPassThenIsInGreen
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	self compileMethod: 'test02 self assert: true' in: #TestClassA.
	tddGuru initialState: NotDoingTDD new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	self logChangesWhile: [ self runAllTestsOf: #TestClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: GreenTDDState ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test13WhenATestIsRemovedIsNoLongerTakenIntoAccount
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	self compileMethod: 'test02 self assert: false' in: #TestClassA.
	tddGuru initialState: NotDoingTDD new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	self logChangesWhile: [ 
		self removeMethodWithSelector: #test02 from: #TestClassA.
		self runAllTestsOf: #TestClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: GreenTDDState ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:38'!
test14WhenATestClassIsRemovedIsNoLongerTakenIntoAccount
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	self compileMethod: 'test02 self assert: true' in: #TestClassA.
	self newClassNamed: #TestClassB subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassB.
	tddGuru initialState: NotDoingTDD new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA. self classNamed: #TestClassB }.
	
	self logChangesWhile: [ 
		self removeClass: #TestClassB.
		self runAllTestsOf: #TestClassA ].
	
	tddGuru run.
	
	self assertCurrentStateIs: GreenTDDState ! !

!NotDoingTDDTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:38'!
test15WhenAllTestAreRemovedThenGoesToGreen
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	self compileMethod: 'test02 self assert: true' in: #TestClassA.
	tddGuru initialState: NotDoingTDD new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA. }.
	
	self logChangesWhile: [ self removeClass: #TestClassA ].
	
	result := tddGuru run.
	
	self assertCurrentStateIs: GreenTDDState.
	self assertHasNoErrors: result.! !

!NotStartedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:11'!
test01WhenNoChangesAreDoneThenNothingHappens
	| result |
	
	self logChangesWhile: [].
		
	result _ tddGuru run.
				
	self assertHasNoErrors: result.
	self assertCurrentStateIs: NotStartedTDDState.! !

!NotStartedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test02WhenAModelClassIsAddedThenWeAsumeIsWritingAFailingTest
	| result |
	
	self logChangesWhile: [ self newClassNamed: #ModelClass subclassOf: Object ].
	
	result _ tddGuru run.
	
	self assert: result hasNErrors: 0.
	self assertCurrentStateIs: WritingAFailingTestTDDState
! !

!NotStartedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test03WhenATestClassIsAddedThenIsWritingAFailingTest
	| result |
	
	self logChangesWhile: [ self newClassNamed: #TestClass subclassOf: TestCase ].
	
	result _ tddGuru run.
	
	self assertHasNoErrors: result.
	self assertCurrentStateIs: WritingAFailingTestTDDState.! !

!NotStartedTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:02:25'!
test04WhenAProductionMethodIsAddedResultShouldHaveAnError
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	
	self logChangesWhile: [ self compileMethod: 'm1 ^1' in: #ModelClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1. 
	self assert: result hasErrorWithDescription: (TDDGuru methodAddedBeforeTest: #m1 class: #ModelClass ).
	self assertCurrentStateIs: NotDoingTDD.! !

!NotStartedTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:02:53'!
test05WhenAMethodIsChangedResultShouldHaveAnError
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	self compileMethod: 'm1 ^1' in: #ModelClass.
	
	self logChangesWhile: [ self compileMethod: 'm1 ^2' in: #ModelClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1. 
	self assert: result hasErrorWithDescription: (TDDGuru methodChangedBeforeTest: #m1 class: #ModelClass).
	self assertCurrentStateIs: NotDoingTDD.! !

!NotStartedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test06WhenATestIsAddedThenIsWritingAFailingTest
	| result |
	
	self newClassNamed: #TestSomething subclassOf: TestCase.
	
	tddGuru initialTestClasses: { self classNamed: #TestSomething}.
	
	self logChangesWhile: [ self compileMethod: 'test01 ^1' in: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: WritingAFailingTestTDDState.! !

!NotStartedTest methodsFor: 'tests' stamp: 'MGD 3/3/2020 17:03:22'!
test07WhenAClassIsRemovedResultShouldHaveAnError
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	
	self logChangesWhile: [ self removeClass: #ModelClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru classRemovedBeforeRunningTests: #ModelClass).
	self assertCurrentStateIs: NotDoingTDD.! !

!NotStartedTest methodsFor: 'tests' stamp: 'MGD 3/3/2020 17:01:24'!
test08WhenAMethodIsRemovedResultShouldHaveAnError
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	self compileMethod: 'm1 ^1' in: #ModelClass.
	
	self logChangesWhile: [ self removeMethodWithSelector: #m1 from: #ModelClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru methodRemovedBeforeRunningTests: #m1 class: #ModelClass).
	self assertCurrentStateIs: NotDoingTDD ! !

!NotStartedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test09WhenAllTestsPassThenIsInGreenState
	| result |
	
	self newClassNamed: #TestSomething subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestSomething.
	self compileMethod: 'test02 self assert: true' in: #TestSomething.
	tddGuru initialTestClasses: { self classNamed: #TestSomething }.
	
	self logChangesWhile: [ self runAllTestsOf: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: GreenTDDState.! !

!NotStartedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test10WhenATestFailsThenIsInRedState
	| result |
	
	self newClassNamed: #TestSomething subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestSomething.
	self compileMethod: 'test02 self assert: false' in: #TestSomething.
	tddGuru initialTestClasses: { self classNamed: #TestSomething }.
	
	self logChangesWhile: [ self runAllTestsOf: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RedTDDState.! !

!NotStartedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test11WhenATestHasAnErrorThenIsInRedState
	| result |
	
	self newClassNamed: #TestSomething subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestSomething.
	self compileMethod: 'test02 self error: ''Unexpected error''' in: #TestSomething.
	tddGuru initialTestClasses: { self classNamed: #TestSomething }.
	
	self logChangesWhile: [ self runAllTestsOf: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RedTDDState.! !

!NotStartedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test12WhenATestIsChangedThenIsWritingAFailingTest
	| result |
	
	self newClassNamed: #TestSomething subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestSomething.
	
	tddGuru initialTestClasses: { self classNamed: #TestSomething}.
	
	self logChangesWhile: [ self compileMethod: 'test01 self assert: false' in: #TestSomething. ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: WritingAFailingTestTDDState.
	self assert: tddGuru currentState currentTest selector equals: #test01.! !

!NotStartedTest methodsFor: 'tests' stamp: 'MGD 10/14/2019 11:17:15'!
test13WhenATestIsRenamedThenIsNotDoingTDD
	| result |
	
	self newClassNamed: #TestSomething subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestSomething.
	
	tddGuru initialTestClasses: { self classNamed: #TestSomething}.
	
	self logChangesWhile: [ 
		self compileMethod: 'test01A self assert: false' in: #TestSomething. 
		self removeMethodWithSelector: #test01 from: #TestSomething ].
		
	result _ tddGuru run.
		
	self assert: tddGuru currentState equals: NotDoingTDD.
	self assert: result hasErrorWithDescription: (TDDGuru testRenamedBeforeRunningTheTests: #test01 class: #TestSomething)! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 8/30/2019 08:55:09'!
test01ShouldIgnoreDoIts
	| result |
	
	self logChangesWhile: [ Compiler evaluate: '5 + 6' logged: true. ].
		
	result _ tddGuru run.
		
	self assert: result changeEvents size equals: 0.! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 9/9/2019 20:18:37'!
test02ResultKnowsTheChangesThatWereDone
	| result changes |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClass subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestClass. 
		self runTest: #test01 class: #TestClass.
	].
		
	result _ tddGuru run.
	
	changes := result changes.
	self assert: changes size equals: 3.
	self assert: changes first category equals: #newTestClass.
	self assert: changes second category equals: #newTest.
	self assert: changes third category equals: #testRun.! !

!OtherTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test03TDDStateForEachChange
	| result firstChange secondChange thirdChange changes |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClass subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestClass.
		self runTest: #test01 class: #TestClass
	].
		
	result _ tddGuru run.
		
	changes := result changes.
	firstChange := changes first.
	secondChange := changes second.
	thirdChange := changes third.
	
	self assert: (result stateAfter: firstChange) equals: WritingAFailingTestTDDState .
	self assert: (result stateAfter: secondChange) equals: WritingAFailingTestTDDState .
	self assert: (result stateAfter: thirdChange) equals: RedTDDState .! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 5/9/2020 19:51:42'!
test04TestRenamesAreGroupedInASingleChange
	| result |
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01A ^ 1' in: #TestClassA.
	
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	self logChangesWhile: [ 
		self compileMethod: 'test01B ^ 1' in: #TestClassA.
		self removeMethodWithSelector: #test01A from: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assert: result changes size equals: 1! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 9/9/2019 20:25:59'!
test05TestsWithSameNameInDifferentClassesAreDifferent
	| result changes |
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self newClassNamed: #TestClassB subclassOf: TestCase.
	
	tddGuru initialTestClasses: { self classNamed: #TestClassA. self classNamed: #TestClassB }.
	
	self logChangesWhile: [ 
		self compileMethod: 'test01 ^ self assert: true' in: #TestClassA.
		self compileMethod: 'test01 ^ self assert: true' in: #TestClassB.
	].
		
	result _ tddGuru run.
	changes := result changes.
	self assert: changes first category equals: #newTest.
	self assert: changes second category equals: #newTest.
	! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 6/1/2021 21:15:10'!
test06WhenATestHasAnErrorThisTestDoesNotFail
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 ^ self error: ''An error''' in: #TestClassA.
		self runTest: #test01 class: #TestClassA
	].
		
	self shouldnt: [ tddGuru run ] raise: Error
	
	! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 9/26/2019 20:44:32'!
test07RunFromASpecificChange
	| result changes |
	
	self logChangesWhile: [ 
		self newClassNamed: #ExampleClass subclassOf: Object.
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 ^ self error: ''An error''' in: #TestClassA.
		self runTest: #test01 class: #TestClassA
	].
		
	tddGuru startingFromChange: 2.
	result _ tddGuru run.
	changes := result changes.
	self assert: changes size equals: 3.

	! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 11/7/2019 20:42:21'!
test08ReRunTheWholeAnalysis
	| result changes |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self runTest: #test01 class: #TestClassA
	].
		
	result _ tddGuru run.
	
	self logChangesWhile: [ 
		self compileMethod: 'test01 self assert: true' in: #TestClassA.
	].

	result _ tddGuru rerun.
	changes := result changes.
	self assert: changes size equals: 4.

	! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 11/7/2019 20:55:58'!
test09ReRunFromASpecificChange
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #ModelClassA subclassOf: Object.
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestClassA.
		self runTest: #test01 class: #TestClassA
	].
		
	tddGuru startingFromChange: 2.
	tddGuru run.
	
	self logChangesWhile: [ 
		self compileMethod: 'test01 self assert: true' in: #TestClassA.
	].

	result _ tddGuru rerun.
	self assert: result changes size equals: 4.

	! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 11/12/2019 16:56:06'!
test10ChangeWhenAMethodWasAdded
	| result changeInWhichWasAdded |
	
	self logChangesWhile: [ 
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
		self compileMethod: 'm3 ^ 1' in: #ModelClassA.
	].
		
	result _ tddGuru run.
	
	changeInWhichWasAdded := result changes at: 3.
	self assert: (result changeWhenMethodWasAdded: #m2 in: #ModelClassA) equals: changeInWhichWasAdded.

	! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 6/1/2021 21:10:33'!
test11IgnorePassingTestChangesForUntrackedTests
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	
	self logChangesWhile: [ 
		self runTest: #test01 class: #TestClassA.
	].
		
	result := tddGuru run.
	
	self assert: result changes size equals: 0.

	! !

!OtherTest methodsFor: 'tests' stamp: 'MGD 6/1/2021 21:12:48'!
test12IgnoreFailingTestChangesForUntrackedTests
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClassA.
	
	self logChangesWhile: [ 
		self runTest: #test01 class: #TestClassA.
	].
		
	result := tddGuru run.
	
	self assert: result changes size equals: 0.

	! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test01WhenAProductionClassIsAddedIsStillInRed
	| result  |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self newClassNamed: #ProductionClass subclassOf: Object ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RedTDDState.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test02WhenAProductionMethodIsAddedIsStillInRed
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self newClassNamed: #ModelClass subclassOf: Object. 
		self compileMethod: 'm1 ^ 1' in: #ModelClass ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RedTDDState.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test03WhenTheTestPassesThenIsInGreen
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: (ModelClass new m1) equals: 1.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self newClassNamed: #ModelClass subclassOf: Object. 
		self compileMethod: 'm1 ^ 1' in: #ModelClass.
		self runTest: #test01 class: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: GreenTDDState.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test04WhenTheTestFailsIsStillInRed
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: (ModelClass new m1) equals: 1.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self newClassNamed: #ModelClass subclassOf: Object. 
		self compileMethod: 'm1 ^ 2' in: #ModelClass.
		self runTest: #test01 class: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RedTDDState.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test05WhenAProductionMethodIsChangedIsStillInRed
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self newClassNamed: #ModelClass subclassOf: Object. 
		self compileMethod: 'm1 ^ 1' in: #ModelClass.
		self compileMethod: 'm1 ^ 2' in: #ModelClass ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RedTDDState.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test06WhenTheNewTestPassesButAnotherTestFailsThenIsStillInRed
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: (ModelClass new m1) equals: 1.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self newClassNamed: #ModelClass subclassOf: Object. 
		self compileMethod: 'm1 ^ 1' in: #ModelClass.
		self runTest: #test01 class: #TestSomething.
		self compileMethod: 'test02 self assert: (ModelClass new m1) equals: 2.' in: #TestSomething.
		self runTest: #test02 class: #TestSomething.
		self compileMethod: 'm1 ^ 2' in: #ModelClass.
		self runAllTestsOf: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RedTDDState.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test07WhenAllTestsPassThenIsInGreen
	| result |
	self newClassNamed: #ModelClass subclassOf: Object.
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: (ModelClass new m1) equals: 1.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self compileMethod: 'm1 ^ 1' in: #ModelClass.
		self runTest: #test01 class: #TestSomething.
		self compileMethod: 'test02 self assert: (ModelClass new m2) equals: 2.' in: #TestSomething.
		self runTest: #test02 class: #TestSomething.
		self compileMethod: 'm1 ^ 2' in: #ModelClass.
		self compileMethod: 'm2 ^ 2' in: #ModelClass.
		self runAllTestsOf: #TestSomething.
		self compileMethod: 'm1 ^ 1' in: #ModelClass.
		self runAllTestsOf: #TestSomething ].

	result _ tddGuru run.
	
	self assertHasNoErrors: result.
	self assertCurrentStateIs: GreenTDDState.! !

!RedTest methodsFor: 'tests' stamp: 'MGD 10/10/2019 17:04:52'!
test08WhenATestIsAddedIsNotDoingTDD
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self compileMethod: 'test02 self assert: false.' in: #TestSomething. ].
		
	result _ tddGuru run.
		
	self assert: tddGuru currentState equals: NotDoingTDD.
	self assert: result hasErrorWithDescription: (TDDGuru testAddedErrorMessage: #test02 class: #TestSomething).! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test09WhenATestIsRenamedAndAllTestsPassThenIsInGreen
	| result |
	self newClassNamed: #ModelClass subclassOf: Object.
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: (ModelClass new m1) equals: 1.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self compileMethod: 'm1 ^ 1' in: #ModelClass.
		self runTest: #test01 class: #TestSomething.
		self compileMethod: 'test02 self assert: (ModelClass new m2) equals: 2.' in: #TestSomething.
		self runTest: #test02 class: #TestSomething.
		self compileMethod: 'test02A self assert: (ModelClass new m2) equals: 2.' in: #TestSomething.
		self removeMethodWithSelector: #test02 from: #TestSomething.
		self compileMethod: 'm2 ^ 2' in: #ModelClass.
		self runAllTestsOf: #TestSomething ].

	result _ tddGuru run.
	
	self assertHasNoErrors: result.
	self assertCurrentStateIs: GreenTDDState.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test10WhenAModelMethodIsRemovedIsStillInRed
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object. 
	self compileMethod: 'm1 ^ 1.' in: #ModelClass.
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self removeMethodWithSelector: #m1 from: #ModelClass ].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: RedTDDState.
	self assertHasNoErrors: result.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test11WhenAModelClassIsRemovedIsStillInRed
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object. 
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self removeClass: #ModelClass ].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: RedTDDState.
	self assertHasNoErrors: result.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test11WhenATestClassIsAddedIsStillInRed
	| result |
		
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self newClassNamed: #TestSomethingB subclassOf: TestCase. ].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: RedTDDState.
	self assertHasNoErrors: result.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test12WhenTheTestIsChangedIsStillInRed
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object. 
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething.
		self compileMethod: 'test01 self assert: true.' in: #TestSomething. ].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: RedTDDState.
	self assertHasNoErrors: result.! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test13WhenAnotherTestIsChangedIsStillInRed
	| result |
	
	self newClassNamed: #TestSomething subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true.' in: #TestSomething.
	tddGuru initialTestClasses: { self classNamed: #TestSomething }.
		
	self logChangesWhile: [ 
		self compileMethod: 'test02 self assert: false.' in: #TestSomething. 
		self runTest: #test02 class: #TestSomething.
		self compileMethod: 'test01 self assert: true.' in: #TestSomething. ].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: RedTDDState.
	self assertHasNoErrors: result.! !

!RedTest methodsFor: 'tests' stamp: 'MGD 3/8/2020 14:47:39'!
test14WhenATestIsRemovedResultShouldHaveAnErrorAndIsNotDoingTDD
	| result |
	
	self newClassNamed: #TestSomething subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true.' in: #TestSomething.
	tddGuru initialTestClasses: { self classNamed: #TestSomething }.
		
	self logChangesWhile: [ 
		self compileMethod: 'test02 self assert: false.' in: #TestSomething. 
		self runTest: #test02 class: #TestSomething.
		self removeMethodWithSelector: #test01 from: #TestSomething. ].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasErrorWithDescription: (TDDGuru testRemovedWhileInRed: #test01 class: #TestSomething)! !

!RedTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test15WhenATestClassIsRemovedResultShouldHaveAnErrorAndIsNotDoingTDD
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self newClassNamed: #TestClassB subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true.' in: #TestClassA.
	self compileMethod: 'test01 self assert: true.' in: #TestClassB.
	tddGuru initialTestClasses: { self classNamed: #TestClassA . self classNamed: #TestClassB }.
	tddGuru initialState: RedTDDState new.
		
	self logChangesWhile: [ self removeClass: #TestClassB ].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testClassRemovedWhileInRed: #TestClassB)! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test01WhenAProductionMethodIsChangedIsStillRefactoring
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object. 
	self compileMethod: 'm1 ^ 1' in: #ModelClass.
	tddGuru initialState: RefactorTDDState new.
	
	self logChangesWhile: [ self compileMethod: 'm1 ^ 2' in: #ModelClass ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test02WhenAProductionMethodIsAddedIsStillRefactoring

	self newClassNamed: #ModelClass subclassOf: Object. 
	tddGuru initialState: RefactorTDDState new.
	
	self logChangesWhile: [ self compileMethod: 'm1 ^ 1' in: #ModelClass ].
		
	tddGuru run.
		
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test03WhenAProductionClassIsAddedIsStillRefactoring
	| result |
	
	tddGuru initialState: RefactorTDDState new.
	
	self logChangesWhile: [ self newClassNamed: #ProductionClass subclassOf: Object.  ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test04WhenATestIsChangedIsStillRefactoring
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClassA.
	tddGuru initialState: RefactorTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	self logChangesWhile: [  self compileMethod: 'test01 self assert: true' in: #TestClassA ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test05WhenATestIsRenamedIsStillRefactoring
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestClassA.
	tddGuru initialState: RefactorTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA}.
	
	self logChangesWhile: [  
		self compileMethod: 'test01A self assert: true' in: #TestClassA.
		self removeMethodWithSelector: #test01 from: #TestClassA ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test06WhenATestClassIsAddedIsStillRefactoring
	| result |
	
	tddGuru initialState: RefactorTDDState new.
	
	self logChangesWhile: [ self newClassNamed: #TestClassA subclassOf: TestCase.  ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test07WhenATestIsAddedResultHasAnErrorAndIsWritingAFailingTest
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	tddGuru initialState: RefactorTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA}.
	
	self logChangesWhile: [ self compileMethod: 'testA self assert: false' in: #TestClassA ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testAddedBeforeRunningTheRestOfTheTests: #testA class: #TestClassA).
	self assert: tddGuru currentState equals: WritingAFailingTestTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test08WhenAllTestPassThenIsInGreen
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'testA self assert: true' in: #TestClassA.
	self compileMethod: 'testB self assert: true' in: #TestClassA.
	
	tddGuru initialState: RefactorTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA}.
	
	self logChangesWhile: [ self runAllTestsOf: #TestClassA ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: GreenTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test09WhenOneOfTheTestFailsThenIsStillRefactoring
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'testA self assert: false' in: #TestClassA.
	self compileMethod: 'testB self assert: true' in: #TestClassA.
	
	tddGuru initialState: RefactorTDDState new.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	self logChangesWhile: [ self runAllTestsOf: #TestClassA ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test10WhenAClassIsRemovedIsStillRefactoring
	| result |
	
	self newClassNamed: #TestClassA subclassOf: Object.
	
	tddGuru initialState: RefactorTDDState new.
	
	self logChangesWhile: [ self removeClass: #TestClassA ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test11WhenAProductionMethodIsRemovedStillRefactoring
	| result |
	
	self newClassNamed: #ProductionClass subclassOf: Object.
	self compileMethod: 'm1 ^ 1' in: #ProductionClass.
	tddGuru initialState: RefactorTDDState new.
	
	self logChangesWhile: [  self removeMethodWithSelector: #m1 from: #ProductionClass ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RefactorTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test12WhenATestClassIsRemovedThoseTestsAreNoLongerTakenIntoAccount
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self newClassNamed: #TestClassB subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	self compileMethod: 'test01 self assert: true' in: #TestClassB.
	tddGuru initialTestClasses: { self classNamed: #TestClassA . self classNamed: #TestClassB }.
	
	tddGuru initialState: RefactorTDDState new.
	
	self logChangesWhile: [ 
		self removeClass: #TestClassA.
		self runAllTestsOf: #TestClassB ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: GreenTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test13WhenATestIsRemovedIsNoLongerTakenIntoAccount
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	self compileMethod: 'test02 self assert: true' in: #TestClassA.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	tddGuru initialState: RefactorTDDState new.
	
	self logChangesWhile: [ 
		self removeMethodWithSelector: #test02 from: #TestClassA.
		self runTest: #test01 class: #TestClassA ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: GreenTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test14WhenAllTestAreRemovedThenGoesToGreen
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestClassA.
	self compileMethod: 'test02 self assert: true' in: #TestClassA.
	tddGuru initialTestClasses: { self classNamed: #TestClassA }.
	
	tddGuru initialState: RefactorTDDState new.
	
	self logChangesWhile: [ self removeClass: #TestClassA ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: GreenTDDState.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test15WhenAModelMethodIsAddedButNotUsedThereIsAnError
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'test02 self assert: false' in: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: WritingAFailingTestTDDState.
	self assert: result hasErrorWithDescription: (TDDGuru modelMethodWasNotUsedDuringRefactor: #m2 class: #ModelClassA).! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test16WhenAModelMethodIsAddedAndThenUsedThereAreNoErrors
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
		self compileMethod: 'm1 ^ self m2' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assertHasNoErrors: result.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test17WhenAModelMethodIsAddedAndRemovedAndIsNotUsedThereAreNoErrors
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
		self removeMethodWithSelector: #m2 from: #ModelClassA.
		self runAllTestsOf: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assertHasNoErrors: result.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test18WhenAModelMethodIsAddedAndIsOnlyMentionedInACommentThereIsAnError
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
		self compileMethod: 'm1 "m2 in a comment" ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assert: result hasNErrors: 1.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test19WhenTwoModelMethodsAreAddedBothHaveToBeUsedInAValidRefactor
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
		self compileMethod: 'm3 ^ 1' in: #ModelClassA.
		self compileMethod: 'm1 self m2. ^ self m3' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assertHasNoErrors: result.! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test20WhenTwoModelMethodsAreAddedAndNotUsedIsNotAValidRefactor
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
		self compileMethod: 'm3 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assert: result hasNErrors: 2.
	self assert: result hasErrorWithDescription: (TDDGuru modelMethodWasNotUsedDuringRefactor: #m2 class: #ModelClassA).
	self assert: result hasErrorWithDescription: (TDDGuru modelMethodWasNotUsedDuringRefactor: #m3 class: #ModelClassA).! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test21WhenAModelMethodIsAddedAndIsUsedAsAVariableNameIsNotAValidRefactor
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
		self compileMethod: 'm1 | m2 | m2 := 1. ^ m2' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru modelMethodWasNotUsedDuringRefactor: #m2 class: #ModelClassA).! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:24'!
test22WhenAModelMethodIsNotUsedWhenAnalysisIsFinishedThereIsAnError
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: RefactorTDDState.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru modelMethodWasNotUsedDuringRefactor: #m2 class: #ModelClassA).! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test23WhenATestClassIsRenamedThoseTestsAreStillTakenIntoAccount
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self renameClass: #TestClassA to: #TestClassB.
		self runTest: #test01 class: #TestClassB
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assertHasNoErrors: result ! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test24WhenAMethodIsOverridenItIsConsideredUsedAndRefactorIsValid
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'initialize ^ self' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assertHasNoErrors: result ! !

!RefactorTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test25WhenAModelMethodIsAddedAndUsedInATestRefactorIsValid
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: ModelClassA new m1 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
		self newClassNamed: #ModelClassA subclassOf: Object.
		self compileMethod: 'm1 ^ 1' in: #ModelClassA.
		self runAllTestsOf: #TestClassA.
		self compileMethod: 'm2 ^ 1' in: #ModelClassA.
		self compileMethod: 'test01 self assert: ModelClassA new m2 equals: 1' in: #TestClassA.
		self runAllTestsOf: #TestClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assertHasNoErrors: result.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test01WhenTheTestIsChangedThenIsStillWritingAFailingTest
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 ^ self assert: true' in: #TestSomething.
		self compileMethod: 'test01 ^ self assert: true' in: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: WritingAFailingTestTDDState.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test02WhenAModelClassIsAddedThenIsStillWritingAFailingTest
	"This is may sound wrong but we'll let write a class if it has no behaviour"
	| result |
	
	tddGuru initialState: WritingAFailingTestTDDState new.
	
	self logChangesWhile: [ self newClassNamed: #ProductionClass subclassOf: Object. ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assertCurrentStateIs: WritingAFailingTestTDDState.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test03WhenATestClassIsAddedThenIsStillWritingAFailingTest
	| result |
	
	tddGuru initialState: WritingAFailingTestTDDState new.
		
	self logChangesWhile: [ self newClassNamed: #TestSomething subclassOf: TestCase. ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: WritingAFailingTestTDDState.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:17'!
test04WhenATestFailsThenIsInRedState
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: RedTDDState.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'MGD 3/3/2020 18:44:18'!
test05WhenAModelMethodIsAddedAndNoTestIsBeingWrittenThenIsNotDoingTDD
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'm1 ^ 1' in: #ModelClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru methodAddedBeforeTest:  #m1 class: #ModelClass).
	self assert: tddGuru currentState equals: NotDoingTDD.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test06WhenTheTestIsRenamedThenIsStillWritingAFailingTest
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01A self assert: true' in: #TestSomething.
		self compileMethod: 'test01B self assert: false' in: #TestSomething.
		self removeMethodWithSelector: #test01A from: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assertCurrentStateIs: WritingAFailingTestTDDState.
	self assert: tddGuru currentState currentTest selector equals: #test01B
	! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'MGD 3/7/2020 17:25:05'!
test07WhenAModelMethodIsChangedThenIsNotDoingTDD
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	self compileMethod: 'm1 ^ 1' in: #ModelClass.
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'm1 ^ 2' in: #ModelClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru methodChangedBeforeTest: #m1 class: #ModelClass).
	self assert: tddGuru currentState equals: NotDoingTDD.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test08WhenSetUpMethodIsAddedToTheTestClassThenIsStillWritingAFailingTest
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 ^ self assert: true' in: #TestSomething.
		self compileMethod: 'setUp ^ 1' in: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: WritingAFailingTestTDDState.
	self assert: result changes size equals: 3.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test09WhenAMethodIsAddedToTheTestClassThenIsStillWritingAFailingTest
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 ^ self assert: true' in: #TestSomething.
		self compileMethod: 'aFactory ^ 1' in: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assert: tddGuru currentState equals: WritingAFailingTestTDDState.
	self assert: result changes size equals: 3.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:49'!
test10WhenASecondTestIsAddedIsInMoreThanOneTestWritten
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: true' in: #TestSomething.
		self compileMethod: 'test02 self assert: false' in: #TestSomething ].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: MoreThanOneTestWrittenTDDState.
	self assertHasNoErrors: result.
	! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test11WhenATestWithTheSameNameIsChangedInOtherClassThenIsNotDoingTDD
	| result |
	
	self newClassNamed: #TestSomethingA subclassOf: TestCase.
	self newClassNamed: #TestSomethingB subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestSomethingA.
	self compileMethod: 'test01 self assert: true' in: #TestSomethingB.
	
	tddGuru initialTestClasses: { self classNamed: #TestSomethingA. self classNamed: #TestSomethingB }.
	tddGuru initialState: (WritingAFailingTestTDDState currentTest: (UninstalledMethodReference selector: #test01 class: #TestSomethingA)).
	
	self logChangesWhile: [ 	
		self compileMethod: 'test01 self assert: false' in: #TestSomethingB.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasErrorWithDescription: (TDDGuru testChangedWhileThisTestWasBeingWritten:  #test01 in: #TestSomethingB)! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test12WhenADifferentTestIsChangedThenIsNotDoingTDD
	| result |
	
	self newClassNamed: #TestSomethingA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: false' in: #TestSomethingA.
	self compileMethod: 'test02 self assert: false' in: #TestSomethingA.
	tddGuru initialState: (WritingAFailingTestTDDState currentTest: (UninstalledMethodReference selector: #test02 class: #TestSomethingA)).
	tddGuru initialTestClasses: { self classNamed: #TestSomethingA}.
	
	self logChangesWhile: [ 	
		self compileMethod: 'test01 self assert: true' in: #TestSomethingA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testChangedWhileThisTestWasBeingWritten: #test01 in: #TestSomethingA)
	! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test13WhenATestWithTheSameNameIsAddedInOtherClassThenIsInMoreThanOneTestWritten
	| result |
	
	self newClassNamed: #TestSomethingA subclassOf: TestCase.
	self newClassNamed: #TestSomethingB subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestSomethingA.
	
	tddGuru initialTestClasses: { self classNamed: #TestSomethingA. self classNamed: #TestSomethingB }.
	tddGuru initialState: (WritingAFailingTestTDDState currentTest: (UninstalledMethodReference selector: #test01 class: #TestSomethingA)).
	
	self logChangesWhile: [ 	
		self compileMethod: 'test01 self assert: false' in: #TestSomethingB.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: MoreThanOneTestWrittenTDDState .
	self assertHasNoErrors: result.
! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'MGD 10/14/2019 12:16:54'!
test14WhenAModelMethodIsRemovedIsNotDoingTDD
	| result |
	
	self newClassNamed: #ModelClassA subclassOf: Object.
	self compileMethod: 'm1 ^ 1' in: #ModelClassA.
	
	self logChangesWhile: [ 	
		self newClassNamed: #TestSomethingA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: true' in: #TestSomethingA.
		self removeMethodWithSelector: #m1 from: #ModelClassA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru methodRemovedWhileWritingATest: #m1 class: #ModelClassA).
! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:39'!
test15WhenTheTestIsRemovedThenIsInGreen
	| result |

	self logChangesWhile: [ 	
		self newClassNamed: #TestSomethingA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: true' in: #TestSomethingA.
		self removeMethodWithSelector: #test01 from: #TestSomethingA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: GreenTDDState.
	self assertHasNoErrors: result.
! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test16WhenATestIsRenamedThenIsStillWritingAFailingTest
	| result |
	
	self newClassNamed: #TestSomethingA subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true' in: #TestSomethingA.
	tddGuru initialTestClasses: { self classNamed: #TestSomethingA }.

	self logChangesWhile: [ 	
		self compileMethod: 'test02 self assert: false' in: #TestSomethingA.
		self compileMethod: 'test01A self assert: true' in: #TestSomethingA.
		self removeMethodWithSelector: #test01 from: #TestSomethingA.
		self compileMethod: 'test02 self assert: false' in: #TestSomethingA.
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: WritingAFailingTestTDDState.
	self assertHasNoErrors: result.
! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'MGD 3/7/2020 17:23:38'!
test17WhenAModelClassIsRemovedThenIsNotDoingTDD
	| result |
	self newClassNamed: #ModelClassA subclassOf: Object.
	
	self logChangesWhile: [ 	
		self newClassNamed: #TestSomethingA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: false' in: #TestSomethingA.
		self removeClass: #ModelClassA
	].
		
	result _ tddGuru run.
		
	self assertCurrentStateIs: NotDoingTDD.
	self assert: result hasErrorWithDescription: (TDDGuru classRemovedBeforeRunningTests: #ModelClassA).

! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:47:38'!
test18WhenTheTestPassesAnErrorIsReportedAndGoesToGreen
	| result |
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'test01 self assert: true.' in: #TestSomething.
		self runTest: #test01 class: #TestSomething ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru testDidNotFail: #test01 class: #TestSomething).
	self assert: tddGuru currentState equals: GreenTDDState.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test19AnotherTestIsRemovedAnErrorIsReportedAndIsStillWritingAFailingTest
	| result |
	
	self newClassNamed: #TestClassA subclassOf: TestCase.
	self newClassNamed: #TestClassB subclassOf: TestCase.
	self compileMethod: 'test01 self assert: true.' in: #TestClassA.
	self compileMethod: 'test01 self assert: true.' in: #TestClassB.
	tddGuru initialTestClasses: { self classNamed: #TestClassA . self classNamed: #TestClassB }.
	
	self logChangesWhile: [ 
		self compileMethod: 'test02 self assert: false.' in: #TestClassA.
		self removeMethodWithSelector: #test01 from: #TestClassB ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru methodRemovedWhileWritingATest: #test01 class: #TestClassB).
	self assert: tddGuru currentState equals: WritingAFailingTestTDDState.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'HAW 10/7/2025 09:48:32'!
test20WhenAFirstTestIsAddedIsStillWritingAFailingTest
	| result |
	
	
	self logChangesWhile: [ 
		self newClassNamed: #TestClassA subclassOf: TestCase.
		self compileMethod: 'test01 self assert: true.' in: #TestClassA. ].
		
	result _ tddGuru run.
		
	self assertHasNoErrors: result.
	self assertCurrentStateIs: WritingAFailingTestTDDState.
	self assert: tddGuru currentState currentTest selector equals: #test01.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'MGD 3/3/2020 18:47:29'!
test21WhenAModelMethodIsAddedBeforeRunningTestsThenIsNotDoingTDD
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: #test01 in: #TestSomething.
		self compileMethod: 'm1 ^ 1' in: #ModelClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru modelMethodAddedBeforeRunningTests: #m1 class: #ModelClass).
	self assert: tddGuru currentState equals: NotDoingTDD.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'MGD 3/7/2020 17:01:17'!
test22WhenAModelMethodIsChangedBeforeWritingATestThenIsNotDoingTDD
	| result |
	
	self newClassNamed: #ModelClass subclassOf: Object.
	self compileMethod: 'm1 ^ 1' in: #ModelClass.
	
	self logChangesWhile: [ 
		self newClassNamed: #TestSomething subclassOf: TestCase.
		self compileMethod: 'm1 ^ 1' in: #ModelClass ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru methodChangedBeforeTest: #m1 class: #ModelClass).
	self assert: tddGuru currentState equals: NotDoingTDD.! !

!WritingAFailingTestTest methodsFor: 'tests' stamp: 'MGD 3/7/2020 17:31:12'!
test23WhenATestClassIsRemovedIsNotDoingTDD
	| result |
	
	self newClassNamed: #TestSomethingA subclassOf: TestCase.
	tddGuru initialTestClasses: { self classNamed: #TestSomethingA }.
		
	self logChangesWhile: [ 
		self newClassNamed: #TestSomethingB subclassOf: TestCase.
		self compileMethod: 'test01 ^ 1' in: #TestSomethingB.
		self removeClass: #TestSomethingA ].
		
	result _ tddGuru run.
		
	self assert: result hasNErrors: 1.
	self assert: result hasErrorWithDescription: (TDDGuru classRemovedBeforeRunningTests: #TestSomethingA).
	self assert: tddGuru currentState equals: NotDoingTDD.! !

!TestChangesTest methodsFor: 'helpers' stamp: 'HAW 1/20/2024 13:00:26'!
changeFileWithExtension: fileExtension

	^(DirectoryEntry userChangesDirectory // ((FileIOAccessor default baseNameFor: Smalltalk imageName pathAndLocalName second), fileExtension)) pathName
	! !

!TestChangesTest methodsFor: 'helpers' stamp: 'HAW 7/11/2022 20:18:19'!
changeUserChangesFileWhile: aBlock
	^Preferences
		withTemporaryValue: self userChangesForTestFileExtension
		of: #userChangesFileNameExtension
		do: aBlock. 
	! !

!TestChangesTest methodsFor: 'helpers' stamp: 'MGD 12/19/2019 17:33:19'!
changesFileForTests
	^ self changeFileWithExtension: self userChangesForTestFileExtension ! !

!TestChangesTest methodsFor: 'helpers' stamp: 'MGD 12/19/2019 16:19:29'!
classCategoryOfTestData
	^ '__TDDGuru-TestData__'! !

!TestChangesTest methodsFor: 'helpers' stamp: 'HAW 4/7/2025 17:47:05'!
createTestClass

	| testClass |
	testClass := self 
		createClassNamed: #TestChangesTestData 
		subclassOf:  TestCase 
		category: self classCategoryOfTestData.
		
	testClass compile: 'aTestThatPass self assert: true'.
	testClass compile: 'aTestThatFails self assert: false'.
	testClass compile: 'aTestThatErrors self error: ''error'''.
						
	^ testClass! !

!TestChangesTest methodsFor: 'helpers' stamp: 'MGD 3/17/2020 16:21:04'!
createTestClassSubclassOf: aClass named: aName
	^ aClass 
		subclass: aName
		instanceVariableNames: '' 
		classVariableNames: '' 
		poolDictionaries: '' 
		category: self classCategoryOfTestData.! !

!TestChangesTest methodsFor: 'helpers' stamp: 'HAW 9/20/2025 18:07:20'!
createTestDataClass

	^self 
		createClassNamed: self testDataClassName 
		category: self classCategoryOfTestData.! !

!TestChangesTest methodsFor: 'helpers' stamp: 'MGD 12/19/2019 16:05:00'!
scanChangesFromFile
	| fileStream changeList |

	fileStream := self changesFileForTests asFileEntry readStream.
	changeList := ChangeList new scanFile: fileStream from: 0 to: fileStream size.

	^ changeList changeList.! !

!TestChangesTest methodsFor: 'helpers' stamp: 'MGD 3/17/2020 16:19:05'!
testDataClassName
	^ #TestChangesTestClass__! !

!TestChangesTest methodsFor: 'helpers' stamp: 'MGD 12/19/2019 16:03:48'!
userChangesForTestFileExtension
	^ '.test.changes'! !

!TestChangesTest methodsFor: 'setUp/tearDown' stamp: 'HAW 4/7/2025 17:53:10'!
tearDown

	| testDataChangeSet testDataPackage |
	
	super tearDown.
	
	self changesFileForTests asFileEntry delete.
	
	testDataPackage := CodePackage packageOfSystemCategory: self classCategoryOfTestData ifNone: [ ^self ].
	testDataChangeSet := ChangeSet changeSetForPackage: testDataPackage.
	testDataChangeSet ifNotNil: [ ChangeSet removeChangeSet: testDataChangeSet ].
! !

!LogTestChangesTest methodsFor: 'tests' stamp: 'MGD 3/17/2020 16:02:10'!
test01RunningAPassingTestShouldBeLogged
	" Log format expected:

	!!testRun: #TestCase #testSelector stamp: changeStamp!!
	PASSED
	"
	| testName testClass |
	
	self changeUserChangesFileWhile: [
		testClass := self createTestClass.
		testName := #aTestThatPass. 
		self runTest: testName of: testClass.

		self assertIsLoggedOnce: '!!testRun: ', testClass name printString, ' #', testName, ' stamp:'.
		self assertIsLoggedOnce: 'PASSED!!' ]! !

!LogTestChangesTest methodsFor: 'tests' stamp: 'MGD 3/17/2020 16:01:16'!
test02RunningAFailingTestShouldBeLogged
	" Log format expected:

	!!testRun #NewTestCase #testSelector stamp: changeStamp!!
	FAILURE
	"
	| testName testClass |
	
	self changeUserChangesFileWhile: [
		testClass := self createTestClass.
		testName := #aTestThatFails.
		
		self runTest: testName of: testClass.
		
		self assertIsLoggedOnce: '!!testRun: ', testClass name printString, ' #', testName, ' stamp:'.
		self assertIsLoggedOnce: 'FAILURE!!' ]! !

!LogTestChangesTest methodsFor: 'tests' stamp: 'MGD 3/17/2020 16:00:02'!
test03RunningATestWithAnErrorShouldBeLogged
	" Log format expected:

	!!testRun NewTestCase #testSelector stamp: changeStamp!!
	ERROR
	"
	| testName testClass |
	
	self changeUserChangesFileWhile: [
		testClass := self createTestClass.
		testName := #aTestThatErrors.
		self runTest: testName of: testClass.

		self assertIsLoggedOnce: '!!testRun: ', testClass name printString, ' ', testName printString, ' stamp:'.
		self assertIsLoggedOnce: 'ERROR!!' ]! !

!LogTestChangesTest methodsFor: 'tests' stamp: ''!
test04OverridingAMethodShouldBeLoggedWithAReferenceToTheOverridenMethod
	" Log format expected:

	!!Class methodsFor: 'category' stamp: 'author stamp' overrides: 'methodHash'!!
	newMethodSourceCode
	"
	| aSuperClass aSubClass |
	
	self changeUserChangesFileWhile: [
		aSuperClass := self createTestDataClass.
		aSuperClass compile: 'm1 ^ 1' classified: 'a-category'.
		aSubClass := self createTestClassSubclassOf: aSuperClass named: #SubclassTestDataClass__.
		aSubClass compile: 'm1 ^ 2' classified: 'a-category'.

		self assertIsLoggedOnce: '!!SubclassTestDataClass__ methodsFor: ''a-category'' stamp:'.
		self assertIsLoggedOnce: 'overrides: '.
		self assertIsLoggedOnce: 'm1 ^ 2' ] ! !

!LogTestChangesTest methodsFor: 'tests' stamp: ''!
test05WhenAMethodIsNotOverridenTheMethodReferenceIsNotIncluded
	" Log format expected:

	!!Class methodsFor: 'category' stamp: 'author stamp'!!
	newMethodSourceCode
	"
	| aSuperClass aSubClass |

	self changeUserChangesFileWhile: [
		aSuperClass := self createTestDataClass.
		aSuperClass compile: 'm1 ^ 1' classified: 'a-category'.
		aSubClass := self createTestClassSubclassOf: aSuperClass named: #SubclassTestDataClass__.
		aSubClass compile: 'm2 ^ 2' classified: 'a-category'.

		self assertIsNotLogged: 'overrides:'.
	] ! !

!LogTestChangesTest methodsFor: 'tests' stamp: 'MGD 3/17/2020 19:04:43'!
test06WhenAMethodIsChangedItIsNotConsideredOverriden
	" Log format expected:

	!!Class methodsFor: 'category' stamp: 'author stamp'!!
	newMethodSourceCode
	"
	| aClass |

	self changeUserChangesFileWhile: [
		aClass := self createTestDataClass.
		aClass compile: 'm1 ^ 1' classified: 'a-category'.
		aClass compile: 'm1 ^ 2' classified: 'a-category'.

		self assertIsNotLogged: 'overrides:'.
	] ! !

!LogTestChangesTest methodsFor: 'run tests' stamp: 'MGD 11/2/2019 17:04:07'!
runTest: aTestSelector of: aTestClass
	[ aTestClass run: aTestSelector ] on: Error do: []! !

!LogTestChangesTest methodsFor: 'assertions' stamp: 'MGD 12/19/2019 16:24:17'!
assertIsLogged: aString times: stringCount
	| logContent startPosition indexOfSubstring |

	logContent := self changesFileForTests asFileEntry textContents.

	(stringCount <= 0)
		ifTrue: [ self deny: (logContent includesSubString: aString) ]
		ifFalse:	[
			startPosition := 1.
			self assert: (logContent includesSubString: aString).
			stringCount timesRepeat: [
				indexOfSubstring := logContent findString: aString startingAt: startPosition.

				self assert: indexOfSubstring > 0.
				startPosition := indexOfSubstring.
			]
		]

	! !

!LogTestChangesTest methodsFor: 'assertions' stamp: 'MGD 12/19/2019 16:23:03'!
assertIsLoggedOnce: aString
	self assertIsLogged: aString times: 1.
	! !

!LogTestChangesTest methodsFor: 'assertions' stamp: 'MGD 3/17/2020 16:23:22'!
assertIsLoggedTwice: aString
	self assertIsLogged: aString times: 2.
	! !

!LogTestChangesTest methodsFor: 'assertions' stamp: ''!
assertIsNotLogged: aString
	| logContent |

	logContent := self changesFileForTests asFileEntry textContents.
	self deny: (logContent includesSubString: aString).
	! !

!ScanTestChangesTest methodsFor: 'tests' stamp: 'MGD 3/17/2020 15:39:19'!
test01ScanPassingTestChange

	| testRunChange testClass |

	self changeUserChangesFileWhile: [
		testClass := self createTestClass.
		testClass run: #aTestThatPass.

		testRunChange := self scanChangesFromFile last.

		self assert: testRunChange changeType equals: #testRun.
		self assert: testRunChange changeClassName equals: testClass name.
		self assert: testRunChange methodSelector equals: #aTestThatPass.
		self assert: testRunChange isPassed.
		self deny: testRunChange stamp isNil ]! !

!ScanTestChangesTest methodsFor: 'tests' stamp: 'MGD 3/17/2020 15:39:32'!
test02ScanFailedTestChange

	| testRunChange testClass |

	self changeUserChangesFileWhile: [
		testClass := self createTestClass.
		testClass run: #aTestThatFails.

		testRunChange := self scanChangesFromFile last.

		self assert: testRunChange changeType equals: #testRun.
		self assert: testRunChange changeClassName equals: testClass name.
		self assert: testRunChange methodSelector equals: #aTestThatFails.
		self assert: testRunChange isFailure ]! !

!ScanTestChangesTest methodsFor: 'tests' stamp: 'HAW 4/7/2025 17:50:30'!
test03ScanNewTestClass
	
	| newClassChange newClass |

	self changeUserChangesFileWhile: [
		newClass := self 
			createClassNamed: #TestClassA 
			subclassOf: TestCase 
			category: self classCategoryOfTestData.
		newClassChange := self scanChangesFromFile last.

		self assert: newClassChange changeType equals: #classDefinition.
		self assert: newClassChange changeClassName equals: newClass name.
		self assert: newClassChange changeClass equals: newClass.
		self assert: newClassChange isTestClassChange.
		self deny: newClassChange stamp isNil ]! !

!ScanTestChangesTest methodsFor: 'tests' stamp: 'MGD 3/17/2020 19:26:02'!
test04ScanOverridenMethod
	
	| methodChange aSuperClass aSubclass |

	self changeUserChangesFileWhile: [
		aSuperClass := self createTestDataClass.
		aSubclass := self createTestClassSubclassOf: aSuperClass named: #AClass__.		
		aSuperClass compile: 'm1 ^ 1'.
		aSubclass compile: 'm1 ^ 2'.

		methodChange := self scanChangesFromFile last.

		self assert: methodChange changeType equals: #method.
		self assert: methodChange changeClassName equals: aSubclass name.
		self assert: methodChange changeClass equals: aSubclass.
		self assert: methodChange methodSelector equals: #m1.
		self assert: methodChange overridesASuperclassMethod.
		self deny: methodChange stamp isNil ]! !

!ScanTestChangesTest methodsFor: 'tests' stamp: 'MGD 3/17/2020 19:33:24'!
test05ScanAMethodThatIsNotOverriden
	
	| methodChange aSuperClass aSubclass |

	self changeUserChangesFileWhile: [
		aSuperClass := self createTestDataClass.
		aSubclass := self createTestClassSubclassOf: aSuperClass named: #AClass__.		
		aSuperClass compile: 'm1 ^ 1'.
		aSubclass compile: 'm2 ^ 2'.

		methodChange := self scanChangesFromFile last.

		self assert: methodChange changeType equals: #method.
		self assert: methodChange changeClassName equals: aSubclass name.
		self assert: methodChange changeClass equals: aSubclass.
		self assert: methodChange methodSelector equals: #m2.
		self deny: methodChange overridesASuperclassMethod.
		self deny: methodChange stamp isNil ]! !

!ChangeRecord methodsFor: '*TDDGuru' stamp: 'HAW 10/7/2025 09:29:44'!
isTestClassChange

	"This is just a hack. In the original version when the class definition was loaded we looked at the
	class definition to know if the class subclassed TestCase. We did that becuase the changed class could
	not be in the image. Juan wanted to remove this method from Cuis so the good enough way to do it 
	is if the class does not exist in the image to see if the name includes the string Test ... fragile but it will
	work on most cases. A better change would mean to change the method that reads the class definition
	and control if changes to that method were made, etc.
	See failing tests for limitiations on this solution - Hernan"
	^ self changeClass
		ifNil: [ class includesSubString: 'Test' ] 
		ifNotNil: [ :changeClass | changeClass inheritsFrom: TestCase ]
		
		! !

!ChangeRecord methodsFor: '*TDDGuru' stamp: 'HAW 10/7/2025 09:24:39'!
overridesASuperclassMethod

	"Same as in isTestClassChange - Hernan"
	
	| sel |

	sel := self methodSelector.
	sel ifNil: [ ^false ].
	self changeClass allSuperclassesDo: [ :cls | (cls includesSelector: sel) ifTrue: [ ^true ]].

	^false! !

!TestCase methodsFor: '*TDDGuru' stamp: 'HAW 1/24/2024 19:59:37'!
logRunWithResult: aString

	Smalltalk 
		logToUserChanges: aString 
		preamble: 'testRun: ', self class name printString, ' ', self selector printString, ' stamp: ', Utilities changeStamp printString.! !

!TestCase methodsFor: '*TDDGuru' stamp: 'HAW 4/3/2024 13:14:38'!
performTest
	[assertCount := 0.
	self perform: testSelector asSymbol.
  	self logRunWithResult: 'PASSED'. ] 
		on: TestFailure 
		do: [ :failure | 
			self logRunWithResult: 'FAILURE'.
			failure pass ]
		on: Error 
		do: [ :exception | 
			self logRunWithResult: 'ERROR'.
			exception pass ] 
			! !

!TestCase methodsFor: '*TDDGuru' stamp: 'HAW 10/27/2019 00:21:24'!
run: aResult
	ChangeSet
		runningTest: self printString
		do: [ aResult runCase: self ].	
! !
