import functools

def fn_bavard(f):
    @functools.wraps(f) 
    def f_interne(*p, **k):
        print('debut de f_interne()')
        f(*p, **k)
        print('fin de f_interne()')
    print('dans fn_bavard')
    return f_interne

def deprecated(f):
    @functools.wraps(f)
    def new_func(*args, **kwargs):
        print('la fonction', f.__qualname__, 'ne devrait plus être utilisée...')
    return new_func

@fn_bavard
def exemple(x, y='ok'):
    print('exemple:', y, x)

@deprecated
def hello(x):
    print("hello ")
    return x

print('Appel à exemple')
exemple('?')
print(exemple.__qualname__)
hello(0)
