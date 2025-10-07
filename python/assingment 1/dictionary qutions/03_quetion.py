# Given dictionary
d = {"a": 1, "b": 2, "c": 3}

# i) Display all values
print("(i) All values:", d.values())

# ii) Convert dictionary keys into a list
keys_list = list(d.keys())
print("(ii) Keys as list:", keys_list)

# iii) Swap keys and values to form a new dictionary
swapped_dict = {value: key for key, value in d.items()}
print("(iii) New dictionary with swapped keys and values:", swapped_dict)
