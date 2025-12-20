!classDefinition: #EscapeDeFlota category: #'ISW-Parcial1-1C25'!
Object subclass: #EscapeDeFlota
	instanceVariableNames: 'flota'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!EscapeDeFlota methodsFor: 'initialize' stamp: 'Buty 10/2/2025 11:46:14'!
initializeConFlota: naves
	flota := naves.! !


!EscapeDeFlota methodsFor: 'as yet unclassified' stamp: 'Buty 10/2/2025 14:43:59'!
atravesar: ruta
	ruta isEmpty ifTrue: [ ^ self error: EscapeDeFlota rutaVaciaDescripcionDeError].
	(ruta size = ruta asSet size) 
	ifFalse: [^ self error: EscapeDeFlota sectoresRepetidosDescripcionDeError ].
	
	ruta do: [ :sector |
		flota do: [ :nave |
			nave atravesar: sector
		]	
	]! !

!EscapeDeFlota methodsFor: 'as yet unclassified' stamp: 'Buty 10/2/2025 14:40:54'!
haSobrevivido: unaNave
	flota do: [:naveDeFlota | 
		(naveDeFlota = unaNave) ifTrue: [^ naveDeFlota viva].
	]! !

!EscapeDeFlota methodsFor: 'as yet unclassified' stamp: 'Buty 10/2/2025 14:41:27'!
numeroDeSobrevivientesEs: valorAcomparar
	| sobrevivientes |
	sobrevivientes := 0.
	flota do: [:naveDeFlota |
		naveDeFlota viva ifTrue: [sobrevivientes := sobrevivientes + 1]
	].
	^ sobrevivientes = valorAcomparar .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EscapeDeFlota class' category: #'ISW-Parcial1-1C25'!
EscapeDeFlota class
	instanceVariableNames: ''!

!EscapeDeFlota class methodsFor: 'instance creation' stamp: 'Buty 10/2/2025 11:46:39'!
enrolar: naves
	naves isEmpty ifTrue: [^ self error: EscapeDeFlota flotaSinNavesDescripcionDeError].
	(naves size = naves asSet size) 
	ifFalse: [^ self error: EscapeDeFlota todasLasNavesDebenSerDiferentesDescripcionDeError ].
	^ self new initializeConFlota: naves.
	! !


!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 9/28/2025 00:38:12'!
flotaSinNavesDescripcionDeError

	^ 'La flota no puede estar vacia'! !

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 9/28/2025 00:38:25'!
rutaVaciaDescripcionDeError

	^ 'La ruta no puede ser vacia'! !

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 9/28/2025 00:40:29'!
sectoresRepetidosDescripcionDeError

	^ 'La ruta no puede tener sectores repetidos'! !

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 9/28/2025 00:38:52'!
todasLasNavesDebenSerDiferentesDescripcionDeError

	^ 'Todas las naves de la flota deben ser unicas'! !


!classDefinition: #Nave category: #'ISW-Parcial1-1C25'!
Object subclass: #Nave
	instanceVariableNames: 'maniobrabilidad escudos combustible maxDañoCasco propulsor daño'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Nave methodsFor: 'assertions' stamp: 'Buty 10/2/2025 15:05:13'!
dañada
	^ daño > 0.! !

!Nave methodsFor: 'assertions' stamp: 'Buty 10/2/2025 14:27:35'!
destruida
	^ daño > maxDañoCasco .! !

!Nave methodsFor: 'assertions' stamp: 'Buty 10/2/2025 16:15:08'!
fuerzaDeEscudosEn: valorAcomparar
	^ escudos = valorAcomparar .! !

!Nave methodsFor: 'assertions' stamp: 'Buty 10/2/2025 15:05:42'!
nivelDeDañoEs: valorAcomparar
	^ daño = valorAcomparar.! !

!Nave methodsFor: 'assertions' stamp: 'Buty 10/2/2025 14:54:09'!
sinCombustible
	^ combustible <= 0.! !

!Nave methodsFor: 'assertions' stamp: 'Buty 10/2/2025 11:38:52'!
valorCombustible: valorAcomparar
	^ combustible = valorAcomparar.! !

