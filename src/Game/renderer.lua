local renderer = {}

function renderer:draw_ground(ground)
    for i, tile in ipairs(ground.Tiles) do
    love.graphics.draw(ground.img, tile.x, tile.y)
  end
end

function renderer:draw_player(player)
  love.graphics.draw(player.img, player.x, player.y)
end



function renderer:draw(ground,player)
  self:draw_ground(ground)
  self:draw_player(player)
end



return renderer