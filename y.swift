func Y<T>(f:@escaping (@escaping (T) -> T) -> ((T) -> T)) -> ((T) -> T) {
    return {(x:T) -> T in f(Y(f: f))(x)}
}
func main() {
    let fib = Y { g in {$0 <= 2 ? 1 : g($0-1) + g($0-2)} }
    print(fib(10))
}
main()