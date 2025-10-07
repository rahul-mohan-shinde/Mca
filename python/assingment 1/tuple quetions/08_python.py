# Accept 5 integers from the user and store in a tuple
t = tuple(int(input(f"Enter integer {i+1}: ")) for i in range(5))
print("\nOriginal tuple:", t)

# Convert the tuple to a list
numbers_list = list(t)

# Sort the list
numbers_list.sort()
print("Sorted list:", numbers_list)
