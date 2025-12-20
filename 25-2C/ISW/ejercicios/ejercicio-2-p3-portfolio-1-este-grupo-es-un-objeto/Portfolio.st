!classDefinition: #AccountTransaction category: #Portfolio!
Object subclass: #AccountTransaction
	instanceVariableNames: 'balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!AccountTransaction methodsFor: 'value' stamp: 'SP 10/29/2025 11:44:46'!
operationValue
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'registration' stamp: 'SP 10/28/2025 17:39:19'!
register: aValue on: anAccount
	| transaction |
	
	transaction := self for: aValue.
	anAccount register: transaction.
		
	^ transaction ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #Portfolio!
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


!classDefinition: #Deposit category: #Portfolio!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

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

!classDefinition: 'Deposit class' category: #Portfolio!
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


!classDefinition: #Withdraw category: #Portfolio!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

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

!classDefinition: 'Withdraw class' category: #Portfolio!
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


!classDefinition: #FinancialAssets category: #Portfolio!
Object subclass: #FinancialAssets
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'SP 10/30/2025 21:09:01'!
accountsIncludes: anAsset
	self subclassResponsibility ! !

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'SP 10/30/2025 21:10:04'!
accountsIsEmpty

	self subclassResponsibility! !

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'SP 10/30/2025 21:11:51'!
accountsSize

	self subclassResponsibility! !

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


!classDefinition: #Portfolio category: #Portfolio!
FinancialAssets subclass: #Portfolio
	instanceVariableNames: 'assets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!Portfolio methodsFor: 'asserts' stamp: 'SP 10/30/2025 21:07:18'!
accountsIncludes: anAccount
	^ (assets includes: anAccount) or: 
	[assets anySatisfy: [:anAsset | (anAsset isKindOf: Portfolio) and: [anAsset accountsIncludes: anAccount]]]! !

!Portfolio methodsFor: 'asserts' stamp: 'BSN 10/31/2025 14:48:07'!
accountsIsEmpty
	^ assets allSatisfy: [:asset | asset accountsIsEmpty].! !

!Portfolio methodsFor: 'asserts' stamp: 'SP 10/29/2025 12:21:58'!
hasRegistered: aTransaction
	^ assets anySatisfy: [:anAsset | anAsset hasRegistered: aTransaction]! !


!Portfolio methodsFor: 'initialization' stamp: 'SP 10/29/2025 12:20:01'!
initialize
	assets := OrderedCollection new.
	transactions := OrderedCollection new.! !


!Portfolio methodsFor: 'management' stamp: 'SP 10/30/2025 21:07:18'!
add: anAsset
	(self accountsIncludes: anAsset) ifTrue: [self error: self class errorAssetAlreadyIncluded] ifFalse: [assets add: anAsset]! !

!Portfolio methodsFor: 'management' stamp: 'SP 10/29/2025 12:35:10'!
register: aTransaction
	self error: self class errorPortfolioCantRegisterTransactions! !

!Portfolio methodsFor: 'management' stamp: 'SP 10/30/2025 21:13:03'!
with: anAsset
	assets add: anAsset ! !

!Portfolio methodsFor: 'management' stamp: 'SP 10/30/2025 21:13:47'!
with: anAsset with: anotherAsset
	assets add: anAsset.
	assets add: anotherAsset.! !


!Portfolio methodsFor: 'control' stamp: 'BSN 10/31/2025 14:41:13'!
accountsSize
	| size |
	size := 0.
	assets do: [:asset | size := size + asset accountsSize ].! !

!Portfolio methodsFor: 'control' stamp: 'SP 10/29/2025 12:20:26'!
assets
	^ assets! !

!Portfolio methodsFor: 'control' stamp: 'SP 10/29/2025 12:16:03'!
balance 
	^ assets sum: [:anAsset | anAsset balance] ifEmpty: [0]! !

!Portfolio methodsFor: 'control' stamp: 'BSN 10/31/2025 15:22:36'!
transactions 
	|transactions|
	transactions := OrderedCollection new.
	assets do: [:anAccount | transactions addAll: (anAccount transactions)].
	^ transactions .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #Portfolio!
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


