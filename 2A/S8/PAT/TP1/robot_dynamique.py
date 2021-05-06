from robot import Robot

r1 = Robot(4, 10, 'est')
print('r1 =', r1)
r2 = Robot(15, 7, 'sud')
print('r2 =', r2)

r1.nom = "D2R2"		# on a ajouté un nom à r1 mais r2 n'a pas de nom

def tourner_gauche(robot):
	robot.direction = (robot.direction + 3) % 4

Robot.pivoter_gauche = tourner_gauche

r2.pivoter_gauche()	# direction devient 'est'
print('r2 =', r2)

del r1.x		# suppression d'un attribut
r1.avancer()		# AttributeError: 'Robot' object has no attribute 'x'
