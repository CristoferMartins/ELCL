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

--local ExtCreateModule = dofile("third_party/elcl/module.lua") -- you can choice between dofile or require it does not matter
local ExtCreateModule = require("third_party.elcl.module")

-- must be done for the main/father module, so its sets the relative path and will give the object that will require all the others modules
local thisModule = ExtCreateModule("", "main.lua", "main.lua")

local classes = thisModule:require("myclasses/someclasses.lua")
local class1 = classes.Class1()
local class2 = classes.Class2()

-- inside your new module which has been loaded by :require(modulename.lua, param1, param2, ...), you can grab parameters from :require like below
local thisModule, param1, param2 = ...

-- now we can call thisModule:require
-- thisModule:require("$absolutePathfilename.lua") -- absolute path(exe dir)
-- thisModule:require("file.lua") -- relative to this module :D
-- thisModule:require(".../file2.lua") -- relative to this module :D

-- when loading a elcl, add the unique module id(after ;, the "elcl") so even if you got a module called class.lua it will load the elcl lib module
local ClassModule = thisModule:require("../third_party/elcl/classes/class.lua;elcl") 

local Class1 = ClassModule.Class("class1")

local Class2 = ClassModule.Class("class2", Class1)

-- exporting stuff
thisModule.exports.Class1 = Class1
thisModule.exports.Class2 = Class2
