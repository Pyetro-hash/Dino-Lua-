local menu = {}

function menu:draw()
  local x = love.graphics.getWidth() / 2 - 40
  local y = love.graphics.getHeight() / 2

  love.graphics.print("Pressione R\npara iniciar",x,y)
end

function menu:restart()
  love.event.quit("restart")
end

return menu