local playerController = require("PlayerController")
local bulletController = require("BulletController")
local enemiesController = require("EnemiesController")

local collisionController = require("CollisionController")

local canShotTimer = 0

function love.load()
	bulletController.Load()
	playerController.Load()
	enemiesController.Load()
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function love.update(dt)

	changedMovment = false

	if love.keyboard.isDown("escape") then
		love.event.quit()
	end

	playerController.Update(dt)
	bulletController.Update(dt)
	enemiesController.Update(dt)

	collisionController.Update(dt)
end

function love.draw()
	playerController.Draw()
	bulletController.Draw()
	enemiesController.Draw()
end