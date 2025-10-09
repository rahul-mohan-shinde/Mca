# write a program that checks numbers from 1 to 50. 
# print the first number divisible by 7 and stop the loop using break 
# use else to print "no number found" if none are divisible.

i = 1
while i <= 60:
    if i % 7 == 0:
        print(i)
        break
    i += 1
else:
    print("no number found")
