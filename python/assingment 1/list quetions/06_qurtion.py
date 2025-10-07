# Create an empty list
numbers = []

# Input 6 numbers from the user
for i in range(6):
    num = float(input(f"Enter number {i+1}: "))
    numbers.append(num)

# Find largest and smallest numbers
largest = numbers[0]
smallest = numbers[0]

for num in numbers:
    if num > largest:
        largest = num
    if num < smallest:
        smallest = num

# Display results
print("\nNumbers entered:", numbers)
print("Largest number:", largest)
print("Smallest number:", smallest)

