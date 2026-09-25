-- CYBERCORE // MONITOR DASHBOARD
-- Designed for CC:Tweaked Advanced Monitors

local monitor = peripheral.find("monitor")

if not monitor then
    print("ERROR: No monitor found.")
    return
end

monitor.setTextScale(0.5)
term.redirect(monitor)

local w, h = term.getSize()

local function clear()
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    term.clear()
end

local function text(x, y, str, color)
    term.setCursorPos(x, y)
    term.setTextColor(color or colors.white)
    write(str)
end

local function box(x1, y1, x2, y2, bg)
    term.setBackgroundColor(bg)
    paintutils.drawFilledBox(x1, y1, x2, y2)
end

local function line(y, color)
    term.setBackgroundColor(color)
    term.setCursorPos(1, y)
    write(string.rep(" ", w))
end

local function progress(x, y, width, value)
    local filled = math.floor(width * value)

    term.setBackgroundColor(colors.gray)
    term.setCursorPos(x, y)
    write(string.rep(" ", width))

    term.setBackgroundColor(colors.cyan)
    term.setCursorPos(x, y)
    write(string.rep(" ", filled))
end

local function title(x, y, str)
    text(x, y, str, colors.cyan)
end

local function status(x, y, name, value, color)
    text(x, y, name, colors.lightGray)
    text(x + #name + 2, y, value, color)
end

clear()

local tick = 0

while true do
    tick = tick + 1

    clear()

    -- HEADER
    box(1, 1, w, 4, colors.blue)

    text(3, 2, "CYBERCORE", colors.white)
    text(3, 3, "SYSTEM MONITOR", colors.lightBlue)

    text(w - 17, 2, "ONLINE", colors.lime)
    text(w - 17, 3, "ID " .. os.getComputerID(), colors.lightGray)

    -- LEFT PANEL
    local left = 2
    local mid = math.floor(w / 2) - 1
    local right = w - 2

    box(left, 6, mid, 15, colors.black)

    title(left + 2, 7, "SYSTEM STATUS")

    status(left + 2, 9, "CPU", math.random(20, 90) .. "%", colors.lime)
    status(left + 2, 10, "MEM", math.random(30, 80) .. "%", colors.cyan)
    status(left + 2, 11, "TEMP", math.random(35, 55) .. " C", colors.orange)
    status(left + 2, 12, "CORE", "STABLE", colors.lime)

    progress(left + 2, 14, mid - left - 3, math.random() * 0.8 + 0.1)

    -- RIGHT PANEL
    box(mid + 2, 6, right, 15, colors.black)

    title(mid + 4, 7, "NETWORK")

    status(mid + 4, 9, "GATEWAY", "ONLINE", colors.lime)
    status(mid + 4, 10, "LOCAL", "192.168.0.1", colors.cyan)
    status(mid + 4, 11, "PACKETS", tostring(math.random(1000, 9999)), colors.white)
    status(mid + 4, 12, "LATENCY", math.random(3, 30) .. " ms", colors.lime)

    progress(mid + 4, 14, right - mid - 5, math.random())

    -- GRAPH
    box(2, 17, w - 1, h - 5, colors.black)

    title(4, 18, "LIVE PROCESS LOAD")

    local graphTop = 20
    local graphBottom = h - 7

    for x = 4, w - 3 do
        local height = math.random(0, graphBottom - graphTop)
        local y = graphBottom - height

        if math.random(3) == 1 then
            text(x, y, "█", colors.cyan)
        elseif math.random(2) == 1 then
            text(x, y, "▌", colors.lightBlue)
        end
    end

    -- SCAN LINE
    local scanX = ((tick * 2) % (w - 8)) + 4

    for y = graphTop, graphBottom do
        text(scanX, y, "│", colors.blue)
    end

    -- FOOTER
    box(1, h - 3, w, h, colors.blue)

    text(3, h - 2, "SYSTEM", colors.lightGray)
    text(11, h - 2, "OPERATIONAL", colors.lime)

    text(3, h - 1, "UPTIME", colors.lightGray)
    text(11, h - 1, string.format("%.0fs", os.clock()), colors.cyan)

    text(w - 20, h - 2, "SECURE LINK", colors.lime)

    sleep(0.25)
end
