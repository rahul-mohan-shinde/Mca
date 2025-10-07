# Input string from user
text = input("Enter a string: ")

# i) Extract all digits present in the string
digits = [char for char in text if char.isdigit()]
print("(i) Digits in the string:", digits)

# ii) Count total digits and alphabets separately
digit_count = sum(1 for char in text if char.isdigit())
alpha_count = sum(1 for char in text if char.isalpha())
print("(ii) Total digits:", digit_count)
print("     Total alphabets:", alpha_count)

# iii) Display only alphabets in reverse order
alphabets_only = [char for char in text if char.isalpha()]
reversed_alphabets = ''.join(alphabets_only[::-1])
print("(iii) Alphabets in reverse order:", reversed_alphabets)
