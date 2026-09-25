-- CYBERCORE // CC:TWEAKED
-- No peripherals required

local w, h = term.getSize()
local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%&*"
local running = true

math.randomseed(os.epoch("utc"))

local function randChar()
    local n = math.random(#chars)
    return chars:sub(n, n)
end

local function center(y, text)
    local x = math.floor((w - #text) / 2) + 1
    term.setCursorPos(math.max(1, x), y)
    write(text)
end

local function bar(x, y, width, percent)
    term.setCursorPos(x, y)
    write("[")
    local filled = math.floor(width * percent)

    for i = 1, width do
        if i <= filled then
            write("#")
        else
            write("-")
        end
    end

    write("]")
end

-- BOOT
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()

center(math.floor(h / 2) - 2, "C Y B E R C O R E")
center(math.floor(h / 2), "INITIALIZING NEURAL INTERFACE")
center(math.floor(h / 2) + 2, "[                    ]")

for i = 1, 20 do
    term.setCursorPos(math.floor((w - 22) / 2) + i, math.floor(h / 2) + 2)
    write("#")
    sleep(0.08)
end

sleep(0.5)

-- MATRIX BACKGROUND
local columns = {}
for x = 1, w do
    columns[x] = math.random(h)
end

-- Main loop
while running do
    term.setBackgroundColor(colors.black)
    term.clear()

    -- Matrix rain
    for x = 1, w do
        local y = columns[x]

        term.setTextColor(colors.lime)
        term.setCursorPos(x, y)
        write(randChar())

        if math.random(3) == 1 then
            term.setTextColor(colors.green)
            local y2 = y - 1
            if y2 > 0 then
                term.setCursorPos(x, y2)
                write(randChar())
            end
        end

        columns[x] = y + 1

        if columns[x] > h then
            columns[x] = math.random(-10, 1)
        end
    end

    -- Header
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.cyan)
    term.setCursorPos(2, 2)
    write("╔")
    write(string.rep("═", w - 4))
    write("╗")

    center(3, "C Y B E R C O R E   //   SYSTEM MONITOR")

    term.setCursorPos(2, 4)
    write("╚")
    write(string.rep("═", w - 4))
    write("╝")

    -- System panel
    local panelY = 6

    term.setTextColor(colors.white)
    term.setCursorPos(3, panelY)
    write("SYSTEM STATUS")

    term.setTextColor(colors.gray)
    term.setCursorPos(3, panelY + 1)
    write("Computer ID : ")

    term.setTextColor(colors.cyan)
    write(os.getComputerID())

    term.setTextColor(colors.gray)
    term.setCursorPos(3, panelY + 2)
    write("Uptime      : ")

    term.setTextColor(colors.cyan)
    write(math.floor(os.clock()) .. "s")

    term.setTextColor(colors.gray)
    term.setCursorPos(3, panelY + 3)
    write("Energy      : ")

    term.setTextColor(colors.lime)
    write(math.random(60, 100) .. "%")

    -- CPU
    term.setTextColor(colors.white)
    term.setCursorPos(3, panelY + 5)
    write("CPU LOAD")

    local cpu = math.random(20, 98)

    term.setTextColor(colors.cyan)
    term.setCursorPos(3, panelY + 6)
    write(cpu .. "% ")

    bar(9, panelY + 6, 20, cpu / 100)

    -- Memory
    term.setTextColor(colors.white)
    term.setCursorPos(3, panelY + 8)
    write("MEMORY")

    local mem = math.random(30, 95)

    term.setTextColor(colors.cyan)
    term.setCursorPos(3, panelY + 9)
    write(mem .. "% ")

    bar(9, panelY + 9, 20, mem / 100)

    -- Network panel
    local nx = math.floor(w / 2) + 2

    term.setTextColor(colors.white)
    term.setCursorPos(nx, panelY)
    write("NETWORK")

    local ips = {
        "192.168.0.1",
        "10.0.0.42",
        "172.16.4.7",
        "127.0.0.1"
    }

    for i = 1, 4 do
        term.setCursorPos(nx, panelY + i)
        term.setTextColor(colors.gray)
        write("NODE ")

        term.setTextColor(colors.cyan)
        write(ips[i])

        term.setTextColor(colors.lime)

        if math.random(4) == 1 then
            write(" [OPEN]")
        else
            write(" [ONLINE]")
        end
    end

    -- Fake packet stream
    term.setTextColor(colors.white)
    term.setCursorPos(nx, panelY + 6)
    write("PACKET STREAM")

    for i = 1, 5 do
        term.setCursorPos(nx, panelY + 6 + i)
        term.setTextColor(colors.gray)
        write("[" .. string.format("%04d", math.random(0, 9999)) .. "] ")

        term.setTextColor(colors.lime)

        local packet = ""

        for j = 1, 8 do
            packet = packet .. string.format("%02X", math.random(0, 255))

            if j < 8 then
                packet = packet .. " "
            end
        end

        write(packet)
    end

    -- Bottom status
    term.setTextColor(colors.cyan)

    if h >= 20 then
        term.setCursorPos(3, h - 2)
        write("STATUS: ")

        term.setTextColor(colors.lime)
        write("ALL SYSTEMS NOMINAL")

        term.setTextColor(colors.gray)
        term.setCursorPos(3, h - 1)
        write("Press CTRL+T to terminate.")
    end

    sleep(0.12)
end
