local component = require("component")
local gpu = component.gpu
local event = require("event")

gpu.setBackground(0x000000)
gpu.fill(50, 15, 50, 18, " ")
gpu.setBackground(0xC0C0C0)
gpu.fill(51, 16, 48, 16, " ")

-- Title Bar
gpu.setBackground(0x000080)
gpu.fill(51, 16, 48, 3, " ")
gpu.setForeground(0xFFFFFF)
gpu.set(55, 17, "Calculator")
gpu.setBackground(0xC0C0C0)
gpu.setForeground(0x000000)
gpu.set(52, 17, "-")

-- Display
gpu.setBackground(0xFFFFFF)
gpu.fill(54, 20, 42, 2, " ")
gpu.set(92, 20, "3.1415")

-- Keypad Preview
gpu.setBackground(0xC0C0C0)
gpu.set(55, 24, "    [ / ]")
gpu.set(55, 26, "    [ * ]")
gpu.set(55, 28, "    [ - ]")
gpu.set(55, 30, "  [ . ]  [ = ]  [ + ]")

event.pull("touch")
