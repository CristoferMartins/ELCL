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
local function isNumber(possibleNumber)
	return (type(possibleNumber) == "number")
end

local function isString(possibleString)
	return (type(possibleString) == "string")
end

local function isBoolean(possibleBoolean)
	return (type(possibleBoolean) == "boolean")
end

local function isFunction(possibleFunction)
	return (type(possibleFunction) == "function")
end

local function isTable(possibleTable)
	return (type(possibleTable) == "table")
end

local function isMetaTable(possibleMetaTable)
	return (getmetatable(possibleMetaTable) ~= nil)
end

-- exports
thisModule.exports.isNumber = isNumber
thisModule.exports.isString = isString
thisModule.exports.isFunction = isFunction
thisModule.exports.isBoolean = isBoolean
thisModule.exports.isMetaTable = isMetaTable
thisModule.exports.isTable = isTable
