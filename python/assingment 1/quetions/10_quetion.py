# Program: Create a set from user input and perform operations

# Accept number of elements
n = int(input("Enter number of elements: "))

# Initialize empty set
user_set = set()

# Accept n elements from user
print("Enter elements (0-9, A-Z, a-z):")
for i in range(n):
    elem = input(f"Element {i+1}: ")
    user_set.add(elem)  # Add element to set (duplicates ignored)

# i) Display set elements
print("\n(i) Set Elements:", user_set)

# ii) Length of the set
print("(ii) Length of Set:", len(user_set))

# iii) Count digits, lowercase, uppercase letters
digits = sum(1 for x in user_set if x.isdigit())
lowercase = sum(1 for x in user_set if x.islower())
uppercase = sum(1 for x in user_set if x.isupper())

print("(iii) Number of digits:", digits)
print("Number of lowercase letters:", lowercase)
print("Number of uppercase letters:", uppercase)
