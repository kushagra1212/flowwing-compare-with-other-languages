#include <iostream>

int main() {
    int sum = 0;
    for (int i = 1; i <= 10000; i++) {
        sum += i;
    }
    std::cout << sum << std::endl;
    return 0;
}