!Nave methodsFor: 'assertions' stamp: 'Buty 10/2/2025 14:54:24'!
viva
	^ (self destruida or: combustible < 0) not.! !


!Nave methodsFor: 'initialize' stamp: 'Buty 10/2/2025 11:23:20'!
initializeConManiobrabilidad: valorManiobrabilidad
escudos: valorEscudos
combustible: valorCombustible
maxDañoCasco: valorMaxDañoCasco
propulsor: tipoPropulsor

maniobrabilidad  := valorManiobrabilidad.
escudos  := valorEscudos .
combustible  := valorCombustible.
maxDañoCasco := valorMaxDañoCasco .
propulsor := tipoPropulsor .
daño := 0.! !


!Nave methodsFor: 'as yet unclassified' stamp: 'Buty 10/2/2025 16:22:44'!
atravesar: sector 
	|tipoDeSector radiacion gravedad gastoDeCombustible|
	
	gastoDeCombustible := 10.
	tipoDeSector := sector tipo.
	radiacion := sector radiacion.
	gravedad := sector gravedad.
	
	tipoDeSector = #Planetario ifTrue: [
		propulsor = #VelocidadLuz ifTrue: [radiacion := 0].
		propulsor = #Gravitones ifTrue: [gravedad := gravedad / 0.8].
	].
	tipoDeSector = #Asteroides ifTrue: [
		propulsor = #VelocidadLuz ifTrue: [escudos := 0. daño := daño + 1].
		propulsor = #Gravitones ifTrue: [
			gravedad := 0. 
			gastoDeCombustible := gastoDeCombustible * 2
		].
		propulsor = #Estandar ifTrue: [escudos := escudos - 20].
	].
	tipoDeSector = #Nebulosa ifTrue: [
		propulsor = #VelocidadLuz ifTrue: [
			gastoDeCombustible := 0.
			radiacion := 0.
			gravedad := 0.
			].
		propulsor = #Gravitones ifTrue: [gastoDeCombustible := gastoDeCombustible * 3].
		propulsor = #Estandar ifTrue: [radiacion := radiacion / 0.7 ].
	].
	
	combustible 	:= combustible - gastoDeCombustible .
	gravedad > maniobrabilidad ifTrue: [daño := daño + 1].
	radiacion > escudos ifTrue: [daño := daño + 1].		
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Nave class' category: #'ISW-Parcial1-1C25'!
Nave class
	instanceVariableNames: ''!

!Nave class methodsFor: 'instance creation' stamp: 'Buty 10/2/2025 11:27:22'!
contrabandistaConPropulsor: tipoPropulsor
	^ self new    initializeConManiobrabilidad: 70
				escudos:  50
				combustible: 95 
				maxDañoCasco:  2
				propulsor: tipoPropulsor .! !

!Nave class methodsFor: 'instance creation' stamp: 'Buty 10/2/2025 11:27:00'!
cruceroPesadoConPropulsor: tipoPropulsor
	^ self new    initializeConManiobrabilidad: 50
				escudos:  100
				combustible: 50 
				maxDañoCasco:  5
				propulsor: tipoPropulsor .! !


!classDefinition: #Sector category: #'ISW-Parcial1-1C25'!
Object subclass: #Sector
	instanceVariableNames: 'gravedad radiacion tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Sector methodsFor: 'getters' stamp: 'Buty 10/2/2025 15:55:58'!
gravedad
	^ gravedad! !

!Sector methodsFor: 'getters' stamp: 'Buty 10/2/2025 15:55:45'!
radiacion
	^ radiacion! !

!Sector methodsFor: 'getters' stamp: 'Buty 10/2/2025 15:55:38'!
tipo
	^tipo! !


!Sector methodsFor: 'initialize' stamp: 'Buty 10/2/2025 15:33:11'!
dañaAnaveConManiobravilidad: maniobravilidad Escudo: escudo yPropulsor: tipoPropulsor
	| daño |
	daño := 0.
	maniobravilidad < gravedad ifTrue: [daño := daño + 1].
	escudo < radiacion ifTrue: [daño := daño + 1].
	^ daño! !

