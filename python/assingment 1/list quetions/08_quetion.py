# Input list from the user (optional)
lst = [1, 2, 3]  # you can also take input from user if needed

# Shift elements left by one
if len(lst) > 0:
    shifted_list = lst[1:] + [lst[0]]  # take all elements from index 1 to end, then add first element at the end

# Display the result
print("Original list:", lst)
print("List after left shift by one:", shifted_list)
