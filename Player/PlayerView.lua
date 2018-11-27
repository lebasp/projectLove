local PlayerView = {}

local playerImg = love.graphics.newImage("spaceship.png")

function PlayerView.Load(player)
	player.Img = playerImg
end

function PlayerView.Draw(Player)
	love.graphics.draw(Player.Img, Player.X, Player.Y, Player.Rotation, Player.ScaleX, Player.ScaleY)
end

return PlayerView