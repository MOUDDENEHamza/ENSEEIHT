import sys
import csv

class Analyseur:
	'''
	Conserver des statistiques sur un jeu de données.
	'''

	def __init__(self):
		self.__cumuls = {}

	def charger(self, filename):
		with open(filename, 'r') as entree:
			for ligne in entree:
				if ".csv" in filename:
					mots = list(csv.reader(entree))
				else:
					mots = ligne.split()
				x = int(mots[0])
				y = int(mots[1])
				p = (x, y)
				if "-f2.txt" in filename or "-f2.csv" in filename:
					v = float(mots[4])
				else:
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
	for i in range(1, len(sys.argv)):
		a.charger(sys.argv[i])
	print('Statistiques :', a)
	print('Cumuls :', a.cumuls)
	print('Nombre de positions :', len(a.cumuls))

if __name__ == '__main__':
	if (len(sys.argv) == 1):
		print("Usage: pyhton3 analyseur.py filename..*")
		exit(1)
	main()
