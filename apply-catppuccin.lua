-- applies Catppuccin to the current terminal or provided monitors
-- usage: apply-catppuccin [monitors]
-- example: apply-catppuccin left right
-- Will change the current terminal color palette if no monitors are provided
ARGS = { ... }

local catppuccin = require("modules.catppuccin")

if #ARGS > 0 then
    for _, id in ipairs(ARGS) do
        if peripheral.getType(id) == "monitor" then
            catppuccin.applyToMonitor(id)
        end
    end
else
    catppuccin.applyHere()
end