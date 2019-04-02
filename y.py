Y = (lambda fn: (lambda f: f(f))(lambda f: fn(lambda n: f(f)(n))))
fib = Y(lambda g: lambda n: 1 if n in [1, 2] else g(n-1) + g(n-2))
fact = Y(lambda g: lambda n: 1 if n == 0 else g(n-1)*n)

print(fib(10))
print(fact(10))
