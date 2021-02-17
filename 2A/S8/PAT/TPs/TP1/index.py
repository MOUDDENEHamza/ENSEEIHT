def index(sequence, element):
	"""Chercher l'indice de la première occurrence de 'element' dans 'sequence'

	:param sequence: la séquence
	:param element: l'élément cherché
	:returns: l'indice de la première occurrence de 'element'
	:raises ValueError: l'élément n'est pas dans la séquence
	"""
	for indice, elt in enumerate(sequence):
		if elt == element:   # On l'a trouvé !
			return indice
	else:	# jamais trouvé
		raise ValueError('élement non trouvé')
