if APP_NAME == nil then
    APP_NAME = "App"
end

local function normalizeScreen()
    local _, term_height = term.getSize()
    local _, current_y = term.getCursorPos()

    if current_y > term_height then
        term.scroll(current_y - term_height)
        term.setCursorPos(1, term_height)
    end
end

local function logRaw(message)
    local _, current_y = term.getCursorPos()
    term.setTextColor(colors.white)
    term.write(message)
    term.setCursorPos(1, current_y + 1)
    normalizeScreen()
end

local function log(prefix, color, message)
    term.setTextColor(color)
    term.write("[" .. prefix .. "] ")
    logRaw(message)
end

local function logInfo(message)
    log("INFO", colors.green, message)
end

local function logError(message)
    log("ERROR", colors.red, message)
end

local function logWarn(message)
    log("WARN", colors.yellow, message)
end

local function logDebug(message)
    log("DEBUG", colors.magenta, message)
end

local function logCustom(message)
    log(APP_NAME, colors.lightBlue, message)
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