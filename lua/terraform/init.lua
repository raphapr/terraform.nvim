local M = require("terraform.main")
local Terraform = {}

-- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function Terraform.toggle()
    -- when the config is not set to the global object, we set it
    if _G.Terraform.config == nil then
        _G.Terraform.config = require("terraform.config").options
    end

    _G.Terraform.state = M.toggle()
end

-- starts Terraform and set internal functions and state.
function Terraform.enable()
    if _G.Terraform.config == nil then
        _G.Terraform.config = require("terraform.config").options
    end

    local state = M.enable()

    if state ~= nil then
        _G.Terraform.state = state
    end

    return state
end

-- disables Terraform and reset internal functions and state.
function Terraform.disable()
    _G.Terraform.state = M.disable()
end

-- setup Terraform options and merge them with user provided ones.
function Terraform.setup(opts)
    _G.Terraform.config = require("terraform.config").setup(opts)
end

_G.Terraform = Terraform

return _G.Terraform
