# Given list
fruits = ["apple", "banana", "mango", "orange"]

# i) Display the first two elements
print("First two elements:", fruits[0:2])

# ii) Sort the list in reverse (descending) order
fruits.sort(reverse=True)
print("List in reverse (descending) order:", fruits)

# iii) Check whether 'grapes' is present in the list
if "grapes" in fruits:
    print("Yes, 'grapes' is present in the list.")
else:
    print("No, 'grapes' is not present in the list.")
