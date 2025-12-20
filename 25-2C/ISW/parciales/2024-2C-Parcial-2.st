!classDefinition: #Element category: #'2024-2C-Parcial-2'!
Object subclass: #Element
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Element methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 18:14:17'!
characterRepresentation
	self subclassResponsibility ! !


!classDefinition: #Actor category: #'2024-2C-Parcial-2'!
Element subclass: #Actor
	instanceVariableNames: 'position direcction'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Actor methodsFor: 'direction' stamp: 'Buty 11/23/2025 20:57:05'!
goDown
	direcction := (0@1).! !

!Actor methodsFor: 'direction' stamp: 'Buty 11/23/2025 20:57:05'!
goLeft
	direcction := (-1@0).! !

!Actor methodsFor: 'direction' stamp: 'Buty 11/23/2025 20:57:05'!
goRight
	direcction := (1@0).! !

!Actor methodsFor: 'direction' stamp: 'Buty 11/23/2025 20:57:05'!
goUp
	direcction := (0@-1).! !


!Actor methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 20:57:41'!
move
	position := self nextPosition! !

!Actor methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 20:57:29'!
nextPosition
	^ position + direcction ! !

!Actor methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 20:57:35'!
position
	^ position! !


!classDefinition: #Ghost category: #'2024-2C-Parcial-2'!
Actor subclass: #Ghost
	instanceVariableNames: 'characterRep over'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Ghost methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 20:59:31'!
characterRepresentation
	^ characterRep ! !

!Ghost methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:41:05'!
ghost: aGhost wantsToMove: aPacmanGame! !

!Ghost methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 23:48:05'!
initializeAtPostion: aPosition withRepresentation: aCharacter
	position := aPosition.
	characterRep := aCharacter .
	direcction := 0@0.
	over := Space new.! !

!Ghost methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 23:59:31'!
isOver
	^ over.! !

!Ghost methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 23:58:34'!
isOver: anElement
	over := anElement.! !

!Ghost methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:41:10'!
pacmanWantsToMove: aPacmanGame
	aPacmanGame eatPacman.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ghost class' category: #'2024-2C-Parcial-2'!
Ghost class
	instanceVariableNames: ''!

!Ghost class methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 21:00:43'!
atPostion: aPosition withRepresentation: aCharacter
	^ self new initializeAtPostion: aPosition withRepresentation: aCharacter ! !


!classDefinition: #Pacman category: #'2024-2C-Parcial-2'!
Actor subclass: #Pacman
	instanceVariableNames: 'initialPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Pacman methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 18:22:41'!
characterRepresentation
	^ $p! !

!Pacman methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:35:53'!
ghost: aGhost wantsToMove: aPacmanGame
	aPacmanGame ghostMoves: aGhost.
	aPacmanGame eatPacman.! !

!Pacman methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:31:42'!
initializeAtPostion: aPosition
	position := aPosition.
	initialPosition := aPosition.
	self goLeft.! !

!Pacman methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:32:26'!
reset
	self initializeAtPostion: initialPosition ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pacman class' category: #'2024-2C-Parcial-2'!
Pacman class
	instanceVariableNames: ''!

!Pacman class methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 19:00:26'!
atPosition: startingPosition
	^ self new initializeAtPostion: startingPosition ! !


!classDefinition: #Box category: #'2024-2C-Parcial-2'!
Element subclass: #Box
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Box methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:06:11'!
ghost: aGhost wantsToMove: aPacmanGame
	aPacmanGame ghostMoves: aGhost.
	aGhost isOver: self.
	! !

!Box methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:05:33'!
pacmanWantsToMove: aPacmanGame
	aPacmanGame pacmanMovesAndGainsPoints: self points.! !

!Box methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:06:02'!
points

	self subclassResponsibility! !


!classDefinition: #BigPill category: #'2024-2C-Parcial-2'!
Box subclass: #BigPill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!BigPill methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 18:22:09'!
characterRepresentation
	^ $*! !

