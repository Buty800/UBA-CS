!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'SP 10/29/2025 11:44:46'!
operationValue
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SP 10/28/2025 17:39:19'!
register: aValue on: anAccount
	| transaction |
	
	transaction := self for: aValue.
	anAccount register: transaction.
		
	^ transaction ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'SP 10/28/2025 17:39:58'!
register: aValue on: account
"
	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction"
	
	self subclassResponsibility ! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'SP 10/29/2025 11:44:46'!
operationValue
	^ self value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'SP 10/28/2025 17:40:33'!
register: aValue on: anAccount

	| transaction |
	
	transaction := self for: aValue.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'SP 10/29/2025 11:44:46'!
operationValue
	^ value negated! !

!Withdraw methodsFor: 'value' stamp: 'SP 10/28/2025 17:51:25'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'SP 10/28/2025 17:47:38'!
for: aValue

	^ self new initializeFor: aValue  ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'SP 10/28/2025 17:44:54'!
register: aValue on: anAccount
	| transaction |
	
	transaction := self for: aValue.
	anAccount register: transaction.
		
	^ transaction ! !


!classDefinition: #FinancialAssets category: #'Portfolio-Ejercicio'!
Object subclass: #FinancialAssets
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:03:58'!
add: anAsset
	self subclassResponsibility ! !

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:04:20'!
balance
	self subclassResponsibility ! !

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:04:50'!
hasRegistered: aTransaction
	self subclassResponsibility ! !

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:34:33'!
register: aTransaction
	self subclassResponsibility ! !

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:04:30'!
transactions
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
FinancialAssets subclass: #Portfolio
	instanceVariableNames: 'assets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:16:03'!
add: anAsset
	(self includesAccount: anAsset) ifTrue: [self error: self class errorAssetAlreadyIncluded] ifFalse: [assets add: anAsset]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:16:03'!
addAcount: unaCuenta
	assets add: unaCuenta ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:20:26'!
assets
	^ assets! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:16:03'!
balance 
	^ assets sum: [:anAsset | anAsset balance] ifEmpty: [0]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:16:03'!
enumerateTransactions

	^ assets do: [:anAccount | anAccount transactions do: [:aTransaction |
			transactions add: aTransaction 
			]]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:21:58'!
