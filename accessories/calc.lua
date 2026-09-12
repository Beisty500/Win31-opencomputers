local component = require("component")
local gpu = component.gpu
local event = require("event")

gpu.setBackground(0x000000) gpu.fill(50, 12, 55, 22, " ")
gpu.setBackground(0xC0C0C0) gpu.fill(51, 13, 53, 20, " ")
gpu.setBackground(0x000080) gpu.fill(51, 13, 53, 3, " ")
gpu.setForeground(0xFFFFFF) gpu.set(57, 14, "Calculator")
gpu.setBackground(0xC0C0C0) gpu.setForeground(0x000000) gpu.set(52, 14, "-")

-- Display
gpu.setBackground(0xFFFFFF) gpu.fill(55, 18, 45, 3, " ")
gpu.set(90, 19, "42")

gpu.setBackground(0xC0C0C0)
gpu.set(56, 23, "[ 7 ]  [ 8 ]  [ 9 ]  [ / ]")
gpu.set(56, 25, "[ 4 ]  [ 5 ]  [ 6 ]  [ * ]")
gpu.set(56, 27, "[ 1 ]  [ 2 ]  [ 3 ]  [ - ]")
gpu.set(56, 29, "[ 0 ]  [ . ]  [ = ]  [ + ]")

while true do
    local s, _, x, y = event.pull()
    if s == "touch" and x == 52 and y == 14 then break end
end
