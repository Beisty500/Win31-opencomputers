local component = require("component")
local gpu = component.gpu
local event = require("event")
local term = require("term")

pcall(function() loadfile("/home/win31/logo.lua")() end)

gpu.setResolution(160, 50)
local w, h = gpu.getResolution()

local colors = {
    desktop = 0x008080, windowBg = 0xFFFFFF, titleActive = 0x000080,
    textBlack = 0x000000, btnGray = 0xC0C0C0, textWhite = 0xFFFFFF
}

local currentGroup = "Main"
local groups = {
    Main = {
        { name = "File Manager", file = "sys/fileman.lua", x = 36 },
        { name = "Control Panel", file = "sys/control.lua", x = 58 }
    },
    Accessories = {
        { name = "Notepad", file = "accessories/notepad.lua", x = 36 },
        { name = "Calculator", file = "accessories/calc.lua", x = 58 },
        { name = "Paintbrush", file = "accessories/pbrush.lua", x = 80 }
    },
    Games = {
        { name = "Minesweeper", file = "games/mine.lua", x = 36 },
        { name = "Solitaire", file = "games/sol.lua", x = 58 }
    }
}

local function drawDesktop()
    gpu.setBackground(colors.desktop)
    gpu.fill(1, 1, w, h, " ")
end

local function drawProgramManager()
    local winX, winY, winW, winH = 20, 5, 120, 38
    gpu.setBackground(colors.textBlack)
    gpu.fill(winX, winY, winW, winH, " ")
    gpu.setBackground(colors.windowBg)
    gpu.fill(winX+1, winY+1, winW-2, winH-2, " ")
    
    -- Title Bar
    gpu.setBackground(colors.titleActive)
    gpu.fill(winX+1, winY+1, winW-2, 3, " ")
    gpu.setForeground(colors.textWhite)
    gpu.set(winX + 6, winY + 2, "Program Manager")
    gpu.setBackground(colors.btnGray)
    gpu.setForeground(colors.textBlack)
    gpu.set(winX + 2, winY + 2, "-")
    
    -- Menus
    gpu.setBackground(colors.windowBg)
    gpu.set(winX + 4, winY + 5, "File  Options  Window  Help")
    gpu.set(winX + 4, winY + 6, string.rep("-", winW - 8))
    
    -- Group Tabs (Navigation)
    gpu.set(winX + 4, winY + 8, "Program Groups:  [ Main ]   [ Accessories ]   [ Games ]")
    
    -- Inner Box
    local gx, gy, gw, gh = winX + 3, winY + 10, winW - 6, winH - 13
    gpu.setBackground(colors.textBlack)
    gpu.fill(gx, gy, gw, gh, " ")
    gpu.setBackground(colors.windowBg)
    gpu.fill(gx+1, gy+1, gw-2, gh-2, " ")
    gpu.set(gx + 4, gy + 1, " " .. currentGroup .. " ")
    
    -- Draw Apps for Current Group
    for _, app in ipairs(groups[currentGroup]) do
        gpu.set(app.x, winY + 16, "[X]")
        gpu.set(app.x - 2, winY + 18, app.name)
    end
end

local function startApp(file)
    local app, err = loadfile("/home/win31/" .. file)
    if app then
        app()
        drawDesktop()
        drawProgramManager()
    end
end

local function main()
    term.clear()
    drawDesktop()
    drawProgramManager()
    
    while true do
        local signal, _, x, y = event.pull()
        if signal == "touch" then
            if x >= 21 and x <= 23 and y == 7 then break end -- Exit
            
            -- Tab Clicks
            if y == 13 then
                if x >= 37 and x <= 44 then currentGroup = "Main"; drawProgramManager()
                elseif x >= 48 and x <= 62 then currentGroup = "Accessories"; drawProgramManager()
                elseif x >= 66 and x <= 74 then currentGroup = "Games"; drawProgramManager() end
            end
            
            -- App Clicks
            for _, app in ipairs(groups[currentGroup]) do
                if x >= app.x - 2 and x <= app.x + #app.name and (y == 21 or y == 23) then
                    startApp(app.file)
                end
            end
        end
    end
    term.clear()
end
main()
