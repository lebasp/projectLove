local enemiesController = require("EnemiesController")
local bulletController = require("BulletController")

local CollisionController  = {}

function CollisionController.Update(dt)

	for i,bullet in ipairs(bulletController.Bullets) do
		for j,enemy in ipairs(enemiesController.Enemies) do
			if bullet.Collider:Intersects(enemy.Collider) then
				enemiesController.KillEnemy(j)
			end
		end
	end

end

return CollisionController;