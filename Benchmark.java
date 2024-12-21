public class Benchmark {
    public static void main(String[] args) {
        findPrimes();
    }

    public static void findPrimes() {
        for (int i = 2; i <= 100000; i++) {
            if (isPrime(i)) {
                System.out.println(i);
            }
        }
    }

    public static boolean isPrime(int num) {
        if (num < 2) return false;
        int limit = (int) Math.sqrt(num);
        for (int i = 2; i <= limit; i++) {
            if (num % i == 0) return false;
        }
        return true;
    }
}
