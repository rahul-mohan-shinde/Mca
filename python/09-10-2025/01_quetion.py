# write a program that asks the user to enter the ATM PIN. keep asking until the user enter the correct PIN, then print "Access Granted".
atm_pin = "1234"
user_pin = input("entre your atm pin: ")
while user_pin != atm_pin:
    print("your pis is incorrect please try again")
    user_pin = input("enter your correct pin: ")
print("Access Granted")