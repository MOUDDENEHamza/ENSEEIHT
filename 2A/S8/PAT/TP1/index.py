def index(sequence, element):
	for indice, elt in enumerate(sequence):
		if elt == element:
			return indice
	raise ValueError('Item not found')