!classDefinition: #ReceptiveAccount category: #Portfolio!
FinancialAssets subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'BSN 10/31/2025 15:23:43'!
transactions 

	^ transactions copy.! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'SP 10/29/2025 11:44:46'!
balance

"(aTransaction isKindOf: Withdraw) ifTrue:[ (aTransaction value) negated] ifFalse: [aTransaction value]"

	^transactions sum: [ :aTransaction | aTransaction operationValue] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'SP 10/30/2025 21:09:24'!
accountsIncludes: anAsset
	self error: self class errorAnAccountCantHaveAccountsInside! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'SP 10/30/2025 21:10:57'!
accountsIsEmpty
	^ false ! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'BSN 10/31/2025 14:39:12'!
accountsSize
	^ 1.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'management' stamp: 'SP 10/29/2025 12:09:29'!
add: anAccount
	^ self error: self class errorAnAccountCantHaveAccountsInside! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: #Portfolio!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'errors' stamp: 'SP 10/29/2025 12:09:29'!
errorAnAccountCantHaveAccountsInside
	^ 'An account cant have accounts inside'! !


!classDefinition: #FinancialAssetsTests category: #Portfolio!
TestCase subclass: #FinancialAssetsTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 12:20:26'!
test01PortfolioNuevoEmpiezaSinCuentas
	| portfolio |
	portfolio := Portfolio new.
	self assert: (portfolio assets) isEmpty! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:18:50'!
test02PortfolioAgregaCorrectamenteUnaCuenta
	| cuenta portfolio listaDeCuentas |
	
	portfolio := Portfolio new.
	
	cuenta := ReceptiveAccount new.
	listaDeCuentas := OrderedCollection new.
	listaDeCuentas add: cuenta.
	
	portfolio add: cuenta.
	self assert: (portfolio assets = listaDeCuentas) ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:19:03'!
test03PortfolioAgregaCorrectamenteDosCuentas
	| cuenta1 cuenta2 portfolio listaDeCuentas |
	
	portfolio := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	listaDeCuentas := OrderedCollection new.
	listaDeCuentas add: cuenta1.
	listaDeCuentas add: cuenta2.
	
	portfolio add: cuenta1.
	portfolio add: cuenta2.
	
	self assert: (portfolio assets = listaDeCuentas) ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:32:11'!
test03PortfolioSinCuentasDevuelveBalanceCero
	| portfolio |

	portfolio := Portfolio new.
	
	self assert: (portfolio balance = 0).! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:19:22'!
test05PortfolioConUnaCuentaDevuelveBalanceCorrecto
	| cuenta portfolio transaccion |

	portfolio := Portfolio new.
	
	cuenta := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta.
	
	portfolio add: cuenta.
	
	self assert: (portfolio balance = 50)
	 
	! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:19:35'!
test06PortfolioConDosCuentasDevuelveBalanceCorrecto
	| cuenta1 cuenta2 portfolio transaccion1 transaccion2 |
	portfolio := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	transaccion1 := Deposit register: 50 on: cuenta1.
	
	cuenta2 := ReceptiveAccount new.
	transaccion2  := Deposit register: 50 on: cuenta2.
	
	portfolio add: cuenta1.
	portfolio add: cuenta2. 
	
	self assert: (portfolio balance = 100)
	! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:35:18'!
test07PortfolioSinTrasaccionesDevuelveCollectionVacia
	| portfolio |

	portfolio := Portfolio new.
	self assert: (portfolio transactions = OrderedCollection new)! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:19:55'!
test08PortfolioDevuelveUnaTransaccionDeUnaCuentaCorrectamente
	| cuenta portfolio transaccion |

	portfolio := Portfolio new.
	
	cuenta := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta.
	
	portfolio add: cuenta.
	
	self assert: (portfolio transactions = cuenta transactions)! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:20:04'!
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
	
	portfolio add: cuenta1.
	portfolio add: cuenta2.
	
	self assert: (portfolio transactions =  listaDeTransacciones )! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/29/2025 11:37:20'!
