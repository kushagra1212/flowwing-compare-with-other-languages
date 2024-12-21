public class Benchmark {
    public static void main(String[] args) {
        long limit = 10000;
        long sum = 0;
        for (long i = 1; i <= limit; i++) {
            sum += i;
        }
        System.out.println(sum);
    }
}