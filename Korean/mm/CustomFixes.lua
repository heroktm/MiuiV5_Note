function applyCustomFixes(apkName, apk)
	if apkName == "framework-miui-res.apk" then
		showFixMessage(apkName)
		
		id = 5
		
		result = APKTool.InstallFramework("/system/framework/" .. apkName)

		for w in string.gmatch(result, "\\apktool\\framework\\(%d)%-MM%.apk", 1) do
			id = tonumber(w)-1
		end
		
		text = ""
		
		for i = 1, id, 1 do
			text = text .. string.format("  - %d\n", i)
		end
		
		targetFile = FileUtil(apk:GetSubFilePath("/apktool.yml"))
		
		if targetFile and targetFile.Success then
			targetFile.Data = string.gsub(targetFile.Data, '  %- 1', text)
			targetFile:Save()
		end

	end

end
