local component = require("component")
local gpu = component.gpu
local event = require("event")

gpu.setBackground(0x000000) gpu.fill(50, 10, 50, 24, " ")
gpu.setBackground(0xC0C0C0) gpu.fill(51, 11, 48, 22, " ")
gpu.setBackground(0x000080) gpu.fill(51, 11, 48, 3, " ")
gpu.setForeground(0xFFFFFF) gpu.set(57, 12, "Minesweeper")
gpu.setBackground(0xC0C0C0) gpu.setForeground(0x000000) gpu.set(52, 12, "-")

gpu.set(70, 15, "[:-)] Score: 000")

-- Grid
gpu.setBackground(0x808080)
local gridX, gridY = 60, 18
gpu.fill(gridX, gridY, 20, 10, "▒")

while true do
    local s, _, x, y = event.pull()
    if s == "touch" then
        if x == 52 and y == 12 then break end
        if x >= gridX and x <= gridX+19 and y >= gridY and y <= gridY+9 then
            gpu.setBackground(0xC0C0C0)
            gpu.setForeground(0x0000FF)
            gpu.set(x, y, "1") -- Deckt eine "1" auf bei Klick
        end
    end
end
