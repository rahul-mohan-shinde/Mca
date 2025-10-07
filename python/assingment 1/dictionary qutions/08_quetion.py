# Create a dictionary to store items and their prices
items = {
    "Pen": 10,
    "Notebook": 50,
    "Pencil": 5,
    "Eraser": 8,
    "Sharpener": 12
}

# i) Display the dictionary
print("Items and their Prices:")
for item, price in items.items():
    print(f"{item}: ₹{price}")

# ii) Calculate and display the average price of all items
total_price = sum(items.values())
average_price = total_price / len(items)

print("\nAverage Price of all items: ₹", round(average_price, 2))
