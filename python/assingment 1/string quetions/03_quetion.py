# Program: Perform operations on the string "Python is Fun"

# Input string
text = "Python is Fun"

# i) Split the string into words
words = text.split()
print("(i) Split words:", words)

# ii) Join the words with a '-'
joined_text = '-'.join(words)
print("(ii) Joined with '-':", joined_text)

# iii) Find the length of the string without using len()
length = sum(1 for char in text)  # Count each character manually
print("(iii) Length of the string:", length)
