local component = require("component")
local gpu = component.gpu
local term = require("term")
local logo = {}

function logo.show()
    term.clear()
    local w, h = gpu.getResolution()
    gpu.setBackground(0x4A90E2)
    gpu.fill(1, 1, w, h, " ")
    
    local cx = math.floor(w / 2)
    local cy = math.floor(h / 2)
    
    gpu.setBackground(0xFF3B30) gpu.fill(cx - 12, cy - 10, 10, 5, " ")
    gpu.setBackground(0x4CD964) gpu.fill(cx + 2, cy - 10, 10, 5, " ")
    gpu.setBackground(0x007AFF) gpu.fill(cx - 12, cy - 4, 10, 5, " ")
    gpu.setBackground(0xFFCC00) gpu.fill(cx + 2, cy - 4, 10, 5, " ")
    
    gpu.setBackground(0x4A90E2)
    gpu.setForeground(0x000000)
    gpu.set(cx - 8, cy + 3, "MICROSOFT.")
    gpu.set(cx - 7, cy + 5, "WINDOWS.")
    gpu.set(cx - 5, cy + 8, "Version 3.1")
    os.sleep(2)
end
return logo
