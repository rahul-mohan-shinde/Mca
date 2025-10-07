# Program: Perform operations on the string "programming"

# Input string
text = "programming"

# i) Display the first and last character
first_char = text[0]
last_char = text[-1]
print("(i) First character:", first_char)
print("    Last character:", last_char)

# ii) Reverse the string using slicing
reversed_text = text[::-1]
print("(ii) Reversed string:", reversed_text)

# iii) Replace all 'm' with 'M'
replaced_text = text.replace('m', 'M')
print("(iii) String after replacing 'm' with 'M':", replaced_text)