!BigPill methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:05:50'!
points 
	^ 2.! !


!classDefinition: #SmallPill category: #'2024-2C-Parcial-2'!
Box subclass: #SmallPill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!SmallPill methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 18:22:47'!
characterRepresentation
	^ $-! !

!SmallPill methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:06:23'!
points
	^ 1! !


!classDefinition: #Space category: #'2024-2C-Parcial-2'!
Box subclass: #Space
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Space methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:06:58'!
characterRepresentation
	^ $=! !

!Space methodsFor: 'as yet unclassified' stamp: 'Buty 11/24/2025 00:07:05'!
points
	^ 0! !


!classDefinition: #Wall category: #'2024-2C-Parcial-2'!
Element subclass: #Wall
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Wall methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 18:28:43'!
characterRepresentation
	^ $#! !

!Wall methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 19:58:47'!
isWall
	^ true! !

!Wall methodsFor: 'as yet unclassified' stamp: 'Buty 11/23/2025 20:13:38'!
pacmanWantsToMove: aPacmanGame! !


!classDefinition: #PacmanGame category: #'2024-2C-Parcial-2'!
Object subclass: #PacmanGame
	instanceVariableNames: 'board points boardExtent pacman tick blinky clayde lifes'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGame methodsFor: 'initialitation' stamp: 'Buty 11/24/2025 00:29:43'!
initializeOn: boardStringRepresentation
	board := Dictionary new.
	boardExtent := boardStringRepresentation extent.
	boardStringRepresentation visitElementsWith: self.
	lifes := 3.
	points := 0.
	tick := 0.! !


!PacmanGame methodsFor: 'assertions' stamp: 'Buty 11/24/2025 00:28:51'!
lifes: anAmmountOfLifes
	^ lifes = anAmmountOfLifes.! !

!PacmanGame methodsFor: 'assertions' stamp: 'Buty 11/23/2025 17:53:28'!
points: anAmmountOfPoints
	^ points = anAmmountOfPoints.! !



!PacmanGame methodsFor: 'string representation' stamp: 'Buty 11/23/2025 19:15:25'!
characterRepresentationOf: anElement
	^ anElement characterRepresentation ! !

!PacmanGame methodsFor: 'string representation' stamp: 'Buty 11/23/2025 19:15:14'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !

!PacmanGame methodsFor: 'string representation' stamp: 'Buty 11/23/2025 19:15:03'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!PacmanGame methodsFor: 'visiting' stamp: 'Buty 11/23/2025 19:16:10'!
visitBigPillAt: aPosition 
	board at: aPosition put: (BigPill new)! !

!PacmanGame methodsFor: 'visiting' stamp: 'Buty 11/23/2025 23:21:10'!
visitBlinkyAt: aPosition 
	blinky := Ghost atPostion: aPosition withRepresentation: $B.
	board at: aPosition put: blinky.! !

!PacmanGame methodsFor: 'visiting' stamp: 'Buty 11/23/2025 23:34:49'!
visitClydeAt: aPosition 
	clayde := Ghost atPostion: aPosition withRepresentation: $C.
	board at: aPosition put: clayde! !

!PacmanGame methodsFor: 'visiting' stamp: 'Buty 11/23/2025 19:16:35'!
visitPacmanAt: aPosition 
	pacman := Pacman atPosition: aPosition.
	board at: aPosition put: pacman.! !

!PacmanGame methodsFor: 'visiting' stamp: 'Buty 11/23/2025 19:16:56'!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: SmallPill new! !

!PacmanGame methodsFor: 'visiting' stamp: 'Buty 11/23/2025 19:17:05'!
visitSpaceAt: aPosition

	board at: aPosition put: Space new! !

!PacmanGame methodsFor: 'visiting' stamp: 'Buty 11/23/2025 19:17:14'!
visitWallAt: aPosition 
	
	board at: aPosition put: Wall new
	! !


