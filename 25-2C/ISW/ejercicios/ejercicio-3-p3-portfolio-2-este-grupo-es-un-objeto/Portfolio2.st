!classDefinition: #Account category: 'Portfolio2'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!Account methodsFor: 'reports' stamp: 'SP 11/6/2025 17:00:02'!
generateAccountSummary

	self subclassResponsibility! !


!classDefinition: #Portfolio category: 'Portfolio2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reports' stamp: 'SP 11/6/2025 17:00:02'!
generateAccountSummary
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'SP 11/7/2025 11:34:12'!
generateAccountSummary
	| finalAmountDeposits finalAmountWithdraws resumen finalAmountTransferInput |
	resumen := WriteStream on: String new.
	finalAmountDeposits := 0.
	finalAmountWithdraws := 0.
	finalAmountTransferInput := 0.
	
	self transactions do: [:transaction | 
		(transaction isKindOf: Deposit)  ifTrue: [finalAmountDeposits := finalAmountDeposits + transaction value. 
											 resumen nextPutAll: 'Depósito por ' , finalAmountDeposits asString].
		(transaction isKindOf: Withdraw)  ifTrue: [finalAmountWithdraws := finalAmountWithdraws + transaction value.
												resumen nextPutAll: 'Extracción por ' , finalAmountWithdraws asString].
		(transaction isKindOf: Transfer) ifTrue: [ self shouldBeImplemented ] ifFalse: 
		[resumen nextPutAll: ('Depósito por 0 ' , 'Extracción por 0' , 'Salida por transferencia por 0' , 'Entrada por transferencia por 0' , 'Balance = ', (self balance) asString)]
		 
	].
	^ resumen nextPutAll: ('Salida por transferencia por 0' , 'Entrada por transferencia por 0' , 'Balance = ', (self balance) asString) ! !


!classDefinition: #AccountTransaction category: 'Portfolio2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio2'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: 'Portfolio2'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Report methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:28:56'!
on: anAccount
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'Portfolio2'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:28:43'!
on: anAccount
	^ self new on: anAccount ! !


!classDefinition: #AccountSummary category: 'Portfolio2'!
Report subclass: #AccountSummary
	instanceVariableNames: 'asset summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:29:22'!
on: anAsset 
	asset := anAsset.
	summary := asset generateAccountSummary

	                                
								     
								    
								     ! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:22:37'!
value 
	^ summary ! !


!classDefinition: #TransferNet category: 'Portfolio2'!
Report subclass: #TransferNet
	instanceVariableNames: 'net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferNet methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:30:08'!
on: anAsset
	self shouldBeImplemented ! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:30:34'!
value
	^ net! !


!classDefinition: #Transfer category: 'Portfolio2'!
Object subclass: #Transfer
	instanceVariableNames: 'depositLeg withdrawLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Transfer methodsFor: 'testing' stamp: 'SP 11/7/2025 11:19:48'!
depositLeg
	^ depositLeg! !

!Transfer methodsFor: 'testing' stamp: 'SP 11/4/2025 17:48:35'!
value
	^ value! !

!Transfer methodsFor: 'testing' stamp: 'SP 11/7/2025 11:20:02'!
withdrawLeg
	^ withdrawLeg! !


!Transfer methodsFor: 'asserts' stamp: 'SP 11/7/2025 11:20:02'!
isValidTransference
	((withdrawLeg isKindOf: WithdrawLeg ) and: [depositLeg isKindOf: DepositLeg ]) ifFalse: 
	[self error: self class errorTransferenceSenderOrReceiverShouldBeAReceptiveAccount ].
	(value isKindOf: Number) ifFalse: [self error: self class errorValueShouldBeANumber].! !


!Transfer methodsFor: 'initialize' stamp: 'SP 11/6/2025 12:12:52'!
initializeFor: anAccount on: aTransference
	self subclassResponsibility ! !

