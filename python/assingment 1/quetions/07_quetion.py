# Program: Dictionary Operations in Python

# Step 1: Create a dictionary with 5 key-value pairs
student = {
    "name": "Rahul",
    "age": 20,
    "course": "BCA",
    "marks": 85,
    "city": "Delhi"
}

print("----- Original Dictionary -----")
print(student)

# i) Display all the keys
print("\n(i) Display all keys:")
print(student.keys())

# ii) Add a new key-value pair
student["college"] = "ABC University"
print("\n(ii) After adding new key-value pair:")
print(student)

# iii) Delete a specific element from the dictionary
del student["city"]
print("\n(iii) After deleting 'city' key:")
print(student)

# iv) Modify value of a particular key
student["marks"] = 90
print("\n(iv) After modifying 'marks' value:")
print(student)
