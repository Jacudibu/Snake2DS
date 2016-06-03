require('random')
require('gfx')
require('snakeHead')
require('snakeBody')

pickup = {}

function pickup:init()
  pickup.img = love.graphics.newImage("gfx/apple.png")
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
  
  while (not (pickup:isFieldEmpty(pickup.x, pickup.y))) do
    pickup.x = math.floor(random:range(0, 15))
    pickup.y = math.floor(random:range(0, 30))
  end
  
  print (pickup.x, pickup.y)
  
end

function pickup:isFieldEmpty(x, y)
  for i, fragment in ipairs(body.fragments) do
    if (fragment.x == pickup.x or fragment.y == pickup.y) then
      return false
    end
  end
  
  if (head.x == pickup.x or head.y == pickup.y) then
    return false
  end
  
  return true
end
