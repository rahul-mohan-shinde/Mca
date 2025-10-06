# Program: Swap every odd-even position character in a string (without for loop)

text = input("Enter a string: ")

# Split string into even and odd indexed characters
even_chars = text[0::2]   # characters at index 0, 2, 4, ...
odd_chars  = text[1::2]   # characters at index 1, 3, 5, ...

# Create swapped string
swapped = ''.join([odd + even for odd, even in zip(odd_chars, even_chars)])

# If the string has odd length, add the last character
if len(text) % 2 != 0:
    swapped += text[-1]

print("Swapped string:", swapped)
