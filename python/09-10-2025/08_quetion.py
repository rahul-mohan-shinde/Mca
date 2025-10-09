#take a number from the user and count how many digits it has using a while loop
num = int(input("Enter a number: "))
count = 0   
if num == 0:
    count = 1
while num != 0:
    num //= 10
    count += 1
print("Number of digits:", count)