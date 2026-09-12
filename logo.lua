local component = require("component")
local gpu = component.gpu
local term = require("term")

local logo = {}

function logo.show()
    term.clear()
    local w, h = gpu.getResolution()
    
    -- Light blue background (from image 1)
    gpu.setBackground(0x4A90E2)
    gpu.fill(1, 1, w, h, " ")
    
    -- Calculate centered coordinates
    local cx = math.floor(w / 2)
    local cy = math.floor(h / 2)
    
    -- Draw the 4 squares of the Windows flag
    gpu.setBackground(0xFF3B30) -- Red
    gpu.fill(cx - 12, cy - 10, 10, 5, " ")
    
    gpu.setBackground(0x4CD964) -- Green
    gpu.fill(cx + 2, cy - 10, 10, 5, " ")
    
    gpu.setBackground(0x007AFF) -- Blue
    gpu.fill(cx - 12, cy - 4, 10, 5, " ")
    
    gpu.setBackground(0xFFCC00) -- Yellow
    gpu.fill(cx + 2, cy - 4, 10, 5, " ")
    
    -- Microsoft Windows Text
    gpu.setBackground(0x4A90E2)
    gpu.setForeground(0x000000)
    gpu.set(cx - 8, cy + 3, "MICROSOFT.")
    gpu.set(cx - 7, cy + 5, "WINDOWS.")
    gpu.setForeground(0x1C1C1E)
    gpu.set(cx - 5, cy + 8, "Version 3.1")
    
    os.sleep(3) -- Show logo for 3 seconds
end

return logo
