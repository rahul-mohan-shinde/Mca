# Given list
lst = [10, 25, 30, 45, 50, 65, 70]

# i) Create a new list of only prime numbers from lst
def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(num**0.5) + 1):
        if num % i == 0:
            return False
    return True

prime_list = [x for x in lst if is_prime(x)]
print("Prime numbers in the list:", prime_list)

# ii) Find the second largest element without using max() twice
largest = max(lst)
second_largest = float('-inf')  # very small number initially
for num in lst:
    if num != largest and num > second_largest:
        second_largest = num

print("Second largest element:", second_largest)

# iii) Separate into multiples of 5 and non-multiples of 5
multiples_of_5 = []
non_multiples_of_5 = []

for x in lst:
    if x % 5 == 0:
        multiples_of_5.append(x)
    else:
        non_multiples_of_5.append(x)

print("Multiples of 5:", multiples_of_5)
print("Non-multiples of 5:", non_multiples_of_5)

