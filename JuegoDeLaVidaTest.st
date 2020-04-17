'From Cuis 5.0 [latest update: #4076] on 16 April 2020 at 11:46:08 pm'!
!classDefinition: #JuegoDeLaVidaTest category: #'Katas-Tests'!
TestCase subclass: #JuegoDeLaVidaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Katas-Tests'!

!JuegoDeLaVidaTest methodsFor: 'assertions' stamp: 'ARA 4/16/2020 23:27:25'!
testTresVerticalesEnDosGeneracionesQuedanIguales
	"comment stating purpose of message"

	| juegoDeLaVida celulasVivas |  
	
	juegoDeLaVida := JuegoDeLaVida conCelulasVivas: {2@1. 2@2. 2@3}.
	
	juegoDeLaVida siguienteGeneracion.
	celulasVivas := juegoDeLaVida siguienteGeneracion.
	
	self assert: celulasVivas equals: (Set newFrom:{2@1. 2@2. 2@3}).! !

!JuegoDeLaVidaTest methodsFor: 'assertions' stamp: 'ARA 4/16/2020 23:40:32'!
testTresVerticalesEvolucionanAEnTresHorizontalesEnLaSiguienteGeneracion
	"comment stating purpose of message"

	| juegoDeLaVida  |  
	
	juegoDeLaVida := JuegoDeLaVida conCelulasVivas: {2@1. 2@2. 2@3}.
	
	self assert: (juegoDeLaVida siguienteGeneracion) equals: (Set newFrom: {1@2. 2@2. 3@2})! !

!JuegoDeLaVidaTest methodsFor: 'assertions' stamp: 'ARA 4/16/2020 09:49:13'!
testUnaCelulaConCuatroContiguasMuere
	"comment stating purpose of message"

	| juegoDeLaVida  |  
	
	juegoDeLaVida := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3. 2@2. 0@2}.
		
	self assert: (juegoDeLaVida siguienteGeneracion includes: 1@2)  equals: false.! !

!JuegoDeLaVidaTest methodsFor: 'assertions' stamp: 'ARA 4/16/2020 09:46:41'!
testUnaCelulaConDosContiguasSobrevive
	"comment stating purpose of message"

	| juegoDeLaVida  |  
	
	juegoDeLaVida := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3}.
	
	self assert: (juegoDeLaVida siguienteGeneracion) includes: 1@2.! !

!JuegoDeLaVidaTest methodsFor: 'assertions' stamp: 'ARA 4/16/2020 09:47:25'!
testUnaCelulaConTresContiguasSobrevive
	"comment stating purpose of message"

	| juegoDeLaVida |  
	
	juegoDeLaVida := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3. 2@2}.
		
	self assert:  juegoDeLaVida siguienteGeneracion includes: 1@2.! !

!JuegoDeLaVidaTest methodsFor: 'assertions' stamp: 'ARA 4/16/2020 09:45:43'!
testUnaCelulaSolaMuere
	"comment stating purpose of message"
	| juegoDeLaVida |  
	
	juegoDeLaVida := JuegoDeLaVida conCelulasVivas: {1@1}.
	
	self assert: ( (juegoDeLaVida siguienteGeneracion) includes: 1@1) equals: false.! !

!JuegoDeLaVidaTest methodsFor: 'assertions' stamp: 'ARA 4/16/2020 14:02:28'!
testUnaCelulaSolaMuertaRodeadaDe3VivasNace
	"comment stating purpose of message"
	| juegoDeLaVida |  
	
	juegoDeLaVida := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 2@2}.
	
	self assert: (juegoDeLaVida siguienteGeneracion) includes: 2@1! !
