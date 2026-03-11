local manage_aabb = {}

function manage_aabb:detect_collision_ground(obj1, obj2)
  for i, tile in ipairs(obj2.Tiles) do
    obj2 = tile
  end

  if obj1.x < obj2.x + obj2.width and
     obj1.x + obj1.width > obj2.x and
     obj1.y < obj2.y + obj2.height and
     obj1.y + obj1.height > obj2.y then
    return true
  end
end

function manage_aabb:detect_collision(obj1, obj2)
  if obj1.x < obj2.x + obj2.width and
     obj1.x + obj1.width > obj2.x and
     obj1.y < obj2.y + obj2.height and
     obj1.y + obj1.height > obj2.y then
    return true
  end
end


return manage_aabb