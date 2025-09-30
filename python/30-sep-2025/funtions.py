# tuple of string type
names = ('james', 'jack', 'eva')
print(names)
float_values = (1,2.2,3.3,3.4)
print(float_values)
language=('python','swift','c++')
print(language[0])
print(language[1])
#language[0]='java' #error --> tuple object does not support item assignment
# Change value 
temp = list(language)
temp[1] = 'java'
language = tuple(temp)
print(language)
"""
del language
del names
print(names)
"""
numbers=(1,2,3,4 ,5,5)
print(numbers[1:3])
print(numbers.count(3))
print(numbers.index(5))

#student roll no dictionary
Student_data={
    "Name":"rahul",
    "rollNo":33
}
print(Student_data)
#find capital
country_capitals = {
    "germany":"berlin",\
    "canada":"ottawa",
    "england":"londan"
}
print(country_capitals["england"])
# Add capital
country_capitals["italy"]="rome"
country_capitals["india"]="dilli"
print(country_capitals)
# using update()
country_capitals.update({"course":"BCA", "grade":"B"})
print(country_capitals) 
# delete perticular key
grade=country_capitals.pop("grade")
print("romoved grade",grade)
print(country_capitals)
#pop, update, clear, keys, values, get, popitem, copy
#keys()
key=country_capitals.keys()
print(key)
#value
value=country_capitals.values()
print(value)
#get
get=country_capitals.get("india")
print(get)
#popitem