!PacmanGame methodsFor: 'movment' stamp: 'Buty 11/24/2025 00:02:41'!
ghostMoves: aGhost
	board at: aGhost position put: aGhost isOver.
	aGhost move.
	board at: aGhost position put: aGhost.
	! !

!PacmanGame methodsFor: 'movment' stamp: 'Buty 11/23/2025 23:45:33'!
moveGhost: aGhost
	(board at: (aGhost nextPosition)) ghost: aGhost wantsToMove: self.
! !

!PacmanGame methodsFor: 'movment' stamp: 'Buty 11/23/2025 20:10:50'!
movePacman
	(board at: (pacman nextPosition)) pacmanWantsToMove: self.   ! !

!PacmanGame methodsFor: 'movment' stamp: 'Buty 11/23/2025 20:16:18'!
pacmanMovesAndGainsPoints: anAmmountOfPoints
	points := points + anAmmountOfPoints.
	self visitSpaceAt: pacman position.
	pacman move.
	board at: pacman position put: pacman.! !

!PacmanGame methodsFor: 'movment' stamp: 'Buty 11/23/2025 20:38:05'!
pacmanMovesDown
	pacman goDown.! !

!PacmanGame methodsFor: 'movment' stamp: 'Buty 11/23/2025 20:42:35'!
pacmanMovesLeft
	pacman goLeft.! !

!PacmanGame methodsFor: 'movment' stamp: 'Buty 11/23/2025 20:29:29'!
pacmanMovesRight
	pacman goRight .! !

!PacmanGame methodsFor: 'movment' stamp: 'Buty 11/23/2025 20:40:48'!
pacmanMovesUp
	pacman goUp .! !


!PacmanGame methodsFor: 'game progress' stamp: 'Buty 11/24/2025 00:34:09'!
eatPacman
	tick := 0.
	lifes := lifes - 1.
	pacman reset.
	board at: pacman position put: pacman.! !

!PacmanGame methodsFor: 'game progress' stamp: 'Buty 11/23/2025 23:35:06'!
tick
	tick := tick + 1.
	tick = 4 ifTrue: [blinky goLeft].
	tick = 5 ifTrue: [clayde goRight].	 
	self movePacman.
	self moveGhost: blinky.
	self moveGhost: clayde.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PacmanGame class' category: #'2024-2C-Parcial-2'!
PacmanGame class
	instanceVariableNames: ''!

!PacmanGame class methodsFor: 'instance creation' stamp: 'Buty 11/23/2025 19:12:31'!
on: initialBoard
	^ self new initializeOn: initialBoard ! !

!PacmanGame class methodsFor: 'instance creation' stamp: 'Buty 11/23/2025 19:10:32'!
withInitialBoard: initialBoard
	^ self new initializeOn: initialBoard ! !


!classDefinition: #StringPacmanBoard category: #'2024-2C-Parcial-2'!
Object subclass: #StringPacmanBoard
	instanceVariableNames: 'stringRepresentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoard methodsFor: 'initialization' stamp: 'HAW 11/18/2024 19:29:26'!
initializeRepresentedAs: aStringRepresentation 
	
	stringRepresentation := aStringRepresentation.! !


!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:23:48'!
bigPillCharacter

	^self class bigPillCharacter! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:20'!
blinkyCharacter

	^ self class blinkyCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:30'!
clydeCharacter

	^ self class clydeCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:52'!
pacmanCharacter

	^ self class pacmanCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:15'!
smallPillCharacter

	^self class smallPillCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:37'!
spaceCharacter

	^self class spaceCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:26:00'!
wallCharacter

	^self class wallCharacter! !


!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:21'!
isBigPill: anElement

	^ anElement = self bigPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:36'!
isBlinky: anElement

	^ anElement = self blinkyCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:09'!
isClyde: anElement

	^ anElement = self clydeCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:17'!
isPacman: anElement

	^ anElement = self pacmanCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:12'!
isSmalltPill: anElement

	^ anElement = self smallPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:29'!
