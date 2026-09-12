local component = require("component")
local gpu = component.gpu
local event = require("event")
local term = require("term")

gpu.setBackground(0x000000) gpu.fill(30, 7, 100, 32, " ")
gpu.setBackground(0xFFFFFF) gpu.fill(31, 8, 98, 30, " ")
gpu.setBackground(0x000080) gpu.fill(31, 8, 98, 3, " ")
gpu.setForeground(0xFFFFFF) gpu.set(37, 9, "Notepad - Untitled")
gpu.setBackground(0xC0C0C0) gpu.setForeground(0x000000) gpu.set(32, 9, "-")

gpu.setBackground(0xFFFFFF)
gpu.set(33, 12, "File  Edit  Search  Help")
gpu.set(33, 13, string.rep("-", 94))

gpu.set(35, 15, "Type your text below (Press Enter to finish line, click [-] to exit):")
gpu.set(35, 17, "> ")
term.setCursor(37, 17)
local input = term.read()

while true do
    local s, _, x, y = event.pull()
    if s == "touch" and x == 32 and y == 9 then break end
end
