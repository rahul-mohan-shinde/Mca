# Given dictionary
d = {"Ajay": 88, "Vijay": 92, "Sanjay": 76, "Ramesh": 90}

# i) Display all students who scored more than 85
print("(i) Students who scored more than 85:")
for name, score in d.items():
    if score > 85:
        print(name, "→", score)

# ii) Add a new student "Mahesh": 81
d["Mahesh"] = 81
print("\n(ii) Dictionary after adding 'Mahesh':", d)

# iii) Sort the dictionary by values (scores) in descending order
sorted_d = dict(sorted(d.items(), key=lambda x: x[1], reverse=True))
print("\n(iii) Dictionary sorted by scores (descending):", sorted_d)
