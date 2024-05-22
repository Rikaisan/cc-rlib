if APP_NAME == nil then
    APP_NAME = "App"
end

local function normalizeScreen(monitor)
    local _, monitor_height = peripheral.call(monitor, "getSize")
    local _, current_y = peripheral.call(monitor, "getCursorPos")

    if current_y > monitor_height then
        peripheral.call(monitor, "scroll", current_y - monitor_height)
        peripheral.call(monitor, "setCursorPos", 1, monitor_height)
    end
end

local function logRaw(monitor, message)
    local _, current_y = peripheral.call(monitor, "getCursorPos")
    peripheral.call(monitor, "setTextColor", colors.white)
    peripheral.call(monitor, "write", message)
    peripheral.call(monitor, "setCursorPos", 1, current_y + 1)
    normalizeScreen(monitor)
end

local function log(monitor, prefix, color, message)
    peripheral.call(monitor, "setTextColor", color)
    peripheral.call(monitor, "write", "[" .. prefix .. "] ")
    logRaw(monitor, message)
end

local function logInfo(monitor, message)
    log(monitor, "INFO", colors.green, message)
end

local function logError(monitor, message)
    log(monitor, "ERROR", colors.red, message)
end

local function logWarn(monitor, message)
    log(monitor, "WARN", colors.yellow, message)
end

local function logDebug(monitor, message)
    log(monitor, "DEBUG", colors.magenta, message)
end

local function logCustom(monitor, message)
    log(monitor, APP_NAME, colors.lightBlue, message)
end

return {
    raw = logRaw,
    info = logInfo,
    error = logError,
    warn = logWarn,
    debug = logDebug,
    app = logCustom,
    custom = log,
}