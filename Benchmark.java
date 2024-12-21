public class Benchmark {
    public static void main(String[] args) {
        int limit = 10000;
        int sum = 0;
        for (int i = 1; i <= limit; i++) {
            sum += i;
        }
        System.out.println(sum);
    }
}