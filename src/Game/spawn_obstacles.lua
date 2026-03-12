local manage_obstacles = {
  speed = 300,
  x = 720,
  y = 430,
  obstacles = {}
}

function manage_obstacles:create(x,y,img_path)

  local img = love.graphics.newImage(img_path)

  local width = img:getWidth()
  local height = img:getHeight()

  y = y or self.y - height
  x = x or self.x

  local obj = {
    x = x,
    y = y,
    img = img,
    width = width,
    height = height
  }

  table.insert(self.obstacles, obj)

end


function manage_obstacles:Slide_Obstacles(dt)

  for index, obstacle in ipairs(self.obstacles) do

    obstacle.x = obstacle.x - self.speed * dt

    if obstacle.x + obstacle.width < 0 then
      table.remove(self.obstacles, index)
    end

  end

end


function manage_obstacles:reespawn()

  local randomX = math.random(0,75)

  self:create(randomX + 720, nil, "/assets/cactus.png")

end


function manage_obstacles:update(dt)

  self:Slide_Obstacles(dt)

  if #self.obstacles == 0 then
    self:reespawn()
  end

end


manage_obstacles:create(nil,nil,"/assets/cactus.png")

return manage_obstacles