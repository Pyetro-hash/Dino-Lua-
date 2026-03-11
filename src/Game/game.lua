local render = require("/src/Game/renderer")
local aabb = require("/src/Game/aabb")
local input = require("/src/Game/inputs")
local world = require("/src/Game/world")

local ground = require("/src/Instances/ground")
local player = require("/src/Instances/player")

local game = {}


function game:load()
  ground:create()
end

function game:update(dt)

  player:update(world.gravity, dt, input:get_inputs())
  ground:update(dt)

  if aabb:detect_collision_ground(player, ground) then
    player.Onfloor = true
    player.vspeed=0
    player.y = ground.y - player.height
  end
end

function game:draw()
  love.graphics.print(player.vspeed, 10, 0)
 render:draw(ground, player)
end



return game