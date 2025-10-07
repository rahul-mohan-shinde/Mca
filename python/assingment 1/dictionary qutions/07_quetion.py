# Create an empty dictionary
students = {}

# Input data for 5 students
for i in range(5):
    roll = int(input(f"Enter roll number of student {i+1}: "))
    name = input(f"Enter name of student {i+1}: ")
    students[roll] = name

# i) Display all roll numbers
print("\n(i) All roll numbers:", list(students.keys()))

# ii) Ask user to enter a roll number and display corresponding name
search_roll = int(input("\nEnter a roll number to search: "))

if search_roll in students:
    print(f"Student with roll number {search_roll} is: {students[search_roll]}")
else:
    print("No student found with that roll number.")