!Sector methodsFor: 'initialize' stamp: 'Buty 10/2/2025 15:51:38'!
initializeConGravedad: valorGravedad Radiacion: valorRadiacion yTipo: tipoDeSector
	gravedad := valorGravedad .
	radiacion := valorRadiacion .
	tipo := tipoDeSector. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sector class' category: #'ISW-Parcial1-1C25'!
Sector class
	instanceVariableNames: ''!

!Sector class methodsFor: 'instance creation' stamp: 'Buty 10/2/2025 15:52:01'!
conGravedad: valorGravedad Radiacion: valorRadiacion yTipo: tipoDeSector
	^ self new initializeConGravedad: valorGravedad Radiacion: valorRadiacion yTipo: tipoDeSector .! !


!classDefinition: #EscapeDeFlotaTests category: #'ISW-Parcial1-1C25'!
TestCase subclass: #EscapeDeFlotaTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/10/2025 19:58:18'!
test01LaFlotaDebeTenerAlMenosUnaNave
	
	self 
		should: [ EscapeDeFlota enrolar: {  } ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: EscapeDeFlota flotaSinNavesDescripcionDeError ! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/10/2025 19:58:49'!
test02LaFlotaNoPuedeTenerNavesDuplicadas

	| cruceroPesadoConImpulsoEstandar |
	
	cruceroPesadoConImpulsoEstandar := self nuevoCruceroPesadoConImpulsoEstandar.
	
	self 
		should: [ EscapeDeFlota enrolar: { cruceroPesadoConImpulsoEstandar. cruceroPesadoConImpulsoEstandar } ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: EscapeDeFlota todasLasNavesDebenSerDiferentesDescripcionDeError ! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 05:58:13'!
test03LaRutaDeSectoresARecorrerNoPuedeSerVacia

	| cruceroPesadoConImpulso flota |
	
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self assert: (cruceroPesadoConImpulso valorCombustible: 50).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	self 
		should: [ flota atravesar: {  } ] 
		raise: Error-MessageNotUnderstood  
		withExceptionDo: [ :error | 
			self assert: EscapeDeFlota rutaVaciaDescripcionDeError equals: error messageText.
			self assert: (cruceroPesadoConImpulso valorCombustible: 50) ]
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 05:58:22'!
test04CombustibleDeLaNaveDebeSerSuficienteParaAtravesarUnicoSectorPlanetarioYSobrevivir

	| sector flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self assert: (cruceroPesadoConImpulso valorCombustible: 50).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	sector := self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 50.
	
	flota atravesar: { sector }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: (cruceroPesadoConImpulso valorCombustible: (50 - 10))
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:06:58'!
test05LaRutaDeSectoresARecorrerNoPuedeTenerSectoresRepetidos

	| cruceroPesadoConImpulso flota sector |
	
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self assert: (cruceroPesadoConImpulso valorCombustible: 50).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	sector := self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 50.
	
	self 
		should: [ flota atravesar: { sector. sector } ] 
		raise: Error-MessageNotUnderstood  
		withExceptionDo: [ :error | 
			self assert: EscapeDeFlota sectoresRepetidosDescripcionDeError equals: error messageText.
			self assert: (cruceroPesadoConImpulso valorCombustible: 50) ]
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:06:39'!
test06NaveQueSeQuedaSinCombustibleMientrasCruzaSectorNoSobrevive

	| flota naveContrabandistaConImpulso |
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConImpulso := self nuevaNaveContrabandistaConImpulsoEstandar.
	self deny: naveContrabandistaConImpulso sinCombustible.

	flota := EscapeDeFlota enrolar: { naveContrabandistaConImpulso }.
	
	"Secuencia de 10 sistemas planetarios seguidos con combustible para 9.5..."
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 10 conGravedad: 50 yRadiacion: 50).
	
	self assert: (flota numeroDeSobrevivientesEs: 0).
	self deny: (flota haSobrevivido: naveContrabandistaConImpulso).
	self assert: naveContrabandistaConImpulso sinCombustible
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:06:34'!
test07NavePuedeQuedarseSinCombustiblePeroSobrevivir

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso sinCombustible.
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	"Secuencia de 5 sistemas planetarios seguidos... Llega justo!!"
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 5 conGravedad: 50 yRadiacion: 50).
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso sinCombustible.
	self assert: (cruceroPesadoConImpulso valorCombustible: 0).
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:06:30'!
test08NaveQueSeQuedaSinCombustibleAntesDePasarPorTodosLosSectoresNoSobrevive

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso sinCombustible.

	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	"Secuencia de 6 sistemas planetarios seguidos con combustible para 5..."
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 6 conGravedad: 50 yRadiacion: 50).
	
	self assert: (flota numeroDeSobrevivientesEs: 0).
	self deny: (flota haSobrevivido: cruceroPesadoConImpulso).
	self assert: cruceroPesadoConImpulso sinCombustible
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:06:25'!
test09NaveQueAtraviesaSectorConMayorGravedadQueSuManiobravilidadSufreDaños

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 0).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 70 yRadiacion: 50 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 1).

	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:06:21'!
