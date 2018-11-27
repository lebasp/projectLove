local GameObject = require("GameObject")
local ObjectPool = require("ObjectPool")
local BulletView = require("BulletView")
local PlayerController = require("PlayerController")
local Rectangle = require("Rectangle")

local BulletController = {}

local Bullets = {}
BulletController.Bullets = Bullets

local canShotTimer = 0
local bulletPool = nil

function BulletController.Load()
	bulletPool = ObjectPool:new(GameObject)
end

function BulletController.CreateBullet(x, y)
	local bullet = bulletPool:Get()
	bullet:SetPosition(x, y)
	bullet:SetScale(0.075, 0.025)
	bullet.Speed = 1000
	bullet.Tag = "Bullet"
	bullet.Collider = Rectangle:new()
	table.insert(Bullets, bullet)

	BulletView.Load(bullet)
end

function BulletController.Update(dt)

	if canShotTimer > 0 then
		canShotTimer = canShotTimer - dt
	elseif love.keyboard.isDown("space") then
		BulletController.CreateBullet(PlayerController.player.X, PlayerController.player.Y)
		canShotTimer = 0.25
	end

	UpdateBulletsPosition(dt)
end

function UpdateBulletsPosition(dt)
	for i,bullet in ipairs(Bullets) do
		bullet:SetPosition(bullet.X, bullet.Y - (bullet.Speed * dt))
		bullet.Collider:SetPosition(bullet.X, bullet.Y)

		if BulletView.CheckOutOfView(bullet) then
			bulletPool:Detroy(bullet)
			table.remove(Bullets, i)
		end
	end
end

function BulletController.Draw()
	BulletView.Draw(Bullets)
end

return BulletController;