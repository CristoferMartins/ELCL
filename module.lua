--[[
	MIT License

	Portions Copyright (c) 2020 Moisés dos Santos
	Portions Copyright (c) 2020 Cristofer Martins

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
--]]


--[[
	options:
	reload -> boolean : this flag allows module:require to ignore the exports table saved in loadedModules table for the required module
--]]
local function fixOptions(options)
	if not options then
		options = {}
	end
	if not options.reload then
		options.reload = false
	end
	return options
end

--[[
	kinda of paths that should work:
	$filename.lua -- absolute path
	$../filename.lua -- relative to the absolute path
	$folder/filename.lua -- from absolute path
	filename.lua -- relative to the module(lua file) path that called require
	../filename.lua -- relative to the module(lua file) path that called require
	folder/filename.lua -- from  the module(lua file) path that called require

	uniquename: used to identify loaded modules. Since we can't know the full path of a module file we can't use it as a unique identifier in the loaded modules table, we so we need to use the filename(filename.lua) and we allow an extra identifier after ; like filename.lua;xxxlib
--]]
local function getFilePathInfo(fatherFilePath, filePathAndName)
	local absolutePathSign = (filePathAndName:sub(1, 1) == "$")
	if absolutePathSign then
		filePathAndName = filePathAndName:sub(2)
	end

	local filePath = filePathAndName:match("(.*/)") or ""
	local newFilePath = fatherFilePath .. filePath
	if absolutePathSign then
		newFilePath = filePath
	end

	local fileName = assert(filePathAndName:match("[^/]*.lua$") or filePathAndName:match("[^/]*.lua;.*$"))
	local fileUniqueName = fileName
	local newFileName = fileName:match("(.*);") or fileName

	return newFilePath, newFileName, fileUniqueName
end

local loadedModules = {}

local function createModule(filePath, fileName, fileUniqueName)
	return {
		fileName = fileName,
		fileUniqueName = fileUniqueName,
		filePath = filePath,
		exports = {},

		require = function(self, filePathAndName, options, ...)
			assert(filePathAndName)
			options = fixOptions(options)

			local filePath, fileName, fileUniqueName = getFilePathInfo(self:getFilePath(), filePathAndName)

			if loadedModules[fileUniqueName] and not options.reload then
				return loadedModules[fileUniqueName]
			end

			local newModule = createModule(filePath, fileName, fileUniqueName)
			loadedModules[fileUniqueName] = newModule.exports

			newModule:load(...)

			return newModule.exports
		end,
		getFileName = function(self)
			return self.fileName
		end,
		getFileUniqueName = function(self)
			return self.fileUniqueName
		end,
		getFilePath = function(self)
			return self.filePath
		end,
		getExports = function(self)
			return self.exports
		end,
		load = function(self, ...)
			local func = assert(loadfile(self:getFilePath() .. self:getFileName()))
			return func(self, ...)
		end,
		mergeExports = function(self, exports)
			for key, value in pairs(exports) do
				self.exports[key] = value
			end
		end,
	}
end

return createModule
