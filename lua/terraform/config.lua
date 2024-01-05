local Terraform = {}

--- Your plugin configuration with its default values.
---
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
Terraform.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
}

--- Define your terraform setup.
---
---@param options table Module config table. See |Terraform.options|.
---
---@usage `require("terraform").setup()` (add `{}` with your |Terraform.options| table)
function Terraform.setup(options)
    options = options or {}

    Terraform.options = vim.tbl_deep_extend("keep", options, Terraform.options)

    return Terraform.options
end

return Terraform
