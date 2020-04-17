'From Cuis 5.0 [latest update: #4076] on 16 April 2020 at 11:46:55 pm'!
!classDefinition: #JuegoDeLaVida category: #Katas!
Object subclass: #JuegoDeLaVida
	instanceVariableNames: 'celulasVivas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Katas'!
!JuegoDeLaVida commentStamp: '<historical>' prior: 0!
John Conways Game of Life:

Reglas: A partir de unas celulas vivas iniciales se calculan las siguientes generaciones.

Cualquier célula viva que a su alrededor tenga menos de dos células vivas contiguas muere por subpoblación.
Cualquier célula viva que tenga 2 o 3 células vivas contiguas sobrevive.
Cualqueir célula viva que tenga más de 3 células vivas contiguas muere por sobrepoblación.
Una célula muerta que tenga exactamente 3 células vivas contiguas nace por reproducción.

Las reglas se evalúan simultáneamente para todas las células. Los nacimientos y muertes suceden sin afectar a las células presentes en la generación presente.

"(JuegoDeLaVida conCelulasVivas: {2@1. 2@2. 2@3}) siguienteGeneracion   a Set(2@2 3@2 1@2) ". 

!


!JuegoDeLaVida methodsFor: 'initialization' stamp: 'ARA 4/16/2020 23:06:15'!
initializeConCelulasVivas: unConjuntoDeCelulas 
	
	celulasVivas := unConjuntoDeCelulas asSet.! !


!JuegoDeLaVida methodsFor: 'evaluating' stamp: 'ARA 4/16/2020 22:52:04'!
celulasQueNacen

	^ (self podrianNacer) select: [:celulaQuePuedeNacer | self  puedeNacer: celulaQuePuedeNacer ]! !

!JuegoDeLaVida methodsFor: 'evaluating' stamp: 'ARA 4/16/2020 22:55:02'!
celulasQueSobreviven

	^ celulasVivas select: [:celulaViva | self puedeSobrevivir: celulaViva]! !

!JuegoDeLaVida methodsFor: 'evaluating' stamp: 'ARA 4/16/2020 22:47:48'!
podrianNacer

	^ celulasVivas inject: Set new addingAll: [ :viva | self celulasMuertasAlRededorDe: viva ]! !

!JuegoDeLaVida methodsFor: 'evaluating' stamp: 'ARA 4/16/2020 23:19:10'!
siguienteGeneracion
	
	^ celulasVivas := self celulasQueSobreviven union: self celulasQueNacen.
! !


!JuegoDeLaVida methodsFor: 'evaluacionesCelulas' stamp: 'ARA 4/16/2020 23:10:09'!
celulasMuertasAlRededorDe: unaCelula
	"comment stating purpose of message"
		^unaCelula eightNeighbors difference: celulasVivas.! !

!JuegoDeLaVida methodsFor: 'evaluacionesCelulas' stamp: 'ARA 4/16/2020 23:09:43'!
celulasVivasAlRededorDe: unaCelula
	"comment stating purpose of message"
		^(unaCelula eightNeighbors) intersection: celulasVivas.! !

!JuegoDeLaVida methodsFor: 'evaluacionesCelulas' stamp: 'ARA 4/16/2020 17:46:43'!
puedeNacer: unaCelula

	^ ( self celulasVivasAlRededorDe: unaCelula )  size = 3! !

!JuegoDeLaVida methodsFor: 'evaluacionesCelulas' stamp: 'ARA 4/16/2020 22:55:02'!
puedeSobrevivir: unaCelula

	^ ((self celulasVivasAlRededorDe: unaCelula) size) between: 2 and: 3! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JuegoDeLaVida class' category: #Katas!
JuegoDeLaVida class
	instanceVariableNames: ''!

!JuegoDeLaVida class methodsFor: 'instance creation' stamp: 'ARA 4/16/2020 08:05:11'!
conCelulasVivas: unConjuntoDeCelulas 
	
	^self new initializeConCelulasVivas: unConjuntoDeCelulas ! !
