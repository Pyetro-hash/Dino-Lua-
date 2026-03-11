local player = {
  x=32,
  y=0,
  vspeed=0,
  jump_force = 10,
  img= love.graphics.newImage("/assets/Player.png"),
  width=0,
  height=0,
  Onfloor = false
}

player.width = player.img:getWidth()
player.height = player.img:getHeight()
player.y = 430-player.height

function player:gravity(gravity_force, dt)
  if not self.Onfloor then
    self.vspeed = self.vspeed + gravity_force * dt
  end
  self.y = self.y + self.vspeed
end

function player:jump(jump_force)
  if self.Onfloor then
    self.vspeed = -jump_force
    self.Onfloor = false
  end
end

function player:update(gravity_force, dt,input)
  self:gravity(gravity_force, dt)
  if input then self:jump(self.jump_force) end
  player.Onfloor = false
end


return player