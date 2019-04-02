Y = f =>
    (x => f(y => x(x)(y)))
    (x => f(y => x(x)(y)))

fact = Y(g => n => n == 0 ? 1 : g(n - 1) * n)
fib = Y(g => n => n <= 2 ? 1 : g(n - 1) + g(n - 2))

console.log(fact(10));
console.log(fib(10));