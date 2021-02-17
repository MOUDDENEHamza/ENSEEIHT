from robot import Robot

r1 = Robot(4, 10, 'est')
r1.afficher(prefix='r1 = ')
r2 = Robot(15, 7, 'sud')
r2.afficher(prefix='r2 = ')
r1.pivoter()
r1.afficher(prefix='r1 = ')
r2.avancer()
r2.afficher(prefix='r2 = ')
Robot.pivoter(r2)			# syntaxe "classique"
Robot.afficher(r2, prefix='r2 = ')
print('Robot.pivoter :', Robot.pivoter)
print('r2.pivoter :', r2.pivoter)
Robot.changer_langue('en')
r2.afficher(prefix='r2 = ')
