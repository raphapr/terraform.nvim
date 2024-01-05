local D = require("terraform.util.debug")

-- internal methods
local Terraform = {}

-- state
local S = {
    -- Boolean determining if the plugin is enabled or not.
    enabled = false,
}

---Toggle the plugin by calling the `enable`/`disable` methods respectively.
---@private
function Terraform.toggle()
    if S.enabled then
        return Terraform.disable()
    end

    return Terraform.enable()
end

---Initializes the plugin.
---@private
function Terraform.enable()
    if S.enabled then
        return S
    end

    S.enabled = true

    return S
end

---Disables the plugin and reset the internal state.
---@private
function Terraform.disable()
    if not S.enabled then
        return S
    end

    -- reset the state
    S = {
        enabled = false,
    }

    return S
end

return Terraform
