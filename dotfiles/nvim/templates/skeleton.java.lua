return function(abs)
	local pkg
	for _, marker in ipairs({ "src/main/java/", "src/test/java/" }) do
		local start_idx = abs:find(marker, 1, true)
		if start_idx then
			local rel = abs:sub(start_idx + #marker)
			local dir = rel:match("(.*)/[^/]+$")
			if dir and dir ~= "" then
				pkg = dir:gsub("/", ".")
			end
			break
		end
	end
	return { PACKAGE_LINE = pkg and ("package " .. pkg .. ";\n\n") or "" }
end
