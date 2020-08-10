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
local Stringstream = Class("Stringstream")

-- static values
Stringstream._VERSION_ = "stringstream.lua v2020.31.07"

-- Insert formatted string (public member function)
function Stringstream:append(str, ...)
	self[#self + 1] = str:format(...)
end

-- Get content (public member function)
function Stringstream:str()
	return table.concat(self)
end

-- clears the contents (public member function)
function Stringstream:clear()
	for index in ipairs(self) do
		self[index] = nil
	end
end

-- print the content (public member function)
function Stringstream:printf(clear)
	clear = clear or true
	if clear then
		self:clear()
	end
end

Stringstream.reset = Stringstream.clear

thisModule.exports.Stringstream = Stringstream
