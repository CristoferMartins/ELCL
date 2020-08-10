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

-- implementation
local Vector = Class("ExtVector")

-- static values
Vector._VERSION_ = 'vector.lua v2020.31.07'

-- methods

function Vector:create()
	self.internalTable = {}
end

function Vector:clone()
	local newInstance = Vector()
	for _, value in ipairs(self.internalTable) do
		table.insert(newInstance.internalTable, value)
	end
	return newInstance
end

function Vector:getTable() 
	return self.internalTable
end

-- access specified element with bounds checking (public member function)
function Vector:at(index)
	return self.internalTable[index]
end

-- access the first element (public member function)
function Vector:front()
	return self.internalTable[1]
end

-- access the last element (public member function)
function Vector:back()
	return self[self:size()]
end

-- checks whether the container is empty (public member function)
function Vector:empty()
	return (self:size() == 0)
end

-- returns the number of elements (public member function)
function Vector:size()
	return #self.internalTable
end

-- clears the contents (public member function)
function Vector:clear()
	for i = 1, self:size() do
		self.internalTable[i] = nil
	end
end

-- adds an element to the end (public member function)
function Vector:emplaceBack(element)
	self.internalTable[self:size() + 1] = element
end

-- adds an element to the begin (public member function)
function Vector:emplaceFront(element)
	table.insert(self.internalTable, 1, element)
end

-- erases elements (public member function)
function Vector:erase(element)
	for i = 1, self:size() do
		if (self.internalTable[i] == element) then
			table.remove(self.internalTable, i)
			break
		end
	end
end

-- removes the last element (public member function)
function Vector:popBack()
	self[self:size()] = nil
end

-- removes the first element (public member function)
function Vector:popFront()
	self:erase(self.internalTable[1])
end

-- mapping methods
Vector.get = Vector.at
Vector.reset = Vector.clear
Vector.pushBack = Vector.emplaceBack

thisModule.exports.Vector = Vector
