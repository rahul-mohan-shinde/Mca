# Given list
lst = [9, 8, 7, 6, 5, 4, 3]

# i) Insert element 100 at the beginning of the list
lst = [100] + lst   # manually adding 100 in front

# ii) Insert element 222 at the end of the list
lst = lst + [222]   # manually adding 222 at the end

# iii) Delete the element at index position 5
new_list = []
for i in range(len(lst)):
    if i != 5:
        new_list.append(lst[i])
lst = new_list

# iv) Print all elements in reverse order (without using reverse())
print("List in Reverse Order:")
for i in range(len(lst) - 1, -1, -1):
    print(lst[i], end=" ")

# v) Sort all elements in descending order (manual sorting)
for i in range(len(lst)):
    for j in range(i + 1, len(lst)):
        if lst[i] < lst[j]:
            lst[i], lst[j] = lst[j], lst[i]

print("\n\nList in Descending Order:", lst)
