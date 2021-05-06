def f(a=4, *p, x, **kw):
    print('a =', a)
    print('p =', p)
    print('kw =', kw)
    print(*p, sep='... ', end=' !\n')

f(1, 2, 3, x=5, y=6, z=7)
"""
f(1, 2, 3)
TypeError: f() missing 1 required keyword-only argument: 'x'
"""