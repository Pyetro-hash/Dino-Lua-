local player = {
  x=32,
  y=0,
  img= love.graphics.newImage("/assets/Player.png"),
  width=0,
  height=0,
}

player.width = player.img:getWidth()
player.height = player.img:getHeight()



return player