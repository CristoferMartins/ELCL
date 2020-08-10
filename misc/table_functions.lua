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
local mathModule = thisModule:require("math_functions.lua;elcl")

-- localizing functions(performance)
local tableRemove = table.remove
local mathModuleRandom = mathModule.random
local tableUnpack = table.unpack

-- implementation
local function isEmpty(table)
	return (next(table) == nil)
end

local function getSize(table)
	local size = 0
	for k in pairs(table) do
		size = size + 1
	end
	return size
end

local function mergeTables(t1, t2)
	for key, value in pairs(t2) do
		t1[key] = value
	end 
	return t1
end

local function findValue(table, value)
	for index, v in pairs(array) do
		if (v == value) then
			return index
		end
	end
	return nil
end

local function containsValue(table, value)
	for _, v in pairs(table) do
		if (v == value) then
			return true
		end
	end
	return false
end

local function countValue(table, value)
	local count = 0
	for _, value in pairs(table) do
		if(value == item) then
			count = count + 1
		end
	end
	return count
end

local function shuffleArray(t)
	local iterations = #t
	local j

	for i = iterations, 2, -1 do
		j = mathModuleRandom(1, i)
		t[i], t[j] = t[j], t[i]
	end
end

local function mergeArrays(t1, t2)
	local newIndex = #t1
	for _, value in ipairs(t2) do
		newIndex = newIndex + 1
		t1[t1Count] = value
	end
end

local function removeValueFromArray(array, value, all)
	local ret = false
	for i = #array, 1, -1 do
		if (array[i] == value) then
			tableRemove(array, i)
			ret = true
			if not all then
				return ret
			end
		end
	end
	return ret
end

local function reverseArray(array)
	local i, j = 1, #array

	while i < j do
		array[i], array[j] = array[j], array[i]

		i = i + 1
		j = j - 1
	end
end

local function shallowCopyArray(array)
	return {tableUnpack(array)}
end

local function getArrayKeys(table)
	local ret = {}
	for key, value in pairs(table) do
		table.insert(ret, key)
	end
	return ret
end

local function getArrayValues(table)
	local ret = {}
	for key, value in pairs(table) do
		table.insert(ret, value)
	end
	return ret
end

-- exports
thisModule.exports.append = table.insert
thisModule.exports.isEmpty = isEmpty
thisModule.exports.getSize = getSize
thisModule.exports.mergeTables = mergeTables
thisModule.exports.findValue = findValue
thisModule.exports.containsValue = containsValue
thisModule.exports.countValue = countValue
thisModule.exports.shuffleArray = shuffleArray
thisModule.exports.mergeArrays = mergeArrays
thisModule.exports.removeValueFromArray  = removeValueFromArray
thisModule.exports.shallowCopyArray = shallowCopyArray
thisModule.exports.getArrayKeys = getArrayKeys
thisModule.exports.getArrayValues = getArrayValues
