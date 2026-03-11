local ground_manager = {
  x=0,
  y=0,
  speed=200,
  img=love.graphics.newImage("/assets/Ground.png"),
  Tiles = {},
}

ground_manager.width = ground_manager.img:getWidth()
ground_manager.height = ground_manager.img:getHeight()
ground_manager.y = love.graphics.getHeight() - ground_manager.height

function ground_manager:create(x)

  local start = x or self.x

  for i = 0,1 do
    local tile = {
      x = start + self.width * i,
      y = self.y,
      img = self.img,
      width = self.width,
      height = self.height
    }

    table.insert(self.Tiles, tile)
  end

end

function ground_manager:move(dt)
  for i, tile in ipairs(self.Tiles) do
    tile.x = tile.x - (self.speed * dt)

    if tile.x < 0 - self.width then
      tile.x = tile.x + self.width*2
    end
  end
end



function ground_manager:update(dt)
  self:move(dt)
end

return ground_manager
