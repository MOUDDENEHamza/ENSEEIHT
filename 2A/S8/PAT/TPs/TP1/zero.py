def f(x) :
	return x ** 2 - 2 * x - 15 

def zero(f, a, b, *, precision=10e-5):
	assert f(a) * f(b) <= 0
	if a > b:
		a, b = b, a
	while b - a > precision:
		milieu = (a + b) / 2
		if f(a) * f(milieu) > 0:
			a = milieu
		else:
			b = milieu
	return (a + b) / 2

zero(f(0), a=0, b=15, precision=0.01)