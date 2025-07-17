vim.api.nvim_create_user_command("PasteImageMarkdown", function()
  local handle = io.popen('REMOVED FOR PRIVACY')
  local filename = handle:read("*a"):gsub("\n", ""):gsub("\r", "")
  handle:close()

  if filename == "NO_IMAGE" or filename == "" then
    print("No image found in clipboard.")
    return
  end

  local markdown = string.format("![Screenshot](../Images/%s)", filename)
  vim.api.nvim_put({ markdown }, "c", true, true)
end, {})