test10PortfolioSinTransaccionesNoRegistraTransacciones
	| cuenta portfolio transaccion |

	portfolio := Portfolio new.
	cuenta := ReceptiveAccount new.
	
	transaccion := Deposit register: 50 on: cuenta.
	
	self deny: (portfolio hasRegistered: transaccion)
	
	! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:20:23'!
test11PortfolioRegistraUnaTransaccionCorrectamente
	| cuenta portfolio transaccion |

	portfolio := Portfolio new.
	cuenta := ReceptiveAccount new.
	
	transaccion := Deposit register: 50 on: cuenta.
	portfolio add: cuenta.
	
	self assert: (portfolio hasRegistered: transaccion)! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:20:48'!
test12PortfolioRegistraDosTransaccionesDeCuentasDistintasCorrectamente
	| cuenta1 cuenta2 portfolio transaccion1 transaccion2 |

	portfolio := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	transaccion1 := Deposit register: 50 on: cuenta1.
	transaccion2 := Deposit register: 50 on: cuenta2.
	
	portfolio add: cuenta1.
	portfolio add: cuenta2.
	
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

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:28:51'!
test17PortfolioConUnPortfolioVacioAdentroDevuelveBalanceEnCero
	| portfolio subPortfolio |
	portfolio := Portfolio new.
	subPortfolio := Portfolio new.
	
	portfolio add: subPortfolio.
	
	self assert: (portfolio balance = 0).! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:30:25'!
test18PortfolioConUnPortfolioNoVacioAdentroDevuelveBalanceCorrecto
	| portfolio subPortfolio cuenta transaccion |
	portfolio := Portfolio new.
	subPortfolio := Portfolio new.
	cuenta := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta.
	
	portfolio add: subPortfolio.
	subPortfolio add: cuenta.
	
	self assert: (portfolio balance = 50). ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:32:13'!
test19PortfolioConDosPortfoliosNoVaciosAdentroDevuelvenBalanceCorrecto
	| portfolio subPortfolio1 subPortfolio2 cuenta1 cuenta2 transaccion |
	portfolio := Portfolio new.
	subPortfolio1 := Portfolio new.
	subPortfolio2 := Portfolio new.
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta1.
	transaccion := Deposit register: 50 on: cuenta2.
	
	portfolio add: subPortfolio1.
	subPortfolio1 add: cuenta1.
	
	portfolio add: subPortfolio2.
	subPortfolio2 add: cuenta2.
	
	self assert: (portfolio balance = 100). ! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:33:35'!
test20PortfolioConUnPortfolioVacioAdentroDevuelveCollectionDeTransactionsVacia
	| portfolio subPortfolio |
	portfolio := Portfolio new.
	subPortfolio := Portfolio new.
	
	portfolio add: subPortfolio.
	
	self assert: (portfolio transactions = OrderedCollection new)! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:35:08'!
test21PortfolioConUnPortfolioNoVacioAdentroDevuelveTransactionsCorrectamente
	| portfolio subPortfolio cuenta transaccion |
	portfolio := Portfolio new.
	subPortfolio := Portfolio new.
	cuenta := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta.
	
	portfolio add: subPortfolio.
	subPortfolio add: cuenta.
	
	self assert: (portfolio transactions = cuenta transactions )! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'BSN 10/31/2025 15:27:19'!
test22PortfolioConDosPortfoliosNoVaciosAdentroDevuelveTransactionsCorrectamente
	| portfolio subPortfolio1 subPortfolio2 cuenta1 cuenta2 transaccion1 transaccion2 |
	portfolio := Portfolio new.
	subPortfolio1 := Portfolio new.
	subPortfolio2 := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	transaccion1 := Deposit register: 50 on: cuenta1.
	transaccion2 := Deposit register: 50 on: cuenta2.
	
	portfolio add: subPortfolio1.
	subPortfolio1 add: cuenta1.
	portfolio add: subPortfolio2.
	subPortfolio2 add: cuenta2.
	
	self assert: (portfolio transactions) = (cuenta1 transactions , cuenta2 transactions)! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:43:28'!
