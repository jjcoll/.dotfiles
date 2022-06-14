-- Color scheme
-- require('onedark').setup {
--     style = 'darker',
--     transparent = true,
--     code_style = {
--         comments = 'italic',
--         keywords = 'none',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--     },
-- }
-- require('onedark').load()


local colorscheme = "melange"
-- local colorscheme = "nightfox"
-- local colorscheme = "sonokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. "not found!")
  return
end


