# Input string
s = "ProgrammingInPython"

# i) Display only unique characters
unique_chars = set(s)
print("(i) Unique characters:", unique_chars)

# ii) Count vowels and consonants separately
vowels = "aeiouAEIOU"
vowel_count = sum(1 for char in s if char in vowels)
consonant_count = sum(1 for char in s if char.isalpha() and char not in vowels)
print("(ii) Number of vowels:", vowel_count)
print("     Number of consonants:", consonant_count)

# iii) Find frequency of each character and store in a dictionary
freq_dict = {}
for char in s:
    if char in freq_dict:
        freq_dict[char] += 1
    else:
        freq_dict[char] = 1

print("(iii) Frequency of each character:", freq_dict)
