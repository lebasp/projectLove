local GameObject = require("GameObject")
local Rectangle = require("Rectangle")

local Player = GameObject:new()

function Player:new(o)
	o = o or GameObject:new()
	setmetatable(o, self)
	self.__index = self
	self.Speed = 0
	self.Collider = Rectangle:new()
	self.Tag = "Player"
	return o
end

function Player:SetSpeed(value)
	self.Speed = value
end

function Player:SetPosition(x, y)
	GameObject.SetPosition(self, x, y)
	self.Collider:SetPosition(x, y)
end

function Player:SetColliderSize(w, h)
	self.Collider:SetSize(w,h)
end

return Player;