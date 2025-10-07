# Given list
numbers = [1, 2, 3, 4, 5, 6]

# i) Create a list of squares using list comprehension
squares = [x**2 for x in numbers]
print("List of squares:", squares)

# ii) Find the maximum and minimum element
maximum = max(numbers)
minimum = min(numbers)
print("Maximum element:", maximum)
print("Minimum element:", minimum)

# iii) Count how many even numbers are in the list
even_count = len([x for x in numbers if x % 2 == 0])
print("Count of even numbers:", even_count)