test10NaveQueAtraviesaSectorConMayorRadiacionQueSusEscudosDeEnergiaSufreDaños

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 0).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 1).
	

	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:06:15'!
test11NaveAtravesandoSectorConMayorGravedadYRadiacionQueSuManiobravilidadYEscudosDeEnergiaSufreElDobleDeDaño

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 0).

	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 70 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 2).
	
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:06:11'!
test12NaveQueSufreMasNivelesDeDañoQueLaCapacidadDeSuCascoEsDestruidaYNoSobreviveAlEscape

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso destruida.
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	"6 niveles de daño en una clase de naves que sólo admite 5 como máximo..."
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 3 conGravedad: 70 yRadiacion: 200).
	
	self assert: (flota numeroDeSobrevivientesEs: 0).
	self deny: (flota haSobrevivido: cruceroPesadoConImpulso).
	self assert: cruceroPesadoConImpulso destruida
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'Buty 10/2/2025 15:55:14'!
test13NaveAtravesandoSectorPlanetarioUsandoVelocidadLuzIgnoraRadiacionDelSector

	| flota naveContrabandistaConVelocidadLuz |
	
	"Si se atraviesa un sector planetario utilizando velocidad luz (Warp, Light Speed, Subluminal, FTL: Faster Than Light, o como tu autor de ciencia ficción favorito lo llame), se puede pasar tan rápido que se ignoran los efectos de la radiación"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConVelocidadLuz := self nuevaNaveContrabandistaConVelocidadLuz.
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 0).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConVelocidadLuz}.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 0).
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: (95 - 10)).
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 90 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	
	"El daño proviene aquí de la alta gravedad y no de la radiación..."	
	self assert: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 1).
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: (95 - 20))
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:06:02'!
test14NaveAtravesandoSectorPlanetarioUsandoGravitonesDecrementaManiobravilidadEn20Porciento

	| flota naveContrabandistaConGravitones |
	
	"Si se atraviesa un sector planetario utilizando propulsion por gravitones el piloto tiene mayor dificultad en controlar la nave en el sector. 20% de penalización en su maniobravilidad"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConGravitones := self nuevaNaveContrabandistaConGravitones.
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConGravitones }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 70 * 0.8 yRadiacion: 40 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 10).
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: (70 * 0.8) + 1 yRadiacion: 40 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	
	"La gravedad supera la coordinacion del piloto navegando sector planetario con gravitones, luego la nave es dañada"
	self assert: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones nivelDeDañoEs: 1).
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 20).

! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:05:58'!
test15NaveAtravesandoSectorDeAsteroidesUsandoImpulsoEstandarReduceSusEscudosDeEnergia

	| flota naveContrabandistaConImpulso |
	
	"Si se atraviesa un sector de asteroides utilizando el propulsor de impulso estandar, los escudos indefectiblemente reciben el impacto de los asteroides (nada que pueda hacer el piloto con ese tipo de propulsores) y se reducen permanentemente en 20"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConImpulso := self nuevaNaveContrabandistaConImpulsoEstandar.
	self deny: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso nivelDeDañoEs: 0).
	self assert: (naveContrabandistaConImpulso fuerzaDeEscudosEn: 50).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConImpulso}.
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 65 yRadiacion: 35 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConImpulso).
	self assert: (naveContrabandistaConImpulso fuerzaDeEscudosEn: 50 - 20).
	
	"La nave sufre daño porque los escudos de energia descendieron por debajo de la radiacion del sector"
	self assert: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso nivelDeDañoEs: 1).
	
	

	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:05:53'!
