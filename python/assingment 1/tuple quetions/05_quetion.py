# Create an empty list to store user input
numbers = []

# Input 6 numbers from the user
print("Enter 6 numbers:")
for i in range(6):
    num = int(input(f"Number {i+1}: "))
    numbers.append(num)

# Convert the list to a tuple
t = tuple(numbers)
print("\nTuple:", t)

# Find maximum, minimum, and sum
maximum = max(t)
minimum = min(t)
total = sum(t)

print("Maximum:", maximum)
print("Minimum:", minimum)
print("Sum:", total)
