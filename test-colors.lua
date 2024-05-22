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
        if peripheral.getType(id) == "monitor" then
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
