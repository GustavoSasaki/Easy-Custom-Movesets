local ecmConfigs = { "Community", "Default", "Custom" }

local ecmDescriptions = {
    ["Community"] = "Mod Author + Community + Player Config",
    ["Default"]   = "Player Config + Author Mod Config",
    ["Custom"]    = "Only Player Created Custom Configs"
}

--- 1. LOAD SAVED CONFIG (On Startup)
-- We check if the host has a saved setting. If not, default to "Community"
local savedConfig = mod_storage_load("ecm_setting")
if gGlobalSyncTable.ecmConfig == nil then
    gGlobalSyncTable.ecmConfig = savedConfig or "Community"
end

local function cycle_ecm_config()
    local current = gGlobalSyncTable.ecmConfig
    local index = 1

    for i, v in ipairs(ecmConfigs) do
        if v == current then
            index = i
            break
        end
    end

    index = (index % #ecmConfigs) + 1
    local newMode = ecmConfigs[index]
    
    -- Update Sync Table for other players
    gGlobalSyncTable.ecmConfig = newMode

    --- 2. SAVE CONFIG TO FILE
    -- This saves the string to the host's local storage folder
    if network_is_server() then
        mod_storage_save("ecm_setting", newMode)
    end

    djui_chat_message_create("ECM Mode: " .. newMode .. "\n(" .. ecmDescriptions[newMode] .. ")")
    return true
end

-- Menu Button
if network_is_server() then
    hook_mod_menu_button("Cycle ECM Config", cycle_ecm_config)
end

-- Chat Command
local function on_ecm_command(msg)
    if not network_is_server() then
        djui_chat_message_create("Only the server host can change the ECM config.")
        return true
    end
    cycle_ecm_config()
    return true
end

hook_chat_command("ecm-config", "Change Easy Custom Moveset Config.", on_ecm_command)