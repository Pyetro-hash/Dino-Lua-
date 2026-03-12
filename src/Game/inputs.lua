local manage_input = {}

function manage_input:get_inputs(key)
  local _key = love.keyboard.isDown(key)
   return _key
end

return manage_input