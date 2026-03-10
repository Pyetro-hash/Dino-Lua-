local render = require("/src/Game/renderer")
local ground = require("/src/Instances/ground")

local game = {}

function game:load()
  ground:create()
end

function game:update(dt)
  ground:update(dt)
end

function game:draw()
 render:draw(ground)
end



return game