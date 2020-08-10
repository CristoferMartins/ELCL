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

-- this module instance
local thisModule = ...

-- implementation
local function split(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v:trim()
	end
	return res
end

local function trim(str)
	return str:match("^()%s*$") and "" or str:match("^%s*(.*%S)")
end

local function starts(str, substr)
	return (string.sub(str, 1, #substr) == substr)
end

local function insert(str, pos, strToInsert)
	return str:sub(1, pos) .. strToInsert .. str:sub(pos + 1)
end

local function front(str)
	return string.sub(str, 1, 1)
end

local function back(str)
	return string.sub(str, str:len(), str:len())
end

-- exports
thisModule.exports.split = split
thisModule.exports.trim = trim
thisModule.exports.starts = starts
thisModule.exports.insert = insert
thisModule.exports.front = front
thisModule.exports.back = back
