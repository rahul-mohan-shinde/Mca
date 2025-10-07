# Given set
s = {1, 2, 3, 4, 5}
print("Original set:", s)

# i) Add element 6
s.add(6)
print("(i) After adding 6:", s)

# ii) Remove element 3
s.remove(3)  # You can also use discard(3) to avoid error if element doesn't exist
print("(ii) After removing 3:", s)

# iii) Check if 7 is in the set
exists = 7 in s
print("(iii) Is 7 in the set?:", exists)
