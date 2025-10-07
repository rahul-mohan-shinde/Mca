# Create an empty set
chars_set = set()

# Accept 6 characters from the user
print("Enter 6 characters (A-Z or a-z):")
while len(chars_set) < 6:
    char = input(f"Character {len(chars_set)+1}: ")
    if char.isalpha() and len(char) == 1:
        chars_set.add(char)
    else:
        print("Invalid input! Enter a single alphabetic character.")

print("\nSet of characters:", chars_set)

# Count uppercase and lowercase letters
uppercase_count = sum(1 for c in chars_set if c.isupper())
lowercase_count = sum(1 for c in chars_set if c.islower())

print("Number of uppercase letters:", uppercase_count)
print("Number of lowercase letters:", lowercase_count)
