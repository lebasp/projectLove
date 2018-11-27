local ObjectPool = require("ObjectPool")
local GameObject = require("GameObject")
local Rectangle = require("Rectangle")


local EnemiesController = {}

local Enemies = {}
EnemiesController.Enemies = Enemies

local enemiesPool = nil

function EnemiesController.Load()
	enemiesPool = ObjectPool:new(GameObject)
end

function EnemiesController.Update(dt)
	if love.keyboard.isDown("1") then
		SpawnEnemy()
	end
end

function EnemiesController.KillEnemy(index)
	local removedEnemy = table.remove(Enemies, index)
	enemiesPool:Detroy(removedEnemy)
end

function SpawnEnemy()
	local enemy = enemiesPool:Get()
	enemy:SetPosition(0, 0)
	enemy.Collider = Rectangle:new()
	enemy.Collider:SetSize(20,  30)
	enemy.Tag = "Enemy"
	table.insert(Enemies, enemy)
end


function EnemiesController.Draw()
	for i,enemy in ipairs(Enemies) do
		love.graphics.setColor(255,255,255)
		love.graphics.rectangle("fill", enemy.X, enemy.Y, enemy.Collider.Width, enemy.Collider.Height)
	end
end

return EnemiesController 