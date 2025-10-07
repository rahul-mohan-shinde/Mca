# Given sets
A = {1, 3, 5, 7, 9, 11}
B = {2, 3, 6, 9, 12, 15}

# i) Symmetric difference between A and B (elements in A or B but not both)
sym_diff = A ^ B  # or A.symmetric_difference(B)
print("(i) Symmetric difference:", sym_diff)

# ii) Check if A is a subset of B
is_subset = A.issubset(B)
print("(ii) Is A a subset of B?:", is_subset)

# iii) Remove all even numbers from set B
B_no_even = {x for x in B if x % 2 != 0}  # Keep only odd numbers
print("(iii) Set B after removing even numbers:", B_no_even)
