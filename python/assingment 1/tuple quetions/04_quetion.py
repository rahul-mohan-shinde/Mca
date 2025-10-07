# Given tuple
t = (12, 45, 23, 67, 45, 89, 23, 12, 100)

# i) Display all elements at odd indexes
odd_index_elements = t[1::2]  # start at index 1, step 2
print("(i) Elements at odd indexes:", odd_index_elements)

# ii) Find duplicate elements in the tuple
duplicates = set()
seen = set()
for item in t:
    if item in seen:
        duplicates.add(item)
    else:
        seen.add(item)
print("(ii) Duplicate elements:", duplicates)

# iii) Convert the tuple into a dictionary (key=index, value=element)
t_dict = {i: t[i] for i in range(len(t))}
print("(iii) Tuple converted to dictionary:", t_dict)
