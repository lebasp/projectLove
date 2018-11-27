local playerController = {}
local Player = require("Player")
local PlayerView = require("PlayerView")

local player = nil

function playerController.Load()
	player = Player:new()
	player:SetSpeed(500)
	player:SetScale(0.1, 0.1)
	playerController.player = player

	PlayerView.Load(player)
end

function playerController.Update(dt)
	if love.keyboard.isDown("right") then
		playerController.MovePlayer("right", dt)
	end
	
	if love.keyboard.isDown("left") then
		playerController.MovePlayer("left", dt)
	end

	if love.keyboard.isDown("up") then
		playerController.MovePlayer("up", dt)
	end

	if love.keyboard.isDown("down") then
		playerController.MovePlayer("down", dt)
	end
end

function playerController.MovePlayer(direction, dt)
	local x = player.X
	local y = player.Y

	if direction == "right" then
		x = player.X + (player.Speed * dt)
		changedMovment = true
	end
	
	if direction == "left" then
		x = player.X - (player.Speed * dt)
		changedMovment = true
	end

	if direction == "up" then
		y = player.Y - (player.Speed * dt)
		changedMovment = true
	end

	if direction == "down" then
		y = player.Y + (player.Speed * dt)
		changedMovment = true
	end

	if changedMovment then
		playerController.CheckPlayerBorder(x, y)
	end
end

function playerController.CheckPlayerBorder(x, y)
	playerWidth = player.Img:getWidth() * player.ScaleX
	playerHeight = player.Img:getHeight() * player.ScaleY

	if (x + playerWidth) > love.graphics.getWidth() then
		x = love.graphics.getWidth() - playerWidth
	elseif x < 0 then
		x = 0
	end

	if (y + playerHeight) > love.graphics.getHeight() then
		y = love.graphics.getHeight() - playerHeight
	elseif y < 0 then
		y = 0
	end

	player:SetPosition(x, y)
end

function playerController.Draw()
	PlayerView.Draw(player)
end

return playerController