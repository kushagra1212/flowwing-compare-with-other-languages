def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(num**0.5) + 1):
        if num % i == 0:
            return False
    return True

def find_primes():
    for i in range(2, 100001):
        if is_prime(i):
            print(i)

find_primes()
