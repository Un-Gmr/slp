while true do
    term.clear()
    term.setCursorPos(1, 1)

    local time = textutils.formatTime(os.time(), true)

    print("╔══════════════════╗")
    print("║   COMPUTER TIME  ║")
    print("║                  ║")
    print("║     " .. time .. "     ║")
    print("║                  ║")
    print("╚══════════════════╝")

    sleep(1)
end
