# Create an empty dictionary
employees = {}

# Input employee names and salaries for 4 employees
for i in range(4):
    name = input(f"Enter name of employee {i+1}: ")
    salary = float(input(f"Enter salary of {name}: "))
    employees[name] = salary

# i) Display employees with salary greater than 30,000
print("\nEmployees with salary greater than 30,000:")
for name, salary in employees.items():
    if salary > 30000:
        print(f"{name} → ₹{salary}")

# ii) Update salary of one employee
emp_name = input("\nEnter the employee name whose salary you want to update: ")

if emp_name in employees:
    new_salary = float(input(f"Enter new salary for {emp_name}: "))
    employees[emp_name] = new_salary
    print(f"\nSalary updated successfully for {emp_name}!")
else:
    print("\nEmployee not found!")

# Display the final updated dictionary
print("\nUpdated Employee Data:")
for name, salary in employees.items():
    print(f"{name} → ₹{salary}")
