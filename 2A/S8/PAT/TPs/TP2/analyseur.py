# coding: utf-8
# vim: set noexpandtab sw=4 ts=4:

class Analyseur:
	'''
	Conserver des statistiques sur un jeu de données.
	'''

	def __init__(self):
		self.__cumuls = {}

	def charger(self):
		with open('donnees.txt', 'r') as entree:
			for ligne in entree:
				mots = ligne.split()
				assert len(mots) == 4
				x = int(mots[0])
				y = int(mots[1])
				p = (x, y)
				v = float(mots[-1])
				self.__cumuls[p] = self.cumul(p) + v

	def cumul(self, position):
		return self.__cumuls.get(position, 0)

	@property
	def cumuls(self):
		return dict(self.__cumuls)

	def __str__(self):
		return str(len(self.__cumuls)) + ' données ' + ', '.join(
				'[(x={},y={}) : cumul={}]'
					.format (p[0], p[1], cumul)
				for p, cumul in self.__cumuls.items())


def main():
	a = Analyseur()
	a.charger()
	print('Statistiques :', a)
	print('Cumuls :', a.cumuls)
	print('Nombre de positions :', len(a.cumuls))

if __name__ == '__main__':
	main()
