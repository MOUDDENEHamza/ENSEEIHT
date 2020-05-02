# API Collection

## Exercice 1 : Informations de Prix-carburants

**1.1.** Le diagramme de classe pour modéliser un point de vente:

PointVente

identifiant int
latitude    double 
longitude	double
adresse		String
ville 		String
codePostal  String	

toString()		: String
getIdentifiant(): int
getLatitude()   : double
getLongitude()  : double
getAdresse()    : String
getVille()      : String 
getCodePostal() : String
getServices()   : String[]
getPrix()       : String[]
getPrix(Carburant carburant, LocalDateTime date) : int

**1.2.** Les collections de l’API Java à utiliser pour implanter ce diagramme de
classe est une liste chainée ou une table de hashage.