isSpace: anElement

	^ anElement = self spaceCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:03'!
isWall: anElement

	^ anElement = self wallCharacter! !


!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/22/2024 14:38:19'!
visit: anElement at: position with: aPacmanBoardVisitor

	(self isWall: anElement) ifTrue: [ ^aPacmanBoardVisitor visitWallAt: position ].
	(self isSmalltPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSmallPillAt: position ].
	(self isBigPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBigPillAt: position ].
	(self isBlinky: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBlinkyAt: position ].
	(self isClyde: anElement) ifTrue: [ ^aPacmanBoardVisitor visitClydeAt: position ].
	(self isPacman: anElement) ifTrue: [ ^aPacmanBoardVisitor visitPacmanAt: position ].
	(self isSpace: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSpaceAt: position ].
	
	"No hay necesidad de generar un error porque no se permite crear un board con caracteres distintos a todos estos - Hernan"! !

!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/20/2024 17:22:41'!
visitElementsWith: aPacmanBoardVisitor

	stringRepresentation withIndexDo: [ :aRow :y |
		aRow withIndexDo: [ :anElement :x | 
			self visit: anElement at: x@y with: aPacmanBoardVisitor.]]! !


!StringPacmanBoard methodsFor: 'extent' stamp: 'HAW 11/22/2024 10:50:10'!
extent
	
	"There is always a row and their size is the same to all - Hernan"
	^stringRepresentation first size @ stringRepresentation size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StringPacmanBoard class' category: #'2024-2C-Parcial-2'!
StringPacmanBoard class
	instanceVariableNames: ''!

!StringPacmanBoard class methodsFor: 'instance creation' stamp: 'HAW 11/22/2024 10:48:32'!
representedAs: aStringRepresentation 
	
	| elementCharactersCount |
	
	elementCharactersCount := self elementCharacterCountOf: aStringRepresentation.	
	self asserltAllActorsAreIn: elementCharactersCount.
	"If I get here the there is always a row - Hernan"
	self assertAllRowsHaveSameSizeIn: aStringRepresentation.
	
	^self new initializeRepresentedAs: aStringRepresentation 
	! !


!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:30'!
characterIsMissingErrorDescriptionFor: aCharacterName
	
	^aCharacterName, ' is missing'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:39:12'!
notAllowCharaterErrorDescriptionFor: aCharacter

	^'Character ', aCharacter asString, ' is not allowed'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:07:31'!
rowsMustHaveSameSizeErrorDescription
	
	^'Rows must have same number of columns'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:01'!
shouldBeUniqueErrorDescriptionFor: aCharacterName
	
	^'There should be only one ', aCharacterName ! !


!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/21/2024 20:17:42'!
allowedCharacters
	
	^ {
	self pacmanCharacter.
	self blinkyCharacter.
	self clydeCharacter.
	self wallCharacter.
	self bigPillCharacter.
	self smallPillCharacter.
	self spaceCharacter.
	}! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:24:06'!
bigPillCharacter
	
	^ $*! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:25'!
blinkyCharacter
	
	^$B! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:42'!
clydeCharacter
	
	^$C! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:41:25'!
pacmanCharacter
	
	^$p! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:24'!
smallPillCharacter
	
	^ $-! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:46'!
spaceCharacter
	
	^ $=! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:26:06'!
wallCharacter
	
	^ $#! !


!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:12'!
blinkyName

	^ #blinky! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:29'!
clydeName

	^ #clyde! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:05'!
pacmanName

	^ #pacman! !


