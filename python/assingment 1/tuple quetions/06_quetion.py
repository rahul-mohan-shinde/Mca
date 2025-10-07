# Input 5 names from the user and store in a tuple
names = tuple(input(f"Enter name {i+1}: ") for i in range(5))
print("\nTuple of names:", names)

# Display only names that start with 'A'
names_starting_with_A = [name for name in names if name.startswith('A')]
print("Names starting with 'A':", names_starting_with_A)