test16NaveAtravesandoSectorDeAsteroidesUsandoVelocidadLuzAgotaSusEscudosACeroYSufreDaños

	| flota naveContrabandistaConVelocidadLuz |
	
	"Si se atraviesa un sector de asteroides utilizando velocidad luz, vas derecho al desastre... quien sea que haya trazado ese curso estará condenado, porque irá en linea recta contra un cinturón de asteroides a la velocidad de la luz (duh!!). En terminos prácticos, la nave pierde todos sus escudos de energía permanentemente (pasan a 0) debido a los impactos con los asteroides, se le inflinje 1 nivel de daño al casco y además casi seguro se le suma otro nivel más por radiación al esta no contar más con sus escudos"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConVelocidadLuz := self nuevaNaveContrabandistaConVelocidadLuz.
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 0).
	self assert: (naveContrabandistaConVelocidadLuz fuerzaDeEscudosEn: 50).
	
	flota := EscapeDeFlota enrolar: { naveContrabandistaConVelocidadLuz }.
	
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 65 yRadiacion: 30 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	
	"Usar Velocidad Luz con asteroides acaba con los escudos y suma 1 nivel de daño al casco".
	"La radición daña adicionalmente al casco de la nave ya que sus escudos se reducen a 0"
	self assert: (naveContrabandistaConVelocidadLuz fuerzaDeEscudosEn: 0).
	self assert: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 1 + 1).
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:05:48'!
test17NaveAtravesandoSectorDeAsteroidesUsandoGravitonesIgnoraGravedadPeroConsumeElDobleDeCombustible

	| flota naveContrabandistaConGravitones |
	
	"Si se atraviesa un sector de asteroides utilizando el avanzado sistema de propulsores basado en Gravitones, el piloto automático de la nave puede sin problema eludirlos sin impactos. Como el piloto no participa, no se tiene en cuenta el rating de maniobrabilidad de la nave, ni la gravedad del sector"
	
	"Al mismo tiempo, lamentablemente el sistema consume el doble de combustible que lo normal"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConGravitones := self nuevaNaveContrabandistaConGravitones.
	
	flota := EscapeDeFlota enrolar: { naveContrabandistaConGravitones}.
	
	"La alta gravedad no son nada para el sistema avanzado de propulsores de Gravitones"
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 90 yRadiacion: 30 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self deny: naveContrabandistaConGravitones dañada.
	"Doble gasto de combustible"
	self assert: (naveContrabandistaConGravitones valorCombustible: (95 - 20)).

	"La radiación del sector es la que produce el daño (60 supera a los 50 de los escudos de la nave) y no la gravedad..."
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 90 yRadiacion: 60 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self assert: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones nivelDeDañoEs: 1).
	"Doble gasto de combustible"
	self assert: (naveContrabandistaConGravitones valorCombustible: (95 - 40))
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 22:47:51'!
test18NaveAtravesandoSectorNebulosaUsandoImpulsoEstandarDecrementaEscudosAl30Porciento

	| flota naveContrabandistaConImpulso |
	
	"Si se atraviesa una nebulosa con propulsores de impulso estandar, se esta mucho tiempo dentro de la misma y los escudos empiezan a perder efectividad. 30% de penalizacion a los escudos mientras se la cruza"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConImpulso := self nuevaNaveContrabandistaConImpulsoEstandar .
	self deny: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConImpulso }.
	
	flota atravesar: { self nuevoSectorNebulosaConGravedad: 50 yRadiacion: 50 * 0.7 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConImpulso).
	self deny: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso valorCombustible: 95 - 10).


	flota atravesar: { self nuevoSectorNebulosaConGravedad: 50 yRadiacion: (50 * 0.7) + 1}.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConImpulso).
	"La radiación supera el desgaste extremo de los escudos, y por lo tanto la nave es dañada"
	self assert: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso nivelDeDañoEs: 1).
	self assert: (naveContrabandistaConImpulso valorCombustible: 95 - 20).
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:05:37'!
test19NaveAtravesandoSectorNebulosaUsandoVelocidadLuzNoConsumeCombustibleEIgnoraGravedadYRadiacionDelSector

	| flota naveContrabandistaConVelocidadLuz |
	
	"Si se viaja hacia una nebulosa utilizando velocidad luz, el modulo Warp se revigoriza por un efecto cuántico bien conocido por el contacto con los gases de la nébula, y casi la teletransporta de inmediato al próximo sector galáctico de la trayectoria del viaje. Luego no se consume combustible, y no se efectua ninguno de los chequeos típicos de supervivencia en el sector"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConVelocidadLuz := self nuevaNaveContrabandistaConVelocidadLuz.
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConVelocidadLuz }.
	
	flota atravesar: { self nuevoSectorNebulosaConGravedad: 90 yRadiacion: 90 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: 95).
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 7/17/2025 21:05:31'!
test20NaveAtravesandoSectorNebulosaUsandoGravitonesEsAfectadaPorGravedadYRadiacionNormalmentePeroConsumientoElTripleDeCombustible

	| flota naveContrabandistaConGravitones |
	
	"La nebulosa afecta los propulsores de gravitones haciendolos menos eficientes. Consume 3 veces el valor de combustible normal sin ningun otro beneficio"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConGravitones := self nuevaNaveContrabandistaConGravitones .
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConGravitones }.
	
	flota atravesar: { self nuevoSectorNebulosaConGravedad: 70 yRadiacion: 50 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 30).

	flota atravesar: { self nuevoSectorNebulosaConGravedad: 71 yRadiacion: 51 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self assert: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones nivelDeDañoEs: 2).
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 60)! !


