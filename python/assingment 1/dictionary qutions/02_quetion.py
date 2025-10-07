# Given dictionary
marks = {"Math": 80, "Science": 90, "English": 85}

# i) Find the average marks
average = sum(marks.values()) / len(marks)
print("(i) Average marks:", average)

# ii) Add a new subject "History": 88
marks["History"] = 88
print("(ii) Dictionary after adding 'History':", marks)

# iii) Check if "Math" exists as a key
if "Math" in marks:
    print("(iii) 'Math' exists in the dictionary.")
else:
    print("(iii) 'Math' does not exist in the dictionary.")
