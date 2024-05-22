-- This is an app to test the logger
-- optionally, start it with 'cat' as the first argument to change the colors to Catppuccin as well!
APP_NAME = "Test Logger" -- App name for logger
SIDES = redstone.getSides()
ARGS = {...}

if #ARGS > 0 then
    if ARGS[1] == "cat" then
        local catppuccin = require("modules.catppuccin")
        catppuccin.applyHere()
        for _, side in ipairs(SIDES) do
            if peripheral.hasType(side, "monitor") then
                catppuccin.applyToMonitor(side)
            end
        end
    end
end

local logger = require("modules.logger.peripheral")

for _, side in ipairs(SIDES) do
    if peripheral.hasType(side, "monitor") then
        local monitor = peripheral.wrap(side)
        monitor.setCursorPos(1, 1)
        monitor.setTextScale(0.5)
        monitor.setCursorBlink(false)
        monitor.setBackgroundColor(colors.black)
        monitor.clear()

        logger.debug(side, "This is a debug message!")
        logger.error(side, "This is an error message!")
        logger.warn(side, "This is a warning message!")
        logger.info(side, "This is an info message!")
        logger.app(side, "This is an app level message!")
        logger.custom(side, "Custom", colors.orange, "This is a custom log message!")
        logger.raw(side, "This is a raw message!")
    end
end

local native_logger = require("modules.logger.native")
native_logger.debug("This is a debug message!")
native_logger.error("This is an error message!")
native_logger.warn("This is a warning message!")
native_logger.info("This is an info message!")
native_logger.app("This is an app level message!")
native_logger.custom("Custom", colors.orange, "This is a custom log message!")
native_logger.raw("This is a raw message!")