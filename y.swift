private struct Mu<T> {
    let mu:(Mu) -> (T) -> T
}

func Y<T>(r:@escaping (@escaping (T) -> T) -> ((T) -> T)) -> ((T) -> T) {
    let h = Mu(mu: {(f:Mu) in r({(x) in f.mu(f)(x)})})
    return h.mu(h)
}

func main() {
    let fib = Y { g in {$0 <= 2 ? 1 : g($0-1) + g($0-2)} }
    print(fib(10))
}
main()