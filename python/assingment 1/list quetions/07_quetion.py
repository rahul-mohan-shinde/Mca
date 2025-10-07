# Create an empty list to store numbers
numbers = []

# Input 7 numbers from the user
for i in range(7):
    num = int(input(f"Enter number {i+1}: "))
    numbers.append(num)

# Create a new list containing only even numbers
even_numbers = [x for x in numbers if x % 2 == 0]

# Display results
print("\nNumbers entered:", numbers)
print("Even numbers:", even_numbers)
