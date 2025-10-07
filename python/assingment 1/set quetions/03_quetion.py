# i) Create a set
s = {"apple", "banana", "cherry"}
print("Original set:", s)

# ii) Convert it to a frozenset
fs = frozenset(s)
print("(i) Frozenset:", fs)

# iii) Display length of the frozenset
print("(ii) Length of frozenset:", len(fs))

# iv) Clear all elements from the original set
s.clear()
print("(iii) Original set after clearing:", s)
