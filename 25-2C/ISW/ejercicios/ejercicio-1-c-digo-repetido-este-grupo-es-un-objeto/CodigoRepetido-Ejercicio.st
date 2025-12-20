!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'Buty 9/12/2025 11:16:07'!
includesCustomerNamed: aName

	^self allCustomers includes: aName.! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Buty 9/12/2025 11:18:00'!
addCustomerNamed: aCustomerName

	aCustomerName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aCustomerName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aCustomerName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'Buty 9/12/2025 10:41:10'!
allCustomers
	^ active, suspended.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Buty 9/12/2025 11:51:38'!
numberOfCustomers
	
	^self allCustomers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Buty 9/12/2025 12:45:53'!
removeCustomer: aClientName from: aCollection
    ^ aCollection remove: aClientName ifAbsent: [ nil ].
	

	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'Buty 9/12/2025 12:48:34'!
removeCustomerNamed: aClientName 
	(self removeCustomer: aClientName from: active) ifNotNil: [^ self].
	(self removeCustomer: aClientName from: suspended) ifNotNil: [^ self].	
	^ NotFound signal.

	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'Buty 9/12/2025 12:57:40'!
suspendCustomerNamed: aCustomerName 
	active remove: aCustomerName ifAbsent: [^CantSuspend signal].
	suspended add: aCustomerName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !


!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'Buty 9/12/2025 16:38:21'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook agregarJohnLenon tiempoMaximoEsperado operationTime| 
	
	customerBook := CustomerBook new.
	agregarJohnLenon := [customerBook addCustomerNamed: 'John Lennon'.].
	tiempoMaximoEsperado := (50 * millisecond).
	operationTime := self calculateOperationTime: agregarJohnLenon.
	
	self assert:  operationTime < tiempoMaximoEsperado.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Buty 9/12/2025 16:39:26'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney sacarPaulMcCartney tiempoMaximoEsperado operationTime|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	sacarPaulMcCartney := [customerBook removeCustomerNamed: paulMcCartney.].
	tiempoMaximoEsperado := (100 * millisecond).
	operationTime := self calculateOperationTime: sacarPaulMcCartney.
	
	self assert: operationTime < tiempoMaximoEsperado.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Buty 9/12/2025 16:30:00'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self should: [ customerBook addCustomerNamed: '' ]
		raise: Error
		withMessage: CustomerBook customerCanNotBeEmptyErrorMessage
		when: [ self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Buty 9/12/2025 16:31:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook removeCustomerNamed: 'Paul McCartney']
		raise: NotFound
		withMessage: nil
		when: [
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Buty 9/12/2025 16:48:10'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self in: customerBook activeSizeIs: 0 suspendedSizeIs:1.

	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Buty 9/12/2025 16:48:32'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self in: customerBook activeSizeIs: 0 suspendedSizeIs: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Buty 9/12/2025 16:32:25'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: 'George Harrison']
		raise: CantSuspend 
		withMessage: nil
		when: [ 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Buty 9/12/2025 16:33:45'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: johnLennon]
		raise: CantSuspend 
		withMessage: nil
		when: [ 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!CustomerBookTest methodsFor: 'helper' stamp: 'Buty 9/12/2025 16:36:47'!
calculateOperationTime: closureWithOperation
	| millisecondsBeforeRunning millisecondsAfterRunning executionTimeInMiliseconds|
	
	millisecondsBeforeRunning := self calculateTimeInMiliseconds.
	closureWithOperation.
	millisecondsAfterRunning := self calculateTimeInMiliseconds.
	
	executionTimeInMiliseconds := (millisecondsAfterRunning-millisecondsBeforeRunning).
	
	^executionTimeInMiliseconds 
! !

!CustomerBookTest methodsFor: 'helper' stamp: 'Buty 9/12/2025 16:36:19'!
calculateTimeInMiliseconds
	^ Time millisecondClockValue.! !

!CustomerBookTest methodsFor: 'helper' stamp: 'Buty 9/12/2025 16:47:16'!
in: aCustomerBook activeSizeIs: activeCustomers suspendedSizeIs: suspendedCustomers

self assert: activeCustomers equals: aCustomerBook numberOfActiveCustomers.
self assert: suspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
self assert: (activeCustomers + suspendedCustomers) equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'helper' stamp: 'Buty 9/12/2025 16:25:33'!
should: aBlock raise: anErrorClass withMessage: expectedMessage when: postAssertionBlock
    [ aBlock value.
      self fail ]
        on: anErrorClass
        do: [ :ex |
            expectedMessage ifNotNil: [
                self assert: ex messageText = expectedMessage ].
            postAssertionBlock value ].
! !
