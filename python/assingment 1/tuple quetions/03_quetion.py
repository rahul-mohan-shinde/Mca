# Given tuple
t = (5, 10, 15, 20, 25, 30)

# i) Slice the tuple from index 2 to 4
slice_t = t[2:5]  # index 2 to 4 (end index exclusive)
print("(i) Slice from index 2 to 4:", slice_t)

# ii) Count how many times 20 occurs
count_20 = t.count(20)
print("(ii) Number of times 20 occurs:", count_20)

# iii) Display the index of element 25
index_25 = t.index(25)
print("(iii) Index of element 25:", index_25)
