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
local tableModule = thisModule:require("../misc/table_functions.lua;elcl")

-- add methods to table table and pollute the global table
table.isEmpty = tableModule.isEmpty
table.append = tableModule.append
table.getSize = tableModule.getSize
table.mergeTables = tableModule.mergeTables
table.findValue = tableModule.findValue
table.containsValue = tableModule.containsValue
table.countValue = tableModule.countValue
table.shuffleArray = tableModule.shuffleArray
table.mergeArrays = tableModule.mergeArrays
table.removeValueFromArray = tableModule.removeValueFromArray
table.shallowCopyArray = tableModule.shallowCopyArray
table.getArrayKeys = tableModule.getArrayKeys
table.getArrayValues = tableModule.getArrayValues
