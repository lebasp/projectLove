local BulletView ={}
local bulletImg = love.graphics.newImage("shot.png")

function BulletView.Load(bullet)
	bullet.Img = bulletImg;
	bullet.Collider:SetSize(bullet.Img:getWidth(), bullet.Img:getHeight())
end

function BulletView.CheckOutOfView(bullet)
	local bulletWidth = bullet.Img:getWidth() * bullet.ScaleX
	local bulletHeight = bullet.Img:getHeight() * bullet.ScaleY

	if (bullet.X + bulletWidth) > love.graphics.getWidth() then
		return true
	elseif bullet.X < 0 then
		return true
	end

	if (bullet.Y + bulletHeight) > love.graphics.getHeight() then
		return true
	elseif bullet.Y < 0 then
		return true
	end

	return false
end

function BulletView.Draw(bullets)
	for i,bullet in ipairs(bullets) do
		love.graphics.draw(bullet.Img, bullet.X, bullet.Y, bullet.Rotation, bullet.ScaleX, bullet.ScaleY)	
	end
end

return BulletView