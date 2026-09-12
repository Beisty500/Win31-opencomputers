local component = require("component")
local gpu = component.gpu
local event = require("event")
local term = require("term")

-- Load bootscreen logo
pcall(function() loadfile("/home/win31/logo.lua")() end)

gpu.setResolution(160, 50)
local w, h = gpu.getResolution()

local colors = {
    desktop = 0x008080,      -- Original Teal
    windowBg = 0xFFFFFF,     -- White
    titleActive = 0x000080,  -- Dark Blue
    textBlack = 0x000000,    -- Black
    btnGray = 0xC0C0C0,      -- Light Gray
    textWhite = 0xFFFFFF     -- White
}

-- List of all available Windows 3.1 Apps inside the Program Manager
local appIcons = {
    { name = "Control Panel", file = "control.lua", x = 36, y = 18 },
    { name = "Notepad",       file = "notepad.lua", x = 56, y = 18 },
    { name = "Calculator",    file = "calc.lua",    x = 76, y = 18 },
    { name = "MS-DOS Editor",  file = "edit.lua",    x = 96, y = 18 },
    { name = "Games (Sol)",   file = "games.lua",   x = 116, y = 18 }
}

local function drawDesktop()
    gpu.setBackground(colors.desktop)
    gpu.fill(1, 1, w, h, " ")
end

local function drawProgramManager()
    -- Main Window: Program Manager
    local winX, winY, winW, winH = 30, 8, 105, 30
    gpu.setBackground(colors.textBlack)
    gpu.fill(winX, winY, winW, winH, " ")
    gpu.setBackground(colors.windowBg)
    gpu.fill(winX+1, winY+1, winW-2, winH-2, " ")
    
    -- Active Title Bar (Blue)
    gpu.setBackground(colors.titleActive)
    gpu.fill(winX+1, winY+1, winW-2, 3, " ")
    gpu.setForeground(colors.textWhite)
    gpu.set(winX + 6, winY + 2, "Program Manager")
    
    -- Close button [-]
    gpu.setBackground(colors.btnGray)
    gpu.setForeground(colors.textBlack)
    gpu.set(winX + 2, winY + 2, "-")
    
    -- Menu Bar
    gpu.setBackground(colors.windowBg)
    gpu.set(winX + 4, winY + 5, "File  Options  Window  Help")
    gpu.set(winX + 4, winY + 6, string.rep("-", winW - 8))
    
    -- Inner Group Window: "Main"
    local gx, gy, gw, gh = winX + 3, winY + 8, winW - 6, winH - 11
    gpu.setBackground(colors.textBlack)
    gpu.fill(gx, gy, gw, gh, " ")
    gpu.setBackground(colors.windowBg)
    gpu.fill(gx+1, gy+1, gw-2, gh-2, " ")
    gpu.set(gx + 4, gy + 1, " Main ")
    
    -- Draw App Icons
    for _, app in ipairs(appIcons) do
        gpu.set(app.x, app.y, "[X]") 
        gpu.set(app.x - 3, app.y + 1, app.name)
    end
end

local function startApp(fileName)
    local path = "/home/win31/apps/" .. fileName
    local app, err = loadfile(path)
    if app then
        app() -- Run the application
        -- Redraw desktop after app closes
        drawDesktop()
        drawProgramManager()
    else
        io.stderr:write("Error loading app: " .. tostring(err) .. "\n")
        os.sleep(2)
    end
end

local function main()
    term.clear()
    drawDesktop()
    drawProgramManager()
    
    gpu.setBackground(colors.desktop)
    gpu.setForeground(colors.textWhite)
    gpu.set(2, h, "Click [-] on the Program Manager to exit Windows")
    
    while true do
        local signal, _, x, y = event.pull()
        
        if signal == "touch" then
            -- Check for closing the Program Manager
            if x >= 31 and x <= 33 and y == 10 then
                break
            end
            
            -- Check if an icon was clicked
            for _, app in ipairs(appIcons) do
                if x >= (app.x - 3) and x <= (app.x + #app.name) and (y == app.y or y == app.y + 1) then
                    startApp(app.file)
                end
            end
        end
    end
    
    term.clear()
    print("Windows 3.1 has been shut down.")
end

main()