!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/21/2024 19:59:27'!
asserltAllActorsAreIn: elementCharactersCount

	{ self pacmanName. self blinkyName. self clydeName } do: [ :aCharacterName | 
		self assertActorIsCorrect: aCharacterName in: elementCharactersCount ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:04'!
assert: anElementCharacter isAllowed: allowedCharacters

	(allowedCharacters includes: anElementCharacter) ifFalse: [ self error: (self notAllowCharaterErrorDescriptionFor: anElementCharacter) ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:48:41'!
assertActorIsCorrect: aCharacterName in: elements 
	
	| characterIdentifier |
	
	characterIdentifier := self perform: (aCharacterName, #Character) asSymbol.
	(elements includes: characterIdentifier)
		ifFalse: [ self error: (self characterIsMissingErrorDescriptionFor: aCharacterName) ].
		
	(elements occurrencesOf: characterIdentifier) > 1
		ifTrue: [ self error: (self shouldBeUniqueErrorDescriptionFor: aCharacterName) ].
! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:16'!
assertAllRowsHaveSameSizeIn: aStringRepresentation

	(aStringRepresentation allSatisfy: [ :aRow | aRow size = aStringRepresentation first size ]) ifFalse: [ 
		self error: self rowsMustHaveSameSizeErrorDescription ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:30'!
elementCharacterCountOf: aStringRepresentation

	| elementCharactersCount allowedCharacters |
	
	elementCharactersCount := Bag new.
	allowedCharacters := self allowedCharacters.
	
	aStringRepresentation do: [ :aRow |
		aRow do: [ :anElementCharacter | 
			self assert: anElementCharacter isAllowed: allowedCharacters.
			elementCharactersCount add: anElementCharacter ]].
	
	^elementCharactersCount ! !


!classDefinition: #PacmanGameTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #PacmanGameTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 19:12:18'!
test01PacmanStartsMovingLeft
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#-p--#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game tick.
	self
		assert: game stringRepresentationOfBoard
		equals: #(
			'######'
			'#-BC-#'
			'#p=--#'
			'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 19:12:18'!
test02GameStartsWith0PointsAnd3Lifes
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#-p--#'
		'######').
	game := PacmanGame on: board.
	self assert: [game lifes: 3].
	self assert: [game points: 0].! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 19:12:18'!
test03EatingASmallPillGivesOnePoint
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#-p--#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game tick.
	self assert: [game points: 1].! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 19:12:18'!
test04EatingABigPillGivesTwoPoints
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#*p--#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game tick.
	self assert: [game points: 2].! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 20:37:06'!
test05PacmanCanMoveThanOnce
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#--p-#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game tick.
	game tick.
	self
		assert: game stringRepresentationOfBoard
		equals: #(
			'######'
			'#-BC-#'
			'#p==-#'
			'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 19:12:18'!
test06EatingTwoSmallPillsGivesTwoPoints
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#--p-#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game tick.
	game tick.
	self assert: (game points: 2)! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 19:20:20'!
test07SpacesDontGivePoints
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#=p--#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game tick.
	game tick.
	self assert: (game points: 0)! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 20:16:39'!
test08PacmanCantMoveThroughAWall
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#p---#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game tick.
	self assert: game stringRepresentationOfBoard 
	equals: #(
		'######'
		'#-BC-#'
		'#p---#'
		'######')! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 20:18:49'!
test09PacmanCanMoveRight
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#p---#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game pacmanMovesRight.
	game tick.
	self assert: game stringRepresentationOfBoard 
	equals: #(
		'######'
		'#-BC-#'
		'#=p--#'
		'######')! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 20:42:24'!
test10PacmanCanChangeDirectionAndGoLeft
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#p---#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game pacmanMovesRight.
	game tick.
	game pacmanMovesLeft.
	game tick.
	self assert: game stringRepresentationOfBoard 
	equals: #(
		'######'
		'#-BC-#'
		'#p=--#'
		'######')! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 20:37:28'!
test10PacmanCanMoveDown
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#pBC-#'
		'#----#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game pacmanMovesDown.
	game tick.
	self assert: game stringRepresentationOfBoard 
	equals: #(
		'######'
		'#=BC-#'
		'#p---#'
		'######')! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 20:51:01'!
test11PacmanCanMoveUp
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#p---#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game pacmanMovesUp.
	game tick.
	self assert: game stringRepresentationOfBoard 
	equals: #(
		'######'
		'#pBC-#'
		'#=---#'
		'######')! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 23:28:53'!
