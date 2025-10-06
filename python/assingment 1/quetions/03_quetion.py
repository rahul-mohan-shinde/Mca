# Program: Demonstration of Operator Precedence and Associativity

print("----- Operator Precedence and Associativity -----")

# Example 1: Precedence ( * has higher precedence than + )
result1 = 10 + 5 * 2
# Step: 5 * 2 = 10 → 10 + 10 = 20
print("Example 1 (10 + 5 * 2) =", result1)

# Example 2: Parentheses change the order
result2 = (10 + 5) * 2
# Step: (10 + 5) = 15 → 15 * 2 = 30
print("Example 2 ((10 + 5) * 2) =", result2)

# Example 3: Exponent (**) has higher precedence than multiplication
result3 = 2 * 3 ** 2
# Step: 3 ** 2 = 9 → 2 * 9 = 18
print("Example 3 (2 * 3 ** 2) =", result3)

# Example 4: Left-to-right associativity for -, /, *
result4 = 100 / 10 * 2
# Step: (100 / 10) = 10 → 10 * 2 = 20
print("Example 4 (100 / 10 * 2) =", result4)

# Example 5: Right-to-left associativity for exponent (**)
result5 = 2 ** 3 ** 2
# Step: 3 ** 2 = 9 → 2 ** 9 = 512
print("Example 5 (2 ** 3 ** 2) =", result5)

# Example 6: Mixed operators
result6 = 10 + 20 * 3 - 5 / 2
# Step: 20 * 3 = 60 → 5 / 2 = 2.5 → 10 + 60 - 2.5 = 67.5
print("Example 6 (10 + 20 * 3 - 5 / 2) =", result6)

# Example 7: Logical operators (and, or, not)
a, b, c = True, False, True
result7 = a or b and not c
# Step: not c = False → b and False = False → a or False = True
print("Example 7 (a or b and not c) =", result7)

print("\n----- Summary -----")
print("1. Highest precedence: ** (right-to-left)")
print("2. Then: *, /, //, % (left-to-right)")
print("3. Then: +, - (left-to-right)")
print("4. Then: Comparison (==, <, >, etc.)")
print("5. Then: Logical not, and, or")
print("6. Parentheses () have the highest control.")
