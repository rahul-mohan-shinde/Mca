#write a program where the account balance starts at 5000. keep asking the user to enter a withdrawal amount.
# deduct the amount from the balance and print the remining balance
# stop when the balance becomes less than 1000 and print "low balance"
account_balance =5000
while account_balance > 1000:
    print(f"current baalace is {account_balance}")
    withdrawal_amount = int(input("enter the withdrawal amount: "))
    
    if account_balance-withdrawal_amount < 1000:
        
        print("low balance")
        print(f"you just withdraw only {account_balance - 1000} amount go and bank me paisa dal ke aao")
        continue
    account_balance -= withdrawal_amount
    print(f"remaining baalace is {account_balance}")
print("Low balance! Your account has less than ₹1000.")