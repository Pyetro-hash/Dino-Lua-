local render = require("/src/Game/renderer")
local aabb = require("/src/Game/aabb")
local input = require("/src/Game/inputs")
local world = require("/src/Game/world")
local manage_obstacles = require("/src/Game/spawn_obstacles")
local menu = require("/src/Game/menu")

local ground = require("/src/Instances/ground")
local player = require("/src/Instances/player")

local game = {
  state = "Running"
}


function game:load()
  ground:create()
end

function game:update(dt)
  if self.state == "Menu" then
    if input:get_inputs("r") then menu:restart() end
    return
  end

  player:update(world.gravity, dt, input:get_inputs("space"))
  ground:update(dt)
  manage_obstacles:update(dt)

  if aabb:detect_collision_tables(player, ground.Tiles) then
    player.Onfloor = true
    player.vspeed=0
    player.y = ground.y - player.height
  end

  if aabb:detect_collision_tables(player, manage_obstacles.obstacles) then
    game.state = "Menu"
  end

end

function game:draw()
if self.state == "Menu" then
    menu:draw()
    return
  end

  render:draw(ground, player, manage_obstacles)
end


return game