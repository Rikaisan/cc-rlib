-- This is a program to print the color palette of your terminal/monitors
-- usage: test-colors [monitors]
-- example: test-colors left right
-- Will test the current terminal colors if no monitors are provided

COLOR_NAMES = {
    "white",
    "orange",
    "magenta",
    "lightBlue",
    "yellow",
    "lime",
    "pink",
    "gray",
    "lightGray",
    "cyan",
    "purple",
    "blue",
    "brown",
    "green",
    "red",
    "black",
}

ARGS = { ... }

if #ARGS > 0 then
    local peripheral_logger = require("modules.logger.peripheral")

    for _, id in ipairs(ARGS) do
        if peripheral.hasType(id, "monitor") then
            local monitor = peripheral.wrap(id)
            monitor.setCursorPos(1, 1)
            monitor.setTextScale(0.5)
            monitor.setCursorBlink(false)
            monitor.setBackgroundColor(colors.black)
            monitor.clear()
            for _, name in ipairs(COLOR_NAMES) do
                peripheral_logger.custom(id, name, colors[name], name)
            end
        end
    end
else
    local logger_native = require("modules.logger.native")

    for _, name in ipairs(COLOR_NAMES) do
        logger_native.custom(name, colors[name], name)
    end
end
