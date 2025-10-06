# check num is positive or negative
"""num=int(input("enter your num: "))
if num>=0:
    if num == 0:
        print("number is 0.")

    else:
        print("number is positive.")
        print("Congrats....!")
else: 
    print("Number is negative.")
    print("Error....!")
"""
# wap to take marks of three subject  
# if any sub is < 40 result is false 
# else calclate avarage
#  if average>=75=destinction 
# if avg>=60=first class ,
# if avg>=16 =second class ,
# else pass
"""
first_sub = int(input("enter first sub marks"))
second_sub = int(input("enter second sub marks"))
Third_sub = int(input("enter third sub marks"))
if first_sub>=40 and second_sub >=40 and Third_sub>=40:
    
    avg = first_sub + second_sub + Third_sub/3
    print(avg)
    if avg >=16:
        print("second class")
    elif avg >= 60:
        print("first class")
    elif avg >= 75:
        print("distinction")
else:
    print("you are fail")
"""
# to input amount to widraw and
# awailaible balance if amount<= balance 
# if amount mul by 100 = success
# else  enter amount is mul by 100  
"""
balance =10000

amount=int(input("enter your amount..."))
if amount<=balance:
    if amount%100==0:
        password = int(input("enter password..."))
        if password == 123:
            print("transaction successfull...")
            print("collect money...")
        else: 
            print("enter your valid password")

    else:
        print("enter amount in the range of 100")

else:
    print("you have not sufficiant money")
"""
#wap to check wheather a student is eligible for mca admition best on following critaria

# 12 stream eligiblity
# only sci student are apply
# other strim are not 

# graguation eligiblity
# bca or bba are eligible
# other are not eligible

# cet score eligiblity
# if student give cet exam
# cet score must >0

# finaly wellcome to the mca
"""
stream = input("you have science in 12 th... ")

if stream== "yes" or stream == "no":
    if stream == "yes":
        degree=input("which is your graduation degree name bba or bca")
        if degree=="bba" or degree == "bca":
            cet = input("if you give cet then enter yes other wise enter no")
            if cet == "yes":
                score=float(input("enter your score"))
                if score > 0:
                    print("well come to mca....")
                else:
                    print("give a reapeate cet exam...")
            else:
                print("go and give first cet exam...")   
        else:
            print("complate your bba or bca")
    else:
        print("you have not science background")
else:
    print("Enter only yes or no")
"""