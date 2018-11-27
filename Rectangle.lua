local Rectangle =
{
	X = 0,
	Y = 0,
	Width = 0,
	Height = 0
}

function Rectangle:new()
	local rect = {}
	setmetatable(rect, self)
	self.__index = self
	return rect
end

function Rectangle:SetPosition(x, y)
	self.X = x
	self.Y = y
end

function Rectangle:SetSize(w, h)
	self.Width = w
	self.Height = h	
end

function Rectangle:Intersects(rectangle)
	return 	self.X < rectangle.X + rectangle.Width 	and
			rectangle.X < self.X + self.Width 		and
			self.Y < rectangle.Y + rectangle.Height and
			rectangle.Y < self.Y + self.Height 	

end

return Rectangle;