# Program: Types of Variables (Mutable & Immutable)
# Example: Student Information

# Immutable Variables (cannot be changed)
student_name = "Rahul"          # String - Immutable
student_roll = 101              # Integer - Immutable
is_passed = True                # Boolean - Immutable
grade = ('A', 'B', 'C')         # Tuple - Immutable

# Mutable Variables (can be changed)
subjects = ['Math', 'Science', 'English']   # List - Mutable
marks = {'Math': 90, 'Science': 85}         # Dictionary - Mutable
hobbies = {'reading', 'sports'}             # Set - Mutable

# Displaying Student Information
print("----- Student Information -----")
print("Name:", student_name)
print("Roll No:", student_roll)
print("Passed:", is_passed)
print("Grades:", grade)
print("Subjects:", subjects)
print("Marks:", marks)
print("Hobbies:", hobbies)

# Trying to modify values
print("\n----- Modifying Variables -----")
# Immutable examples
student_name = student_name + " Sharma"   # creates a new string
print("Updated Name (Immutable):", student_name)

# Mutable examples
subjects.append("Computer")    # modifies same list
marks['English'] = 88          # adds new key-value pair
hobbies.add('music')           # adds new hobby

print("Updated Subjects (Mutable):", subjects)
print("Updated Marks (Mutable):", marks)
print("Updated Hobbies (Mutable):", hobbies)

# Summary
print("\n----- Summary -----")
print("Immutable types: String, Integer, Boolean, Tuple")
print("Mutable types: List, Dictionary, Set")
