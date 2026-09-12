local component = require("component")
local gpu = component.gpu
local event = require("event")

gpu.setBackground(0x000000) gpu.fill(30, 8, 100, 30, " ")
gpu.setBackground(0x008000) gpu.fill(31, 9, 98, 28, " ") -- Grüner Filz
gpu.setBackground(0x000080) gpu.fill(31, 9, 98, 3, " ")
gpu.setForeground(0xFFFFFF) gpu.set(37, 10, "Solitaire")
gpu.setBackground(0xC0C0C0) gpu.setForeground(0x000000) gpu.set(32, 10, "-")

-- Draw Cards
gpu.setBackground(0xFFFFFF) gpu.setForeground(0xFF0000)
gpu.fill(40, 15, 8, 5, " ") gpu.set(41, 16, "A ♥")
gpu.fill(52, 15, 8, 5, " ") gpu.set(53, 16, "K ♦")

gpu.setBackground(0xFFFFFF) gpu.setForeground(0x000000)
gpu.fill(64, 15, 8, 5, " ") gpu.set(65, 16, "10 ♣")

gpu.setBackground(0x008000) gpu.setForeground(0xFFFFFF)
gpu.set(40, 25, "Solitaire Card engine simulation running...")

while true do
    local s, _, x, y = event.pull()
    if s == "touch" and x == 32 and y == 10 then break end
end
