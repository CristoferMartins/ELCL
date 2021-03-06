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

-- requires
local classModule = thisModule:require("class.lua;elcl")
local Class = classModule.Class
local vectorModule = thisModule:require("vector.lua;elcl")
local Vector = vectorModule.Vector

-- implementation
local Map = Class("ExtMap")

-- static values
Map._VERSION_ = "Map.lua v2020.05.2020"

function Map:create()
	self.internalTable = {}
end

function Map:clone()
	local newInstance = Map()
	for key, value in pairs(self.internalTable) do
		newInstance[key] = value
	end
	return newInstance
end

function Map:getTable()
	return self.internalTable
end

function Map:getKeysVector()
	local vector = Vector()
	for key, value in pairs(self.internalTable) do
		vector:pushBack(key)
	end
	return vector
end

function Map:getValuesVector()
	local vector = Vector()
	for key, value in pairs(self.internalTable) do
		vector:pushBack(value)
	end
	return vector
end

function Map:getKeyValueVector(named)
	local vector = Vector()
	for key, value in pairs(self.internalTable) do
		if named then
			vector:emplaceBack({key = key, value = value})
		else
			vector:emplaceBack({key, value})
		end
	end
	return retTable
end

-- access specified element with bounds checking (public member function)
function Map:at(key)
	return self.internalTable[key]
end

-- checks whether the container is empty (public member function)
function Map:empty()
	return (self:size() == 0)
end

-- returns the number of elements (public member function)
function Map:size()
	local count = 0
	for key in pairs(self.internalTable) do
		count = count + 1
	end
	return count
end
-- clears the contents (public member function)
function Map:clear()
	for k in next, self.internalTable do rawset(self.internalTable, k, nil) end
	return true
end

-- erases elements (public member function)
function Map:erase(key)
	if (self.internalTable[key]) then
		self.internalTable[key] = nil
		return true
	end
	return false
end

-- finds element with specific key (public member function)
function Map:find(key)
	return (self.internalTable[key] ~= nil)
end

function Map:set(key, value)
	self.internalTable[key] = value
end

-- mapping methods
Map.get = Map.at
Map.reset = Map.clear

-- exports
thisModule.exports.Map = Map