!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'Buty 10/2/2025 11:28:19'!
nuevaNaveContrabandistaConGravitones

	^ Nave contrabandistaConPropulsor: #Gravitones.! !

!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'Buty 10/2/2025 11:28:34'!
nuevaNaveContrabandistaConImpulsoEstandar

	^ Nave contrabandistaConPropulsor: #Estandar.! !

!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'Buty 10/2/2025 11:28:44'!
nuevaNaveContrabandistaConVelocidadLuz

	^ Nave contrabandistaConPropulsor: #VelocidadLuz.! !

!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'Buty 10/2/2025 11:29:14'!
nuevoCruceroPesadoConImpulsoEstandar

	^ Nave cruceroPesadoConPropulsor: #Estandar.! !


!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'Buty 10/2/2025 15:54:18'!
nuevoSectorDeAsteroidesConGravedad: gravedad yRadiacion: radiacion
	^ Sector conGravedad: gravedad Radiacion: radiacion yTipo: #Asteroides.! !

!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'Buty 10/2/2025 15:54:24'!
nuevoSectorNebulosaConGravedad: gravedad yRadiacion: radiacion
 
	^ Sector conGravedad: gravedad Radiacion: radiacion yTipo: #Nebulosa .! !

!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'Buty 10/2/2025 15:54:30'!
nuevoSectorPlanetarioConGravedad: gravedad yRadiacion: radiacion

	^ Sector conGravedad: gravedad Radiacion: radiacion yTipo: #Planetario .
! !

!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'Buty 10/2/2025 14:49:14'!
nuevoTrayectoDeSectoresPlanetariosDeLongitud: numeroDeSectores conGravedad: gravedad yRadiacion: radiacion
	
	^ (1 to: numeroDeSectores ) collect: [ :i | self nuevoSectorPlanetarioConGravedad:  gravedad yRadiacion: radiacion ]
	! !


!EscapeDeFlotaTests methodsFor: 'propulsores' stamp: 'NR 9/28/2025 00:33:03'!
propulsoresDeGravitones

	self shouldBeImplemented ! !

!EscapeDeFlotaTests methodsFor: 'propulsores' stamp: 'NR 9/28/2025 00:32:59'!
propulsoresDeImpulsoEstandar

	self shouldBeImplemented ! !

!EscapeDeFlotaTests methodsFor: 'propulsores' stamp: 'NR 9/28/2025 00:32:53'!
propulsoresDeVelocidadLuz

	self shouldBeImplemented ! !
