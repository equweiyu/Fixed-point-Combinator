func Z<T,U>(f:@escaping ((T) -> U, T) -> U) -> (T) -> U {
    return {(x:T) -> U in f(Z(f: f),x)}
}

func main() {
    let fibZ = Z(f: {$1 < 2 ? $1 : $0($1-1) + $0($1-2)})
    print(fibZ(11))
}
main()