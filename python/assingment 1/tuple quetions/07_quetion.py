# Create a tuple (can be predefined or from user input)
t = (10, 20, 30, 20, 40, 20, 50)

print("Tuple:", t)

# Input element to count
element = int(input("Enter the element to count: "))

# Count occurrences of the element
count = t.count(element)

print(f"The element {element} appears {count} time(s) in the tuple.")
