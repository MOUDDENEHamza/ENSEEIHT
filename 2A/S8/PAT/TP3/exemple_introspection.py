
# An empty class.
class C:
    pass

class Proxy:
    
    def __init__(self, object, method_names):
        self.object = object
        self.method_names = method_names
    
    # Instance method    
    def invoke(self, arg0, arg1, arg2):
        if (arg1 in self.method_names):
            raise AttributeError("The proxy doesn't support %s method.", arg1.__name__)
        return getattr(C, arg1 + arg2)(arg0)
    
c = C()
proxy = Proxy(c, dir(c))
c.x = 5
assert c.x == 5
proxy.invoke(c, 'hasattr', "(c, 'x')")
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