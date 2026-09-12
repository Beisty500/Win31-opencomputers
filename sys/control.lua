local component = require("component")
local gpu = component.gpu
local event = require("event")

gpu.setBackground(0x000000) gpu.fill(35, 10, 90, 25, " ")
gpu.setBackground(0xC0C0C0) gpu.fill(36, 11, 88, 23, " ")
gpu.setBackground(0x000080) gpu.fill(36, 11, 88, 3, " ")
gpu.setForeground(0xFFFFFF) gpu.set(42, 12, "Control Panel")
gpu.setBackground(0xC0C0C0) gpu.setForeground(0x000000) gpu.set(37, 12, "-")

gpu.set(40, 16, "[Color Scheme]   [Fonts]   [Ports]   [Mouse]")
gpu.set(40, 19, "Current Theme: Windows Standard (Teal)")
gpu.set(40, 22, "System Parameters and Hardware config loaded successfully.")

while true do
    local s, _, x, y = event.pull()
    if s == "touch" and x == 37 and y == 12 then break end
end
