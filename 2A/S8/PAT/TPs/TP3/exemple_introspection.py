class C:
    pass

c = C()
c.x = 5
assert c.x == 5
assert hasattr(c, 'x')
assert getattr(c, 'x') == 5
assert not hasattr(c, "y")
setattr(c, 'y', 7)
assert hasattr(c, "y")
assert getattr(c, 'y') == 7
assert c.y == 7
assert vars(c) == {'x': 5, 'y': 7}
delattr(c, 'x')
assert not hasattr(c, 'x')
assert vars(c) == {'y': 7}
print(dir(c))
