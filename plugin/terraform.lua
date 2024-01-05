-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.TerraformLoaded then
    return
end

_G.TerraformLoaded = true

vim.api.nvim_create_user_command("Terraform", function()
    require("terraform").toggle()
end, {})
