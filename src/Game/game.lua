local render = require("/src/Game/renderer")
local aabb = require("/src/Game/aabb")
local input = require("/src/Game/inputs")
local world = require("/src/Game/world")
local manage_obstacles = require("/src/Game/spawn_obstacles")

local ground = require("/src/Instances/ground")
local player = require("/src/Instances/player")

local game = {}


function game:load()
  ground:create()
end

function game:update(dt)

  player:update(world.gravity, dt, input:get_inputs())
  ground:update(dt)
  manage_obstacles:update(dt)

  if aabb:detect_collision_ground(player, ground) then
    player.Onfloor = true
    player.vspeed=0
    player.y = ground.y - player.height
  end
end

function game:draw()
 render:draw(ground, player, manage_obstacles)
end



return game