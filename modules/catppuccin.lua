local CATPPUCCIN_COLORS = {
    [colors.white] = 0xcdd6f4,
    [colors.orange] = 0xfab387,
    [colors.magenta] = 0xcba6f7,
    [colors.lightBlue] = 0x89dceb,
    [colors.yellow] = 0xf9e2af,
    [colors.lime] = 0x94e2d5,
    [colors.pink] = 0xf5c2e7,
    [colors.gray] = 0x6c7086,
    [colors.lightGray] = 0x9399b2,
    [colors.cyan] = 0x74c7ec,
    [colors.purple] = 0xb4befe,
    [colors.blue] = 0x89b4fa,
    [colors.brown] = 0xeba0ac,
    [colors.green] = 0xa6e3a1,
    [colors.red] = 0xf38ba8,
    [colors.black] = 0x11111b,
}

local function applyHere()
    for idx, color in pairs(CATPPUCCIN_COLORS) do
        term.setPaletteColor(idx, color)
    end
end

local function applyToMonitor(monitor)
    for idx, color in pairs(CATPPUCCIN_COLORS) do
        peripheral.call(monitor, "setPaletteColor", idx, color)
    end
end

return {
    colors = CATPPUCCIN_COLORS,
    applyHere = applyHere,
    applyToMonitor = applyToMonitor
}