test12BlinkyStartsMovingAtTheFourthTickToTheLeft
	| board game |
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#p---#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	4 timesRepeat: [game tick].
	self assert: game stringRepresentationOfBoard 
	equals: #(
		'######'
		'#B=C-#'
		'#p---#'
		'######')! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 23:34:13'!
test13ClaydeStartsMovingAtTheFifthTickToTheRight
	| board game |
	board := StringPacmanBoard representedAs:#(
		'#######'
		'#--BC-#'
		'#p----#'
		'#######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	5 timesRepeat: [game tick].
	self assert: game stringRepresentationOfBoard 
	equals: #(
		'#######'
		'#B-==C#'
		'#p----#'
		'#######')! !

!PacmanGameTest methodsFor: 'tests' stamp: 'Buty 11/24/2025 00:42:18'!
test14GhostEatsPacman
	| board game |
	board := StringPacmanBoard representedAs:#(
		'#######'
		'#-BC--#'
		'#p----#'
		'#######').

	game := PacmanGame on: board.
	game pacmanMovesUp.
	4 timesRepeat: [game tick].
	self assert: game stringRepresentationOfBoard 
	equals: #(
		'#######'
		'#B=C--#'
		'#p----#'
		'#######').
	self assert: (game lifes: 2).! !


!classDefinition: #StringPacmanBoardTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #StringPacmanBoardTest
	instanceVariableNames: 'visitedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test01CannotCreateABoardWithoutThePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test02CannotCreateABoardWithMoreThanOnePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BCpp') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test03CannotCreateABoardWithoutBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 14:32:55'!
test04CannotCreateABoardWithMoreThanOneBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pBBC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:33'!
test05CannotCreateABoardWithoutClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pB') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:40'!
test06CannotCreateABoardWithMoreThanOneClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pBCC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:49'!
test07AllRowsHaveSameSize

	self 
		should: [ StringPacmanBoard representedAs: #('pBC' '') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: StringPacmanBoard rowsMustHaveSameSizeErrorDescription! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:00'!
test08VisitElementsWithRightPosition

	| board |
	
	visitedElements := Dictionary new.
	
	board := StringPacmanBoard representedAs: #('pBC#-*=').
	board visitElementsWith: self.
	
	self assert: (visitedElements at: #pacman) equals: 1@1.
	self assert: (visitedElements at: #blinky) equals: 2@1.
	self assert: (visitedElements at: #clyde) equals: 3@1.
	self assert: (visitedElements at: #wall) equals: 4@1.
	self assert: (visitedElements at: #smallPill) equals: 5@1.
	self assert: (visitedElements at: #bigPill) equals: 6@1.
	self assert: (visitedElements at: #space) equals: 7@1.
	self assert: visitedElements size equals: 7
	
	
	! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:11'!
test09InvalidCharactersAreNotAllowed

	self 
		should: [ StringPacmanBoard representedAs: #('pBCx') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard notAllowCharaterErrorDescriptionFor: $x)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'Buty 11/23/2025 19:18:32'!
test10BoardTranslationExample
"
	HACER PASAR ESTE TEST ANTES DE COMENZAR: falla porque en la posicion del pacman (p) pone un string en vez de #pacman
"
	| board translator |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#-p=-#'
'######').

	translator := PacmanGame on: board.
	
	self assert: translator stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#-p=-#'
'######').
! !


!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:25'!
visitBigPillAt: position 
	
	visitedElements at: #bigPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:27'!
visitBlinkyAt: position 
	
	visitedElements at: #blinky put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:56'!
visitClydeAt: position 
	
	visitedElements at: #clyde put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:10'!
visitPacmanAt: position 
	
	visitedElements at: #pacman put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:14'!
visitSmallPillAt: position 
	
	visitedElements at: #smallPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:17:12'!
visitSpaceAt: position 
	
	visitedElements at: #space put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:05'!
visitWallAt: position 
	
	visitedElements at: #wall put: position ! !
