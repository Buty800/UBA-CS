!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion apuntandoHacia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'posicion' stamp: 'SP 10/23/2025 12:13:14'!
isAt: posicionAcomparar heading: unaDireccion
	^ (posicion = posicionAcomparar) and: [apuntandoHacia = unaDireccion]! !

!MarsRover methodsFor: 'posicion' stamp: 'BSN 10/23/2025 16:57:26'!
modificarDireccion: unaDireccion
	apuntandoHacia := unaDireccion! !

!MarsRover methodsFor: 'posicion' stamp: 'SP 10/21/2025 14:49:00'!
modificarPosicionSobreXEn: unaCantidad
	posicion := (posicion x + unaCantidad)@(posicion y)! !

!MarsRover methodsFor: 'posicion' stamp: 'SP 10/21/2025 15:09:26'!
modificarPosicionSobreYEn: unaCantidad
	posicion := (posicion x)@(posicion y + unaCantidad)! !


!MarsRover methodsFor: 'movimientos base' stamp: 'BSN 10/23/2025 16:53:00'!
avanzar
	apuntandoHacia = 'N' ifTrue: [self modificarPosicionSobreYEn: 1].
	apuntandoHacia = 'O' ifTrue:  [self modificarPosicionSobreXEn: -1].
	apuntandoHacia  = 'S' ifTrue: [self modificarPosicionSobreYEn: -1].
	apuntandoHacia  = 'E' ifTrue: [self modificarPosicionSobreXEn: 1].
! !

!MarsRover methodsFor: 'movimientos base' stamp: 'SP 10/23/2025 17:25:34'!
girarDerecha
	apuntandoHacia = 'N' ifTrue: [self modificarDireccion: 'E']
	ifFalse: [
		apuntandoHacia = 'O' ifTrue: [self modificarDireccion: 'N'] ifFalse: [
			apuntandoHacia = 'S' ifTrue: [self modificarDireccion: 'O'] ifFalse: [
			apuntandoHacia = 'E' ifTrue: [self modificarDireccion: 'S']]]].! !

!MarsRover methodsFor: 'movimientos base' stamp: 'SP 10/23/2025 17:26:30'!
girarIzquierda	
	apuntandoHacia = 'N' ifTrue: [self modificarDireccion: 'O']
	ifFalse: [
		apuntandoHacia = 'O' ifTrue: [self modificarDireccion: 'S'] ifFalse: [
			apuntandoHacia = 'S' ifTrue: [self modificarDireccion: 'E'] ifFalse: [
			apuntandoHacia = 'E' ifTrue: [self modificarDireccion: 'N']]]].! !

!MarsRover methodsFor: 'movimientos base' stamp: 'BSN 10/23/2025 16:52:46'!
retroceder
	apuntandoHacia = 'N' ifTrue: [self modificarPosicionSobreYEn: -1].
	apuntandoHacia = 'O' ifTrue:  [self modificarPosicionSobreXEn: 1].
	apuntandoHacia  = 'S' ifTrue: [self modificarPosicionSobreYEn: 1].
	apuntandoHacia  = 'E' ifTrue: [self modificarPosicionSobreXEn: -1].
! !


!MarsRover methodsFor: 'control' stamp: 'SP 10/23/2025 17:37:21'!
process: StringDeComandos
	StringDeComandos do: [:comando |
			comando = $f ifTrue: [self avanzar].
			comando = $b ifTrue: [self retroceder].
			comando  = $l ifTrue: [self girarIzquierda].
			comando  = $r ifTrue: [self girarDerecha].
		]	! !


!MarsRover methodsFor: 'initialization' stamp: 'SP 10/23/2025 12:11:31'!
at: unaPosicion heading: unSentido 
	posicion := unaPosicion.
	apuntandoHacia  := unSentido! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 12:11:04'!
at: unaPosicion heading: unaDireccion
	^ self new at: unaPosicion heading: unaDireccion ! !


!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 12:49:29'!
test01ComandoVacioRoverNoSeMueve
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: ''.
	self assert: (marsRover isAt: 0@0 heading: 'E').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 12:49:45'!
test02RoverSeMueveParaAdelante
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'f'.
	self assert: (marsRover isAt: 1@0 heading: 'E').
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 12:49:56'!
test03RoverSeMueveParaAtras
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'b'.
	self assert: (marsRover isAt: -1@0 heading: 'E').
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 17:36:55'!
test04RoverRota90GradosAIzquierdaSinMoverseDespues
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'l'.
	self assert: (marsRover isAt: 0@0 heading: 'N').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BSN 10/23/2025 15:33:22'!
test05RoverRota90GradosADerechaSinMoverse
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'r'.
	self assert: (marsRover isAt: 0@0 heading: 'S').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 17:36:49'!
test06RoverRota90GradosAIzquierdaYAvanza
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'lf'.
	self assert: (marsRover isAt: 0@1 heading: 'N').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BSN 10/23/2025 16:53:49'!
test07RoverRota90GradosADerechaYAvanza
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'rf'.
	self assert: (marsRover isAt: 0@-1 heading: 'S').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 17:36:41'!
test08RoverRota90GradosAIzquierdayRetrocede
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'lb'.
	self assert: (marsRover isAt: 0@-1 heading: 'N').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BSN 10/23/2025 15:56:48'!
test09RoverRota90GradosADerechaYRetrocede
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'rb'.
	self assert: (marsRover isAt: 0@1 heading: 'S').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 17:36:30'!
test10RoverRota90GradosADerechaYAIzquierdaMantienePosicion
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'N'.
	marsRover process: 'rl'.
	self assert: (marsRover isAt: 0@0 heading: 'N').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 17:31:05'!
test11RoverAvanzaDosVecesCorrectamente
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'ff'.
	self assert: (marsRover isAt: 2@0 heading: 'E').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'SP 10/23/2025 17:38:04'!
test12RoverProcesaComandoLargoCorrectamente
	| marsRover startingPosition | 
	startingPosition := 0@0.
	marsRover := MarsRover at: startingPosition heading: 'E'.
	marsRover process: 'fffrrffflbbrrrff'.
       self assert: (marsRover isAt: 2@2 heading: 'E').! !