hasRegistered: aTransaction
	^ assets anySatisfy: [:anAsset | anAsset hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:16:03'!
includesAccount: anAccount
	^ (assets includes: anAccount) or: 
	[assets anySatisfy: [:anAsset | (anAsset isKindOf: Portfolio) and: [anAsset includesAccount: anAccount]]]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:20:01'!
initialize
	assets := OrderedCollection new.
	transactions := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:35:10'!
register: aTransaction
	self error: self class errorPortfolioCantRegisterTransactions! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 11:41:57'!
transactions 
	self enumerateTransactions.
	^ transactions ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:14:57'!
errorAssetAlreadyIncluded
	^ 'Given asset is already included in portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'SP 10/29/2025 12:35:51'!
errorPortfolioCantRegisterTransactions
	^ 'Portfolios cant register transactions'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'SP 10/28/2025 18:11:12'!
initialize
	^ self new initialize ! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
FinancialAssets subclass: #ReceptiveAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'SP 10/29/2025 11:44:46'!
balance

"(aTransaction isKindOf: Withdraw) ifTrue:[ (aTransaction value) negated] ifFalse: [aTransaction value]"

	^transactions sum: [ :aTransaction | aTransaction operationValue] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'management' stamp: 'SP 10/29/2025 12:09:29'!
add: anAccount
	^ self error: self class errorAnAccountCantHaveAccountsInside! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: #'Portfolio-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'errors' stamp: 'SP 10/29/2025 12:09:29'!
errorAnAccountCantHaveAccountsInside
	^ 'An account cant have accounts inside'! !


!classDefinition: #FinancialAssetsTests category: #'Portfolio-Ejercicio'!
TestCase subclass: #FinancialAssetsTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:20:26'!
test01PortfolioNuevoEmpiezaSinCuentas
	| portfolio |
	portfolio := Portfolio new.
	self assert: (portfolio assets) isEmpty! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:20:26'!
test02PortfolioAgregaCorrectamenteUnaCuenta
	| cuenta portfolio listaDeCuentas |
	
	portfolio := Portfolio new.
	
	cuenta := ReceptiveAccount new.
	listaDeCuentas := OrderedCollection new.
	listaDeCuentas add: cuenta.
	
	portfolio addAcount: cuenta.
	self assert: (portfolio assets = listaDeCuentas) ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:20:26'!
test03PortfolioAgregaCorrectamenteDosCuentas
	| cuenta1 cuenta2 portfolio listaDeCuentas |
	
	portfolio := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	listaDeCuentas := OrderedCollection new.
	listaDeCuentas add: cuenta1.
	listaDeCuentas add: cuenta2.
	
	portfolio addAcount: cuenta1.
	portfolio addAcount: cuenta2.
	
	self assert: (portfolio assets = listaDeCuentas) ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:32:11'!
test03PortfolioSinCuentasDevuelveBalanceCero
	| portfolio |

	portfolio := Portfolio new.
	
	self assert: (portfolio balance = 0).! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:43:28'!
test05PortfolioConUnaCuentaDevuelveBalanceCorrecto
	| cuenta portfolio transaccion |

	portfolio := Portfolio new.
	
	cuenta := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta.
	
	portfolio addAcount: cuenta.
	
	self assert: (portfolio balance = 50)
	 
	! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:43:28'!
test06PortfolioConDosCuentasDevuelveBalanceCorrecto
	| cuenta1 cuenta2 portfolio transaccion1 transaccion2 |
	portfolio := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	transaccion1 := Deposit register: 50 on: cuenta1.
	
	cuenta2 := ReceptiveAccount new.
	transaccion2  := Deposit register: 50 on: cuenta2.
	
	portfolio addAcount: cuenta1.
	portfolio addAcount: cuenta2. 
	
	self assert: (portfolio balance = 100)
	! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:35:18'!
test07PortfolioSinTrasaccionesDevuelveCollectionVacia
	| portfolio |

	portfolio := Portfolio new.
	self assert: (portfolio transactions = OrderedCollection new)! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:43:28'!
test08PortfolioDevuelveUnaTransaccionDeUnaCuentaCorrectamente
	| cuenta portfolio transaccion |

	portfolio := Portfolio new.
	
	cuenta := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta.
	
	portfolio addAcount: cuenta.
	
	self assert: (portfolio transactions = cuenta transactions)! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:43:28'!
test09PortfolioDevuelveDosTransaccionesDeCuentasDistintas
	| cuenta1 cuenta2 portfolio transaccion1 transaccion2 listaDeTransacciones |

	portfolio := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	transaccion1 := Deposit register: 50 on: cuenta1.
	transaccion2 := Deposit register: 50 on: cuenta2.
	
	listaDeTransacciones := OrderedCollection new.
	listaDeTransacciones add: transaccion1.
	listaDeTransacciones add: transaccion2.
	
	portfolio addAcount: cuenta1.
	portfolio addAcount: cuenta2.
	
	self assert: (portfolio transactions =  listaDeTransacciones )! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:37:20'!
test10PortfolioSinTransaccionesNoRegistraTransacciones
	| cuenta portfolio transaccion |

	portfolio := Portfolio new.
	cuenta := ReceptiveAccount new.
	
	transaccion := Deposit register: 50 on: cuenta.
	
	self deny: (portfolio hasRegistered: transaccion)
	
	! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:43:28'!
test11PortfolioRegistraUnaTransaccionCorrectamente
	| cuenta portfolio transaccion |

	portfolio := Portfolio new.
	cuenta := ReceptiveAccount new.
	
	transaccion := Deposit register: 50 on: cuenta.
	portfolio addAcount: cuenta.
	
	self assert: (portfolio hasRegistered: transaccion)! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:43:28'!
test12PortfolioRegistraDosTransaccionesDeCuentasDistintasCorrectamente
	| cuenta1 cuenta2 portfolio transaccion1 transaccion2 |

	portfolio := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	transaccion1 := Deposit register: 50 on: cuenta1.
	transaccion2 := Deposit register: 50 on: cuenta2.
	
	portfolio addAcount: cuenta1.
	portfolio addAcount: cuenta2.
	
	self assert: (portfolio hasRegistered: transaccion1).
	self assert: (portfolio hasRegistered: transaccion2).
	! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:29:38'!
test13ReceptiveAccountNoPuedeTenerCuentasAdentro
	| cuenta1 cuenta2 |
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	self 
		should: [ cuenta1 add: cuenta2 ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: ReceptiveAccount errorAnAccountCantHaveAccountsInside 
	! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:31:31'!
test14PortfolioNoPuedeTenerCuentasRepetidas
	| cuenta portfolio |
	portfolio := Portfolio new.
	cuenta := ReceptiveAccount new.
	
	portfolio add: cuenta.
	
	self 
		should: [ portfolio add: cuenta ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: Portfolio errorAssetAlreadyIncluded ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:32:36'!
test15PortfolioNoPuedeTenerPortfoliosRepetidos
	| portfolio1 portfolio2 |
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 add: portfolio2.
	
	self 
		should: [ portfolio1 add: portfolio2 ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: Portfolio errorAssetAlreadyIncluded ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:37:44'!
test16PortfolioNoPuedeRegistrarTransacciones
	| portfolio cuenta transaccion |
	portfolio := Portfolio new.
	cuenta := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta. 
	
	self 
		should: [ portfolio register: transaccion] 
		raise: Error-MessageNotUnderstood 
		withMessageText: Portfolio errorPortfolioCantRegisterTransactions ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:42:33'!
test17PortfolioConUnPortfolioVacioAdentroDevuelveBalanceEnCero
	self shouldBeImplemented ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:42:18'!
test18PortfolioConUnPortfolioNoVacioAdentroDevuelveBalanceCorrecto
	self shouldBeImplemented ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:43:07'!
test19PortfolioConDosPortfoliosNoVaciosAdentroDevuelvenBalanceCorrecto
	self shouldBeImplemented ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:43:26'!
test20PortfolioConUnPortfolioVacioAdentroDevuelveCollectionVacia
	self shouldBeImplemented ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:44:00'!
test21PortfolioConUnPortfolioNoVacioAdentroDevuelveTransactionsCorrectamente
	self shouldBeImplemented ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:44:24'!
test22PortfolioConDosPortfoliosNoVaciosAdentroDevuelveTransactionsCorrectamente
	self shouldBeImplemented ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:45:29'!
test23PortfolioConUnPortfolioVacioAdentroNoRegistraTransacciones
	self shouldBeImplemented ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:46:31'!
test24PortfolioConUnPortfolioNoVacioAdentroRegistraTransaccionesCorrectamente
	self shouldBeImplemented ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:46:22'!
test25PortfolioConDosPortfoliosNoVaciosAdentroRegistraTransaccionesCorrectamente
	self shouldBeImplemented ! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !

Portfolio initialize!