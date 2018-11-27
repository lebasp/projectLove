local ObjectPool = 
{
	Class = nil,
	Available = {}
}

function ObjectPool:new(class)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	self.Class = class
	return o
end

function ObjectPool:Get()
	return table.remove(self.Available) or self.Class:new()
end

function ObjectPool:Detroy(item)
	table.insert(self.Available, item)
end

function ObjectPool:CountAvailable()
	local count = 0
	for i,item in pairs(self.Available) do
		count = count + 1
	end
	return count
end

return ObjectPool
