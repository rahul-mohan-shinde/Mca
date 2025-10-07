# Program: Perform operations on a string

# Input string
text = "Hello Python"

# i) Convert the string into uppercase
uppercase_text = text.upper()
print("(i) Uppercase:", uppercase_text)

# ii) Count how many times 'o' appears
count_o = text.count('o')
print("(ii) Number of 'o':", count_o)

# iii) Check whether the string starts with "He"
starts_with_he = text.startswith("He")
print("(iii) Starts with 'He'? :", starts_with_he)
