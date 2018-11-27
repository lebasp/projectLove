local GameObject = 
{
	Y = 0,
	X = 0,
	Rotation = 0,
	ScaleX = 1,
	ScaleY = 1,
	Tag = ""
}

function GameObject:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function GameObject:SetPosition(x, y)
	self.X = x
	self.Y = y
end

function GameObject:SetScale(sx, sy)
	self.ScaleX = sx
	self.ScaleY = sy
end

return GameObject;