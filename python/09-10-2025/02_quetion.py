#write a program that starts with a water tank containing 100 liters . remove 5 liters at a time and print the remaining water. stop when the tank becomes empty
water_tank =100
while water_tank > 0:
    print(f"remaining water in tank is {water_tank} liters")
    water_tank -=5
print("the tank is empty now")
