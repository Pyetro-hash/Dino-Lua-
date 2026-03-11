local manage_input = {}

function manage_input:get_inputs()
  local key = love.keyboard.isDown("w")
   return key
end

return manage_input