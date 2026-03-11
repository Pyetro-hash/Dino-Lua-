local render = require("/src/Game/renderer")
local aabb = require("/src/Game/aabb")
local ground = require("/src/Instances/ground")
local player = require("/src/Instances/player")

local game = {
  gravity = 100,
}





function game:load()
  ground:create()
end

function game:update(dt)
  if aabb:detect_collision_ground(player, ground)  then player.Onfloor = true end
    
  ground:update(dt)
  player:update(self.gravity, dt)
end

function game:draw()
 render:draw(ground, player)
end



return game