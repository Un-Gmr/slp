term.clear()
term.setCursorPos(1, 1)

print("=== MINI COMPUTER ===")
print()
write("What's your name? ")

local name = read()

term.clear()
term.setCursorPos(1, 1)

print("Hello, " .. name .. "!")
print()
print("Computer ID: " .. os.getComputerID())
print("Fuel: " .. tostring(turtle and turtle.getFuelLevel() or "N/A"))
print()
print("Press ENTER to exit.")

read()
