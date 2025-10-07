# Given tuple
t = ('apple', 'banana', 'mango')

# i) Convert the tuple into a list
t_list = list(t)
print("(i) Tuple converted to list:", t_list)

# ii) Add 'grapes' to the list and convert back to tuple
t_list.append('grapes')
t = tuple(t_list)
print("(ii) List after adding 'grapes' converted back to tuple:", t)

# iii) Display the length of the final tuple
length = len(t)
print("(iii) Length of the final tuple:", length)