!Transfer methodsFor: 'initialize' stamp: 'SP 11/7/2025 11:20:02'!
register: aNumber from: anAccount to: anotherAccount 
	value := aNumber.
	withdrawLeg := WithdrawLeg initializeFor: anAccount on: self.
	depositLeg := DepositLeg initializeFor: anotherAccount on: self.
	self isValidTransference.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'error' stamp: 'SP 11/4/2025 17:44:21'!
errorTransferenceSenderOrReceiverShouldBeAReceptiveAccount
	^ 'The sender or receiver set is not a ReceptiveAccount instance as it should be'! !

!Transfer class methodsFor: 'error' stamp: 'SP 11/4/2025 18:21:09'!
errorValueShouldBeANumber
	^ 'The value of a transference should be a number'! !


!Transfer class methodsFor: 'initialize' stamp: 'SP 11/6/2025 12:13:14'!
initializeFor: anAccount on: aTransference
	^ self new initializeFor: anAccount on: aTransference ! !

!Transfer class methodsFor: 'initialize' stamp: 'SP 11/7/2025 11:04:28'!
register: anAccount from: anotherAccount to: aNumber 
	^ self new register: anAccount from: anotherAccount to: aNumber! !


!classDefinition: #DepositLeg category: 'Portfolio2'!
Transfer subclass: #DepositLeg
	instanceVariableNames: 'deposit transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'SP 11/6/2025 12:15:59'!
initializeFor: anAccount on: aTransference
	(anAccount isKindOf: ReceptiveAccount ) ifFalse: 
	[self error: self class errorTransferenceSenderOrReceiverShouldBeAReceptiveAccount ].
	deposit := Deposit register: (aTransference value) on: anAccount.
	transference := aTransference ! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:05:29'!
transfer
	^ transference ! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:06:12'!
withdrawLeg
	^ self transfer withdrawLeg ! !


!classDefinition: #WithdrawLeg category: 'Portfolio2'!
Transfer subclass: #WithdrawLeg
	instanceVariableNames: 'withdraw transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:06:41'!
depositLeg
	^ self transfer depositLeg ! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'SP 11/6/2025 12:16:11'!
initializeFor: anAccount on: aTransference
	(anAccount isKindOf: ReceptiveAccount ) ifFalse: 
	[self error: self class errorTransferenceSenderOrReceiverShouldBeAReceptiveAccount ].
	withdraw := Withdraw register: (aTransference value) on: anAccount.
	transference := aTransference ! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'SP 11/7/2025 11:05:29'!
transfer
	^ transference ! !


!classDefinition: #PortfolioTest category: 'Portfolio2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #ReportTest category: 'Portfolio2'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!ReportTest methodsFor: 'test' stamp: 'SP 11/7/2025 11:29:22'!
test01AccountSummaryForEmptyAccountShouldBeAllZeros
	| account accountSummary |
	account := ReceptiveAccount new.
	accountSummary := AccountSummary on: account.
	
	self assert: (accountSummary value = ('Déposito por 0' , 'Extracción por 0' , 'Salida por transferencia por 0' , 'Entrada por transferencia por 0' , 'Balance = 0'))
	
	! !

!ReportTest methodsFor: 'test' stamp: 'SP 11/7/2025 11:29:22'!
test02AccountSummaryForAccountWithDepositReturnsCorrectSummary
	| account accountSummary |
	account := ReceptiveAccount new.
	Deposit register: 50 on: account.
	accountSummary := AccountSummary on: account.
	
	self assert: (accountSummary value = ('Déposito por 50' , 'Extracción por 0' , 'Salida por transferencia por 0' , 'Entrada por transferencia por 0' , 'Balance = 50'))
	! !

!ReportTest methodsFor: 'test' stamp: 'SP 11/7/2025 11:29:22'!
test03AccountSummaryForAccountWithDepositAndWithdrawReturnsCorrectSummary
	| account accountSummary |
	account := ReceptiveAccount new.
	Deposit register: 50 on: account.
	Withdraw register: 50 on: account.
	accountSummary := AccountSummary on: account.
	
	self assert: (accountSummary value = ('Déposito por 50' , 'Extracción por 50' , 'Salida por transferencia por 0' , 'Entrada por transferencia por 0' , 'Balance = 0'))
	! !

