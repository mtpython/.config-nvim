local storePath = "./color.txt"
local currentTheme = 0
local themes = { "rose-pine-moon", "rose-pine-main", "onedark", "rose-pine-dawn" }

function GetNow()
	return os.time(os.date("!*t"))
end

function SaveTheme(theme)
	local file, err = io.open(storePath, "w")
	if file then
		file:write(theme, "\n")
		file:write(GetNow())
		file:close()
	else
		print("error:", err)
	end
end

function LoadTheme()
	local file, err = io.open(storePath, "r")
	if err then
		print("error opening store")
		return ""
	end
	local theme
	local timestamp
	if file then
		theme = file:read("l")
		timestamp = file:read("l")
		file:close()
	else
		print("error:", err)
	end
	if (timestamp == nil) or (GetNow() - timestamp > 3600) then
		return ""
	else
		return theme
	end
end

function CycleTheme()
	currentTheme = currentTheme == #themes and 1 or currentTheme + 1
	local theme = themes[currentTheme]
	SetColorScheme(theme)
	SaveTheme(theme)
end

function GetTheme()
	local loadedTheme = LoadTheme()
	if loadedTheme ~= "" then
		return loadedTheme
	end
	math.randomseed(os.time())
	local randomNumber = math.random(1, 3)
	local time = os.date("*t")

	if time.hour < 8 or time.hour > 19 then
		return themes[randomNumber]
	else
		return "rose-pine-dawn"
	end
end

function SetColorScheme(color)
	color = color or GetTheme()
	vim.cmd.colorscheme(color)
end

SetColorScheme()

vim.keymap.set("n", "<leader>t", CycleTheme)
