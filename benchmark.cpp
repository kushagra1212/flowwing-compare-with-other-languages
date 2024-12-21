#include <iostream>
#include <cmath>
using namespace std;

bool isPrime(int num) {
    if (num < 2) return false;
    int limit = sqrt(num);
    for (int i = 2; i <= limit; i++) {
        if (num % i == 0) return false;
    }
    return true;
}

void findPrimes() {
    for (int i = 2; i <= 100000; i++) {
        if (isPrime(i)) {
            printf("%d\n", i);
        }
    }
}

int main() {
    findPrimes();
    return 0;
}
