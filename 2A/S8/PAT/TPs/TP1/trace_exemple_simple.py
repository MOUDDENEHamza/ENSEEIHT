from trace import trace

@trace
def fact(n):
    if n <= 1:
        return 1
    else:
        return n * fact(n - 1)

@trace
def est_pair(n):
    return n == 0 or est_impair(n - 1)

@trace
def est_impair(n):
    return n > 0 and est_pair(n - 1)

def main():
    x = 3
    print(f'fact({x}) =', fact(3))
    print(f'{x} est', 'pair' if est_pair(x) else 'impair')

if __name__ == '__main__':
    main()
