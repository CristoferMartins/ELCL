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
local function isBitSet(flagsValue, flag)
	return (bit.band(flagsValue, flag) ~= 0)
end

local function setBit(flagsValue, flag)
	return bit.bor(flagsValue, flag)
end

local function unsetBit(flagsValue, flag)
	return bit.band(flagsValue, bit.bnot(flag))
end

local function createFlag(id)
	return bit.lshift(1, id)
end

-- exports
thisModule.exports.isBitSet = isBitSet
thisModule.exports.setBit = setBit
thisModule.exports.unsetBit = unsetBit
thisModule.exports.createFlag = createFlag
