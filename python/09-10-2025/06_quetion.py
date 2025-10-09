# write a program to calculate the sum of all even numbers less than 20 using while loop.
# skip odd numbers using continue.
sum=0
i=1
while i<20:
    if i%2!=0:
        i+=1
        continue
    sum+=i
    i+=1