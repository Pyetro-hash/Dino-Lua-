local renderer = {}

function renderer:draw_ground(ground)
    for i, tile in ipairs(ground.Tiles) do
    love.graphics.draw(ground.img, tile.x, tile.y)
  end
end




function renderer:draw(ground)
  self:draw_ground(ground)
end



return renderer