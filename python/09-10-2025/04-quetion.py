# write a program to claculate the factorial of a number using a while loop
#  use break to stop if the number is negative and print invalid input
num = int(input("Enter a number: "))
factorial = 1
i = 1

while True:
    if num < 0:
        print("Invalid input")
        break
    elif i <= num:
        factorial *= i
        i += 1
    else:
        print("Factorial is:", factorial)
        break