test23PortfolioConUnPortfolioVacioAdentroNoRegistraTransacciones
	| portfolio cuenta subPortfolio transaccion |
	portfolio := Portfolio new.
	subPortfolio := Portfolio new.
	
	cuenta := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta.
	
	self deny: (portfolio hasRegistered: transaccion)
	
	 
	
	! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:45:01'!
test24PortfolioConUnPortfolioNoVacioAdentroRegistraTransaccionesCorrectamente
	| portfolio cuenta subPortfolio transaccion |
	portfolio := Portfolio new.
	subPortfolio := Portfolio new.
	
	cuenta := ReceptiveAccount new.
	transaccion := Deposit register: 50 on: cuenta.
	
	portfolio add: subPortfolio.
	subPortfolio add: cuenta.
	
	self assert: (portfolio hasRegistered: transaccion)! !

!FinancialAssetsTests methodsFor: 'tests' stamp: 'SP 10/30/2025 21:45:53'!
test25PortfolioConDosPortfoliosNoVaciosAdentroRegistraTransaccionesCorrectamente
	| portfolio subPortfolio1 subPortfolio2 cuenta1 cuenta2 transaccion1 transaccion2 |
	portfolio := Portfolio new.
	subPortfolio1 := Portfolio new.
	subPortfolio2 := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	transaccion1 := Deposit register: 50 on: cuenta1.
	transaccion2 := Deposit register: 50 on: cuenta2.
	
	portfolio add: subPortfolio1.
	subPortfolio1 add: cuenta1.
	portfolio add: subPortfolio2.
	subPortfolio2 add: cuenta2.
	
	self assert: (portfolio hasRegistered: transaccion1).
	self assert: (portfolio hasRegistered: transaccion2).! !


!classDefinition: #ReceptiveAccountTest category: #Portfolio!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

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

Portfolio initialize!(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 105 124 123 128 54 75 118 106 124 116 108 117 123 122 54 92 73 72 52 74 90 54 57 60 52 57 74 54 80 90 94 54 74 124 112 122 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 17 54 111 118 116 108 54 105 124 123 128 54 75 118 106 124 116 108 117 123 122 54 92 73 72 52 74 90 54 57 60 52 57 74 54 80 90 94 54 74 124 112 122 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 61 53 56 61 53 58 52 62 61 55 61 56 61 55 58 52 110 108 117 108 121 112 106 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 86 106 123 39 39 62 39 57 55 57 60 39 56 59 65 55 63 65 57 62 39 74 118 116 119 112 115 108 121 65 39 60 53 59 53 55 39 57 55 56 61 55 61 55 64 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 107 211 17 56 64 57 53 56 61 63 53 56 55 55 53 57 55 59 17 119 118 119 52 118 122 17 119 118 119 52 118 122 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 58 56 91 56 59 65 56 58 65 59 58 53 61 62 64 55 62 61 52 55 58 65 55 55 17 54 111 118 116 108 54 105 124 123 128 54 75 118 106 124 116 108 117 123 122 54 92 73 72 52 74 90 54 57 60 52 57 74 54 80 90 94 54 108 113 108 121 106 112 106 112 118 52 57 52 119 58 52 119 118 121 123 109 118 115 112 118 52 56 52 108 122 123 108 52 110 121 124 119 118 52 108 122 52 124 117 52 118 105 113 108 123 118 54 87 118 121 123 109 118 115 112 118 53 122 123 17 57 57 60 59 60 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 58 56 91 56 60 65 57 62 65 60 61 53 62 58 55 62 63 62 52 55 58 65 55 55 17 54 111 118 116 108 54 105 124 123 128 54 75 118 106 124 116 108 117 123 122 54 92 73 72 52 74 90 54 57 60 52 57 74 54 80 90 94 54 87 118 121 123 109 118 115 112 118 53 122 123 17 57 57 59 63 62 17 52 52 52 52 52 52 52 52 52 52 17 17))!