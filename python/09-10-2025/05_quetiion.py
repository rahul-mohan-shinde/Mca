# write a program to where the user has 3 attempts to enter the correct password python123.
# if the password is correct print login successful and if all attempts are used print account locked.
password = "python123"
attempts =3
while attempts > 0:
    user_input = input("Enter the password: ")
    if user_input == password:
        print("Login successful")
        break
    else:
        attempts -= 1
        print(f"Incorrect password. You have {attempts} attempts left.")
        if attempts == 0:
            print("Account locked")
    