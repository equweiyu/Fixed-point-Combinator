import java.math.BigInteger;
import java.util.function.Function;

public class YFactorial<T> {
    private interface Improver<T> {
        Function<T, T> app(Improver<T> f);
    }

    private Function<T, T> Y(final Function<Function<T, T>, Function<T, T>> r) {
        return ((Improver<T>) f -> f.app(f)).app(f -> r.apply(x -> f.app(f).apply(x)));
    }

    public static void main(String[] args) {

        Function<BigInteger, BigInteger> fact = new YFactorial<BigInteger>().Y(
                f -> n -> n.equals(BigInteger.ZERO) ? BigInteger.ONE : n.multiply(f.apply(n.subtract(BigInteger.ONE))));
        System.out.println(fact.apply(BigInteger.valueOf(10)));
        Function<Integer, Integer> fib = new YFactorial<Integer>()
                .Y(f -> n -> n <= 2 ? 1 : (f.apply(n - 1) + f.apply(n - 2)));
        System.out.println(fib.apply(10));

    }
}