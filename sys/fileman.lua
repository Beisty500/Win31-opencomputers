local component = require("component")
local gpu = component.gpu
local event = require("event")
local fs = require("filesystem")

gpu.setBackground(0x000000) gpu.fill(25, 8, 110, 30, " ")
gpu.setBackground(0xFFFFFF) gpu.fill(26, 9, 108, 28, " ")
gpu.setBackground(0x000080) gpu.fill(26, 9, 108, 3, " ")
gpu.setForeground(0xFFFFFF) gpu.set(32, 10, "File Manager - C:\\*.*")
gpu.setBackground(0xC0C0C0) gpu.setForeground(0x000000) gpu.set(27, 10, "-")

gpu.setBackground(0xFFFFFF)
gpu.set(30, 14, "Directory Tree:")
gpu.set(30, 15, "└── C:\\")

local y = 16
for file in fs.list("/") do
    gpu.set(34, y, "├── " .. file)
    y = y + 1
    if y > 32 then break end
end

gpu.set(30, 35, "Click [-] to return to Program Manager")
while true do
    local s, _, x, y = event.pull()
    if s == "touch" and x == 27 and y == 10 then break end
end