!ReportTest methodsFor: 'test' stamp: 'SP 11/7/2025 11:29:22'!
test04AccountSummaryForAccountWithDepositWithdrawAndTransferReturnsCorrectSummary
	| account1 account2 accountSummary transfer |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 50 on: account1.
	Withdraw register: 50 on: account1.
	transfer := Transfer register: 50 from: account2 to: account1.
	accountSummary := AccountSummary on: account1.
	
	self assert: (accountSummary value = ('Déposito por 50' , 'Extracción por 50' , 'Salida por transferencia por 0' , 'Entrada por transferencia por 50' , 'Balance = 50'))! !

!ReportTest methodsFor: 'test' stamp: 'SP 11/7/2025 11:29:22'!
test05AccountSummaryForAccountWithDepositWithdrawAndDoubleTransferReturnsCorrectSummary
	| account1 account2 accountSummary transfer1 transfer2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 50 on: account1.
	Withdraw register: 50 on: account1.
	transfer1 := Transfer register: 50 from: account2 to: account1.
	transfer2 := Transfer register: 50 from: account1 to: account2.
	accountSummary := AccountSummary on: account1.
	
	self assert: (accountSummary value = ('Déposito por 50' , 'Extracción por 50' , 'Salida por transferencia por 50' , 'Entrada por transferencia por 50' , 'Balance = 0'))! !


!classDefinition: #TransferTest category: 'Portfolio2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferTest methodsFor: 'tests' stamp: 'SP 11/7/2025 11:07:32'!
test01TransferenceOnlyCanHaveAccountsAsSenders
	| account1 account2 |
	account1 := Point new.
	account2 := ReceptiveAccount new.
	
	self 
		should: [ Transfer register: 0 from: account1 to: account2 ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: Transfer errorTransferenceSenderOrReceiverShouldBeAReceptiveAccount! !

!TransferTest methodsFor: 'tests' stamp: 'SP 11/7/2025 11:07:53'!
test02TransferenceCanOnlyHaveNumbersAsValue
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	self 
		should: [ Transfer register: Point new from: account1 to: account2 ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: Transfer errorValueShouldBeANumber. ! !

!TransferTest methodsFor: 'tests' stamp: 'SP 11/7/2025 11:08:05'!
test03TransferenceRepresentsAWithdrawForSender
	| account1 transference account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transfer register:  50 from: account1 to: account2.
	
	self assert: (account1 hasRegistered: (Withdraw register: 50 on: account1) )
	 ! !

!TransferTest methodsFor: 'tests' stamp: 'SP 11/7/2025 11:08:19'!
test04TransferenceRepresentsADepositForReceiver
	| account1 transference account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transfer register: 50 from: account1 to: account2.
	
	self assert: (account1 hasRegistered: (Deposit register: 50 on: account1) )! !

!TransferTest methodsFor: 'tests' stamp: 'SP 11/7/2025 11:08:31'!
test05TransferenceLegsHaveSameTransference
	| account1 transference account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transfer register: 50 from: account1 to: account2.
	
	self assert: (transference withdrawLeg transfer = transference depositLeg transfer )! !

!TransferTest methodsFor: 'tests' stamp: 'SP 11/7/2025 11:09:48'!
test06DepositLegCanGoToWithdrawLeg
	| account1 transference account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transfer register:  50 from: account1 to: account2.
	
	self assert: ((transference depositLeg) withdrawLeg = (transference withdrawLeg))! !

!TransferTest methodsFor: 'tests' stamp: 'SP 11/7/2025 11:09:22'!
test07WithdrawLegCanGoToDepositLeg
	| account1 transference account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transfer register: 50 from: account1 to: account2.
	
	self assert: ((transference withdrawLeg) depositLeg = (transference depositLeg))! !
