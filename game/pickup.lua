require('random')
require('gfx')
require('snakeHead')
require('snakeBody')

pickup = {}

function pickup:init()
  pickup.img = love.graphics.newImage("gfx/pickup-apple.png")
  pickup:spawn()
end

function pickup:draw()
  gfx:drawToGridOnBothScreens(pickup.img, pickup.x, pickup.y)
  
end

function pickup:update()
  if (head.x == pickup.x and head.y == pickup.y) then
    head:eat()
    pickup:spawn()
  end
end

function pickup:spawn()
  pickup.x = math.floor(random:range(0, 15))
  pickup.y = math.floor(random:range(0, 30))
  
  local timesTried = 0
  while (not (pickup:isFieldEmpty(pickup.x, pickup.y))) do
    pickup.x = (pickup.x + 1) % 15
    
    if (timesTried % 30 == 0) then
      pickup.y = (pickup.y + 1) %  30
    end
    
    timesTried = timesTried + 1
  end
  
  
end

function pickup:isFieldEmpty(x, y)
  for i, fragment in ipairs(body.fragments) do
    if (fragment.x == x and fragment.y == y) then
      return false
    end
  end
  
  if (head.x == x and head.y == y) then
    return false
  end
  
  return true
end
