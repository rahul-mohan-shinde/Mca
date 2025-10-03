'''if statement
if condition:
     statement inside if block
 statement outside if block'''
'''x=60
if x<50:
    print("xis less than 50")
print("end of the program ")

num=int(input("enter a number: "))
#check if number is greater than 0
if num>0:
    print(f'{num} is a positive number.')
print('a statement outside the if statement')
'''
'''age=int(input('enter your age'))
if age<18:
    print('your are not eligible')
else:
    print('you are vote')
print('Done!')'''
'''
num=int(input("enter your num"))
if num>0:
    print("positive num")
else:
    print('not a positive')

print('this statement always executes')'''
'''
#wap a given num is odd or even
num=int(input('enter your num'))
if num%2==0:
    print('num is even')
else:
    print('num is odd')
#a given num is divisible by 5 or not
if num%5==0:
    print('num is divisible by 5')
else:
    print('num is not divisible by 5')

#wap to check whether is hot or cold
temperature=int(input('enter your wheater'))
if temperature<20:
    print('temperature is cold')
else:
    print('temperature is hot')
'''
'''
#wap given num is lies beatween the given range
num=int(input('enter your number'))
# fist approach
if num<100:
    print('num is given range')
else:
    print('num is not range')
# second approach
if 10 <= num <= 20:
    print('')
'''
#wap to check a given year is leap or not
'''
year=int(input('inter your year'))

if year % 4 == 0:
    print('year is leap')
else:
    print('year is not leap') 
'''
'''
x=int(input('enter your x'))
if x==5:
    print('x is 5')
elif x<5:
    print('x is less than 5')
else:
    print("x is greater than 5")
print('done!')
'''
#wap test wheather is num is divisible by 2 or 3 
'''
num=int(input('inter your num'))
if num%2==0:
    print("num is divisible by 2")
elif num%3==0:
    print("num is divisible by 3")
else:
    print("num is not divisible")
'''
'''#wap day of the week by using day number
day=int(input("enter your day num"))
if day==1:
    print("monday")
elif day==2:
    print("tuesday")
elif day==3:
    print("wednesday")
elif day==4:
    print("thersday")
elif day==5:
    print("friday")
elif day==6:
    print("saturday")
elif day==7:
    print("sunday")
else:
    print("invalid num")
#wap take color as a input red yello and green and build a logic trafic signal
color=input("enter your color name")
if color=='red':
    print("red")
elif color=='green':
    print("green")
elif color=='yellow':
    print("yellow")
else:
    print("enter your valid color")
#wap to take age as a input if age is less than 12 then ticket price is 100 and if age is beetweern 30 to 59 price is 150 if age greater than 60 then price is  120 rupee

age=int(input("enter your age"))
if age<=12:
    print("price is 100")
elif 30<=age<=59:
    print("price is 150")
elif age>=60:
    print("price is 120")
else:
    print("valid age")
'''
#wap to find outr absolute value of an input

# wap that takes an integer input from the user and prints "positive" if the number is greater than zero.

#wap program that takes a number from the user and checks if it is a multiple of 5 if it is print multiple of 5
# wap to find entered number is even or odd
# wap that takes a persons age as input and uses an if-else condition to check if the person
'''
# wap that takes the length of three side of a triangle as input and user elif else to determine the type of triangle
# equilateral : all sides are equal
# isoscles: two side are equal
# Scalene all side are differrent
# if the inputs do not form a valid triangle print "nvalid triangle"

first_side=int(input("input first side"))
second_side=int(input("input second side"))
third_side=int(input("input third side"))
if first_side==second_side==third_side:
    print("equilateral")
elif first_side==second_side or second_side==third_side or third_side==first_side:
    print("isoscles")
elif first_side != second_side and  second_side!=third_side and third_side!=first_side:
    print("scalene")
else:
    print("invalid triangle")
'''
# write a python program that takes the number of units of electricity consumed as input and calculates the bill based on the following slab rates:
#first 100 units: 5 per unit
# next 100 units(101-200):6 per unit
# above 200 unit: 7rupee per unit use if-elif-else to comput the bill
unit=float(input("enter your unit :"))
if unit<=100:
    price=unit*5
    print(price)
elif unit <=200:
    price=(100*5)+(unit-100)*6
    print(price)
elif unit>=200:
    price=(100*5)+(100*6)+(unit-200)*7
    print(price)
else:
    print("error")
