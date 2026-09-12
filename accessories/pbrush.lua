local component = require("component")
local gpu = component.gpu
local event = require("event")

gpu.setBackground(0x000000) gpu.fill(25, 6, 110, 35, " ")
gpu.setBackground(0xFFFFFF) gpu.fill(26, 7, 108, 33, " ")
gpu.setBackground(0x000080) gpu.fill(26, 7, 108, 3, " ")
gpu.setForeground(0xFFFFFF) gpu.set(32, 8, "Paintbrush - UNTITLED.BMP")
gpu.setBackground(0xC0C0C0) gpu.setForeground(0x000000) gpu.set(27, 8, "-")

-- Canvas area
gpu.setBackground(0xF0F0F0) gpu.fill(35, 12, 95, 25, " ")
gpu.setBackground(0xFFFFFF)
gpu.set(28, 14, "Brush:")
gpu.set(28, 16, "[#] Draw")
gpu.set(28, 25, "Colors:")
gpu.setBackground(0xFF0000) gpu.set(28, 27, "  ")
gpu.setBackground(0x00FF00) gpu.set(31, 27, "  ")
gpu.setBackground(0x0000FF) gpu.set(34, 27, "  ")

gpu.setBackground(0xFFFFFF)
gpu.set(40, 38, "Click and hold to paint on the canvas field.")

while true do
    local s, _, x, y = event.pull()
    if s == "touch" then
        if x == 27 and y == 8 then break end
        if x >= 35 and x <= 130 and y >= 12 and y <= 36 then
            gpu.setBackground(0x000000)
            gpu.set(x, y, " ")
        end
    end
end
