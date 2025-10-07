# Create an empty dictionary
people = {}

# Input names and ages of 5 people
for i in range(5):
    name = input(f"Enter name of person {i+1}: ")
    age = int(input(f"Enter age of {name}: "))
    people[name] = age

# i) Display the dictionary
print("\n(i) People Dictionary:", people)

# ii) Find and display the name of the oldest person
oldest_person = max(people, key=people.get)
print("(ii) The oldest person is:", oldest_person, "with age", people[oldest_person])
