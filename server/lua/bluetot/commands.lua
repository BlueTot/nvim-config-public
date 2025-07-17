vim.cmd [[
  filetype plugin indent on
]]

-- command to read latest.txt and insert an image with the same name
-- must be run after the scp move from the windows client
vim.api.nvim_create_user_command("PasteImageMarkdown", function()
	local path = vim.fn.expand("REMOVED FOR PRIVACY")
	local file = io.open(path, "r")
	if file then
		local line = file:read("*l")
		file:close()
		if line then
            -- remove carriage return character
            line = line:gsub("\r", "")
            -- format into string
            local markdown = string.format("![Screenshot](../Images/%s)", line)
			vim.api.nvim_put({ markdown }, "c", true, true)
		else
			print("latest.txt is empty.")
		end
	else
		print("Could not open latest.txt.")
	end
end, {})

