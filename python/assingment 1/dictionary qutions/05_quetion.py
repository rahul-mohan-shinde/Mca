# Create an empty dictionary
marks = {}

# Input marks for 3 subjects
marks["Math"] = int(input("Enter marks for Math: "))
marks["Science"] = int(input("Enter marks for Science: "))
marks["English"] = int(input("Enter marks for English: "))

# Calculate total and percentage
total = sum(marks.values())
percentage = total / len(marks)

# Display results
print("\nMarks Dictionary:", marks)
print("Total Marks:", total)
print("Percentage:", percentage, "%")
