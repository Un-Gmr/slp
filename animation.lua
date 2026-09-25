term.clear()
term.setCursorPos(1, 1)

local colors = {
    colors.red,
    colors.orange,
    colors.yellow,
    colors.lime,
    colors.cyan,
    colors.blue,
    colors.purple,
    colors.magenta
}

while true do
    for _, color in ipairs(colors) do
        term.setTextColor(color)
        print(">> CC:Tweaked ONLINE <<")
        print("Hello from Minecraft!")
        sleep(0.15)
        term.clear()
        term.setCursorPos(1, 1)
    end
end
