local player = {
  x=32,
  y=0,
  vspeed=0,
  img= love.graphics.newImage("/assets/Player.png"),
  width=0,
  height=0,
  Onfloor = false
}

player.width = player.img:getWidth()
player.height = player.img:getHeight()

function player:gravity(gravty_force, dt)
  if self.Onfloor == false then
  self.vspeed = gravty_force
  self.y = self.y + (self.vspeed * dt)
  end
end

function player:update(gravity_force, dt)
  self:gravity(gravity_force, dt)
end


return player